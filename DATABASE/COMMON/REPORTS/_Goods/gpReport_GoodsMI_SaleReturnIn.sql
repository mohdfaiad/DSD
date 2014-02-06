-- Function: gpReport_Goods_Movement ()

DROP FUNCTION IF EXISTS gpReport_Goods_Movement (TDateTime, TDateTime, Integer, Integer, TVarChar);
DROP FUNCTION IF EXISTS gpReport_GoodsMI_SaleReturnIn (TDateTime, TDateTime, Integer, Integer, Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpReport_GoodsMI_SaleReturnIn (
    IN inStartDate    TDateTime ,  
    IN inEndDate      TDateTime ,
    IN inDescId       Integer   ,  --sale(������� ����������) = 5, returnin (������� ����������) = 6
    IN inJuridicalId  Integer   , 
    IN inGoodsGroupId Integer   ,
    IN inSession      TVarChar    -- ������ ������������
)
RETURNS TABLE (GoodsGroupName TVarChar
              , GoodsCode Integer, GoodsName TVarChar
              , GoodsKindName TVarChar
              , TradeMarkName TVarChar
              , JuridicalCode Integer, JuridicalName TVarChar
              , PartnerCode Integer, PartnerName TVarChar
              , PaidKindName TVarChar
              , Sale_Summ TFloat, Sale_Amount_Weight TFloat , Sale_Amount_Sh TFloat, Sale_AmountPartner_Weight TFloat , Sale_AmountPartner_Sh TFloat
              , Return_Summ TFloat, Return_Amount_Weight TFloat , Return_Amount_Sh TFloat, Return_AmountPartner_Weight TFloat , Return_AmountPartner_Sh TFloat 
              )   
AS
$BODY$
BEGIN

  /*IF COALESCE (inJuridicalId, 0) = 0
   THEN
       RAISE EXCEPTION '������. �� ������� ��.�����!!!';
   END IF;*/
   
    -- ����������� �� ������
    CREATE TEMP TABLE _tmpGoods (GoodsId Integer) ON COMMIT DROP;
    IF inGoodsGroupId <> 0 
    THEN 
        INSERT INTO _tmpGoods (GoodsId)
           SELECT lfObject_Goods_byGoodsGroup.GoodsId
           FROM  lfSelect_Object_Goods_byGoodsGroup (inGoodsGroupId) AS lfObject_Goods_byGoodsGroup;
    ELSE 
        INSERT INTO _tmpGoods (GoodsId)
           SELECT Object.Id FROM Object WHERE DescId = zc_Object_Goods();
    END IF;


   -- ���������
    RETURN QUERY
    
    -- ������������ �� ��.����
    WITH tmpMovement AS (SELECT Movement.Id AS MovementId
                              , Movement.DescId AS MovementDescId
                              , ContainerLO_Juridical.ObjectId        AS JuridicalId 
                              , MovementLinkObject_Partner.ObjectId   AS PartnerId 
                              , ContainerLinkObject_PaidKind.ObjectId AS PaidKindId 
 
                         FROM ContainerLinkObject AS ContainerLO_Juridical

                              JOIN MovementItemContainer AS MIContainer ON MIContainer.ContainerId = ContainerLO_Juridical.ContainerId
                                                                       AND MIContainer.OperDate BETWEEN inStartDate AND inEndDate       
                             
                              JOIN Movement ON MIContainer.MovementId =  Movement.Id 
                                           AND Movement.DescId IN (SELECT zc_Movement_Sale() AS DescId UNION SELECT zc_Movement_ReturnIn() AS DescId)
                         
                              LEFT JOIN (SELECT zc_MovementLinkObject_To() AS DescId, zc_Movement_Sale() AS MovementDescId
                                      UNION
                                       SELECT zc_MovementLinkObject_From() AS DescId, zc_Movement_ReturnIn() AS MovementDescId
                                      ) AS tmpDesc_Partner ON tmpDesc_Partner.MovementDescId = Movement.DescId

                              LEFT JOIN MovementLinkObject AS MovementLinkObject_Partner
                                                           ON MovementLinkObject_Partner.MovementId = Movement.Id
                                                          AND MovementLinkObject_Partner.DescId = tmpDesc_Partner.DescId

                              LEFT JOIN ContainerLinkObject AS ContainerLinkObject_PaidKind
                                                            ON ContainerLinkObject_PaidKind.ContainerId = MIContainer.ContainerId
                                                           AND ContainerLinkObject_PaidKind.DescId = zc_ContainerLinkObject_PaidKind()
                             -- LEFT JOIN Object AS Object_PaidKind ON Object_PaidKind.Id = ContainerLinkObject_PaidKind.ObjectId 
                         WHERE ContainerLO_Juridical.DescId = zc_ContainerLinkObject_Juridical()
                          AND (ContainerLO_Juridical.ObjectId = inJuridicalId OR inJuridicalId = 0)                                           
                         GROUP BY Movement.Id 
                                , Movement.DescId 
                                , ContainerLO_Juridical.ObjectId 
                                , MovementLinkObject_Partner.ObjectId
                                , ContainerLinkObject_PaidKind.ObjectId   
                         )


     SELECT Object_GoodsGroup.ValueData AS GoodsGroupName 
          , Object_Goods.ObjectCode AS GoodsCode
          , Object_Goods.ValueData AS GoodsName
          , Object_GoodsKind.ValueData AS GoodsKindName
          , Object_TradeMark.ValueData  AS TradeMarkName

          , Object_Juridical.ObjectCode AS JuridicalCode
          , Object_Juridical.ValueData  AS JuridicalName
          , Object_Partner.ObjectCode   AS PartnerCode
          , Object_Partner.ValueData    AS PartnerName
          , Object_PaidKind.ValueData   AS PaidKindName

         , CAST ((tmpOperationGroup.Sale_Summ) AS TFloat) AS Sale_Summ
         , CAST ((tmpOperationGroup.Sale_Amount * (case when Object_Measure.Id = zc_Measure_Sh() then ObjectFloat_Weight.ValueData else 1 end )) AS TFloat) AS Sale_Amount_Weight 
         , CAST ((case when Object_Measure.Id = zc_Measure_Sh() then tmpOperationGroup.Sale_Amount else 0 end) AS TFloat) AS Sale_Amount_Sh 

         , CAST ((tmpOperationGroup.Sale_AmountPartner * (case when Object_Measure.Id = zc_Measure_Sh() then ObjectFloat_Weight.ValueData else 1 end )) AS TFloat) AS Sale_AmountPartner_Weight 
         , CAST ((case when Object_Measure.Id = zc_Measure_Sh() then tmpOperationGroup.Sale_AmountPartner else 0 end) AS TFloat) AS Sale_AmountPartner_Sh 



         , CAST ((tmpOperationGroup.Return_Summ) AS TFloat) AS Return_Summ
         , CAST ((tmpOperationGroup.Return_Amount * (case when Object_Measure.Id = zc_Measure_Sh() then ObjectFloat_Weight.ValueData else 1 end )) AS TFloat) AS Return_Amount_Weight 
         , CAST ((case when Object_Measure.Id = zc_Measure_Sh() then tmpOperationGroup.Return_Amount else 0 end) AS TFloat) AS Return_Amount_Sh 

         , CAST ((tmpOperationGroup.Return_AmountPartner * (case when Object_Measure.Id = zc_Measure_Sh() then ObjectFloat_Weight.ValueData else 1 end )) AS TFloat) AS Return_AmountPartner_Weight 
         , CAST ((case when Object_Measure.Id = zc_Measure_Sh() then tmpOperationGroup.Return_AmountPartner else 0 end) AS TFloat) AS Return_AmountPartner_Sh 


     FROM (SELECT tmpOperation.JuridicalId
                , tmpOperation.PartnerId
                , tmpOperation.PaidKindId

                , tmpOperation.GoodsId
                , tmpOperation.GoodsKindId

                , ABS (SUM (tmpOperation.Sale_Summ))   AS Sale_Summ
                , ABS (SUM (tmpOperation.Sale_Amount)) AS Sale_Amount

                , ABS (sum(tmpOperation.Return_Summ))   AS Return_Summ
                , ABS (sum(tmpOperation.Return_Amount)) AS Return_Amount

                , ABS (sum(tmpOperation.Sale_AmountPartner))   AS Sale_AmountPartner
                , ABS (sum(tmpOperation.Return_AmountPartner)) AS Return_AmountPartner
                
           FROM (SELECT tmpMovement.JuridicalId 
                      , tmpMovement.PartnerId
                      , tmpMovement.PaidKindId 
                      
                      , MovementItem.ObjectId AS GoodsId
                      , COALESCE (MILinkObject_GoodsKind.ObjectId, 0) AS GoodsKindId

                      , sum (CASE WHEN tmpMovement.MovementDescId = zc_Movement_Sale() THEN MIReport.Amount * CASE WHEN ReportContainerLink.AccountKindId = zc_Enum_AccountKind_Active() THEN 1 ELSE -1 END ELSE 0 END) AS Sale_Summ
                      , sum (CASE WHEN tmpMovement.MovementDescId = zc_Movement_ReturnIn() THEN MIReport.Amount * CASE WHEN ReportContainerLink.AccountKindId = zc_Enum_AccountKind_Active() THEN 1 ELSE -1 END ELSE 0 END) AS Return_Summ

                      , 0 AS  Sale_Amount
                      , 0 AS  Return_Amount
                      , 0 AS  Sale_AmountPartner
                      , 0 AS  Return_AmountPartner
                      
                 FROM tmpMovement
                      JOIN MovementItemReport AS MIReport ON MIReport.MovementId = tmpMovement.MovementId

                      JOIN ReportContainerLink ON ReportContainerLink.ReportContainerId = MIReport.ReportContainerId--ReportContainerLink.ContainerId = tmpListContainer.ContainerId
                      
                      JOIN (SELECT Container.Id AS ContainerId
                            FROM ContainerLinkObject AS ContainerLO_ProfitLoss
                                 JOIN Container ON Container.Id = ContainerLO_ProfitLoss.ContainerId
                                                AND Container.ObjectId = zc_Enum_Account_100301() -- ������� �������� �������
                            WHERE ContainerLO_ProfitLoss.DescId = zc_ContainerLinkObject_ProfitLoss()
                              AND ContainerLO_ProfitLoss.ObjectId in ( zc_Enum_ProfitLoss_10101(), zc_Enum_ProfitLoss_10102() -- ����� ����������: ��������� + ����
                                                                     , zc_Enum_ProfitLoss_10201(), zc_Enum_ProfitLoss_10202() -- ������ �� ������: ��������� + ����
                                                                     , zc_Enum_ProfitLoss_10301(), zc_Enum_ProfitLoss_10302() -- ������ ��������������: ��������� + ����
                                                                     , zc_Enum_ProfitLoss_10701(), zc_Enum_ProfitLoss_10702() -- ����� ���������: ��������� + ����
                                                                      )
                           ) AS tmpListContainer ON  tmpListContainer.ContainerId = ReportContainerLink.ContainerId 
                      

                      JOIN MovementItem ON MovementItem.Id = MIReport.MovementItemId
                                       AND MovementItem.DescId =  zc_MI_Master()
                      JOIN _tmpGoods ON _tmpGoods.GoodsId = MovementItem.ObjectId
           
                      LEFT JOIN MovementItemLinkObject AS MILinkObject_GoodsKind
                                                       ON MILinkObject_GoodsKind.MovementItemId = MovementItem.Id
                                                      AND MILinkObject_GoodsKind.DescId = zc_MILinkObject_GoodsKind()

                 GROUP BY tmpMovement.JuridicalId 
                        , tmpMovement.PartnerId
                        , tmpMovement.PaidKindId 
                        , MovementItem.ObjectId
                        , COALESCE (MILinkObject_GoodsKind.ObjectId, 0)
                        
                UNION ALL    
                 SELECT tmpMovement.JuridicalId 
                      , tmpMovement.PartnerId
                      , tmpMovement.PaidKindId 
                      
                      , Container.ObjectId AS GoodsId       
                      , COALESCE (ContainerLO_GoodsKind.ObjectId, 0) AS GoodsKindId

                      , 0 AS Sale_Summ
                      , 0 AS Return_Summ
                      
                      , SUM (CASE WHEN tmpMovement.MovementDescId = zc_Movement_Sale() THEN MIContainer.Amount ELSE 0 END) AS Sale_Amount
                      , SUM (CASE WHEN tmpMovement.MovementDescId = zc_Movement_ReturnIn() THEN MIContainer.Amount ELSE 0 END) AS Return_Amount
    
                      , SUM (CASE WHEN tmpMovement.MovementDescId = zc_Movement_Sale() THEN COALESCE (MIFloat_AmountPartner.ValueData, 0) ELSE 0 END) AS Sale_AmountPartner
                      , SUM (CASE WHEN tmpMovement.MovementDescId = zc_Movement_ReturnIn() THEN COALESCE (MIFloat_AmountPartner.ValueData, 0) ELSE 0 END) AS Return_AmountPartner



                 FROM tmpMovement
                      Join MovementItemContainer AS MIContainer 
                                                 ON MIContainer.MovementId = tmpMovement.MovementId
                                                AND MIContainer.DescId = zc_MIContainer_Count()

                      JOIN Container ON Container.Id = MIContainer.ContainerId
                      -- JOIN _tmpGoods ON _tmpGoods.GoodsId = Container.ObjectId

                      LEFT JOIN ContainerLinkObject AS ContainerLO_GoodsKind
                                                    ON ContainerLO_GoodsKind.ContainerId = Container.Id
                                                   AND ContainerLO_GoodsKind.DescId = zc_ContainerLinkObject_GoodsKind()
                      LEFT JOIN MovementItemFloat AS MIFloat_AmountPartner
                                                  ON MIFloat_AmountPartner.MovementItemId = MIContainer.MovementItemId
                                                 AND MIFloat_AmountPartner.DescId = zc_MIFloat_AmountPartner()
                 
                 
                 GROUP BY tmpMovement.JuridicalId 
                        , tmpMovement.PartnerId
                        , tmpMovement.PaidKindId 
                        , Container.ObjectId 
                        , COALESCE (ContainerLO_GoodsKind.ObjectId, 0) 
                      
               ) AS tmpOperation
               
           GROUP BY tmpOperation.JuridicalId
                  , tmpOperation.PartnerId
                  , tmpOperation.PaidKindId
                  , tmpOperation.GoodsId
                  , tmpOperation.GoodsKindId
                  
          ) AS tmpOperationGroup
          LEFT JOIN Object AS Object_Goods on Object_Goods.Id = tmpOperationGroup.GoodsId

          LEFT JOIN Object AS Object_GoodsKind ON Object_GoodsKind.Id = tmpOperationGroup.GoodsKindId

          LEFT JOIN ObjectLink AS ObjectLink_Goods_TradeMark
                               ON ObjectLink_Goods_TradeMark.ObjectId = Object_Goods.Id 
                              AND ObjectLink_Goods_TradeMark.DescId = zc_ObjectLink_Goods_TradeMark()
          LEFT JOIN Object AS Object_TradeMark ON Object_TradeMark.Id = ObjectLink_Goods_TradeMark.ChildObjectId

          LEFT JOIN ObjectLink AS ObjectLink_Goods_GoodsGroup
                               ON ObjectLink_Goods_GoodsGroup.ObjectId = Object_Goods.Id
                              AND ObjectLink_Goods_GoodsGroup.DescId = zc_ObjectLink_Goods_GoodsGroup()
          LEFT JOIN Object AS Object_GoodsGroup ON Object_GoodsGroup.Id = ObjectLink_Goods_GoodsGroup.ChildObjectId

          
          LEFT JOIN Object AS Object_Partner ON Object_Partner.Id = tmpOperationGroup.PartnerId

          LEFT JOIN Object AS Object_Juridical ON Object_Juridical.Id = tmpOperationGroup.JuridicalId 
         
          LEFT JOIN ObjectLink AS ObjectLink_Goods_Measure ON ObjectLink_Goods_Measure.ObjectId = Object_Goods.Id 
                                                          AND ObjectLink_Goods_Measure.DescId = zc_ObjectLink_Goods_Measure()
          LEFT JOIN Object AS Object_Measure ON Object_Measure.Id = ObjectLink_Goods_Measure.ChildObjectId

          LEFT JOIN Object AS Object_PaidKind ON Object_PaidKind.Id = tmpOperationGroup.PaidKindId 

          LEFT JOIN ObjectFloat AS ObjectFloat_Weight
                                ON ObjectFloat_Weight.ObjectId = Object_Goods.Id 
                               AND ObjectFloat_Weight.DescId = zc_ObjectFloat_Goods_Weight()

    ;
         
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION gpReport_GoodsMI_SaleReturnIn (TDateTime, TDateTime, Integer, Integer, Integer, TVarChar) OWNER TO postgres;


/*-------------------------------------------------------------------------------
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 06.02.14         * 
 
*/

-- ����
SELECT * FROM gpReport_GoodsMI_SaleReturnIn (inStartDate:= '01.12.2013', inEndDate:= '31.12.2013',  inDescId:= 5, inJuridicalId:= 0, inGoodsGroupId:= 0, inSession:= zfCalc_UserAdmin());-- �� ���� 15616

