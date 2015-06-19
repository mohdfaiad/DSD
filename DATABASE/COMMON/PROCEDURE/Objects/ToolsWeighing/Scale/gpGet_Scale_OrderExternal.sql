-- Function: gpGet_Scale_OrderExternal()

-- DROP FUNCTION IF EXISTS gpSelect_Scale_OrderExternal (TDateTime, TVarChar, TVarChar);
DROP FUNCTION IF EXISTS gpGet_Scale_OrderExternal (TDateTime, Integer, TVarChar, TVarChar);

CREATE OR REPLACE FUNCTION gpGet_Scale_OrderExternal(
    IN inOperDate       TDateTime   ,
    IN inBranchCode     Integer   , --
    IN inBarCode        TVarChar    ,
    IN inSession        TVarChar      -- ������ ������������
)
RETURNS TABLE (MovementId            Integer
             , MovementDescId_order  Integer
             , MovementId_get        Integer -- �������� ����������� !!!������ ��� ������!!!, ����� ����������� � MovementId
             , BarCode               TVarChar
             , InvNumber             TVarChar
             , InvNumberPartner      TVarChar

             , MovementDescNumber Integer -- !!!������ ��� zc_Movement_SendOnPrice!!!
             , MovementDescId     Integer -- !!!������ ��� �������� ���������!!!
             , FromId         Integer, FromCode         Integer, FromName       TVarChar
             , ToId           Integer, ToCode           Integer, ToName         TVarChar
             , PaidKindId     Integer, PaidKindName   TVarChar

             , PriceListId     Integer, PriceListCode     Integer, PriceListName     TVarChar
             , ContractId      Integer, ContractCode      Integer, ContractNumber    TVarChar, ContractTagName TVarChar
             , GoodsPropertyId Integer, GoodsPropertyCode Integer, GoodsPropertyName TVarChar

             , PartnerId_calc   Integer
             , PartnerCode_calc Integer
             , PartnerName_calc TVarChar
             , ChangePercent    TFloat
             , ChangePercentAmount TFloat

             , isEdiOrdspr      Boolean
             , isEdiInvoice     Boolean
             , isEdiDesadv      Boolean

             , isMovement    Boolean   -- ���������
             , isAccount     Boolean   -- ����
             , isTransport   Boolean   -- ���
             , isQuality     Boolean   -- ������������
             , isPack        Boolean   -- �����������
             , isSpec        Boolean   -- ������������
             , isTax         Boolean   -- ���������

             , OrderExternalName_master TVarChar
              )
AS
$BODY$
   DECLARE vbUserId     Integer;

   DECLARE vbBranchId   Integer;
BEGIN
   -- �������� ���� ������������ �� ����� ���������
   vbUserId:= lpGetUserBySession (inSession);


    -- ������������
    vbBranchId:= CASE WHEN inBranchCode > 100 THEN zc_Branch_Basis()
                      ELSE (SELECT Object.Id FROM Object WHERE Object.ObjectCode = inBranchCode and Object.DescId = zc_Object_Branch())
                 END;

    -- ���������
    RETURN QUERY
       WITH tmpMovement AS (SELECT tmpMovement.Id
                                 , tmpMovement.InvNumber
                                 , tmpMovement.DescId
                                 , tmpMovement.OperDate
                                 , MovementLinkObject_Contract.ObjectId       AS ContractId
                                 , MovementLinkObject_From.ObjectId           AS FromId
                                 , MovementLinkObject_To.ObjectId             AS ToId
                                 , ObjectLink_Partner_Juridical.ChildObjectId AS JuridicalId
                                 , zfCalc_GoodsPropertyId (MovementLinkObject_Contract.ObjectId, ObjectLink_Partner_Juridical.ChildObjectId) AS GoodsPropertyId
                                   -- ��� ����� ������� CASE ������������ ������ ��� ������
                                 , CASE WHEN ObjectLink_UnitFrom_Branch.ChildObjectId = vbBranchId
                                             THEN NULL -- FALSE -- ��� ������� - ������ � ���� !!!�����������!!!
                                        WHEN ObjectLink_UnitTo_Branch.ChildObjectId = vbBranchId
                                             THEN TRUE -- ��� ������� - ������ �� ����
                                        WHEN ObjectLink_UnitTo_Branch.ChildObjectId > 0
                                             THEN NULL -- FALSE -- ��� �������� - ������ � ���� !!!�����������!!!
                                        WHEN ObjectLink_UnitFrom_Branch.ChildObjectId > 0
                                             THEN TRUE -- ��� �������� - ������ �� ����
                                   END AS isSendOnPriceIn
                            FROM (SELECT Movement.Id
                                       , Movement.InvNumber
                                       , Movement.DescId
                                       , Movement.OperDate
                                  FROM (SELECT zfConvert_StringToNumber (SUBSTR (inBarCode, 4, 13-4)) AS MovementId WHERE CHAR_LENGTH (inBarCode) >= 13
                                       ) AS tmp
                                       INNER JOIN Movement ON Movement.Id = tmp.MovementId
                                                          AND Movement.DescId IN (zc_Movement_OrderExternal(), zc_Movement_SendOnPrice())
                                                          AND Movement.OperDate BETWEEN inOperDate - INTERVAL '1 DAY' AND inOperDate + INTERVAL '1 DAY'
                                                          AND Movement.StatusId <> zc_Enum_Status_Erased()
                                 UNION
                                  SELECT Movement.Id
                                       , Movement.InvNumber
                                       , Movement.DescId
                                       , Movement.OperDate
                                  FROM (SELECT inBarCode AS BarCode WHERE CHAR_LENGTH (inBarCode) > 0 AND CHAR_LENGTH (inBarCode) < 13
                                       ) AS tmp
                                       INNER JOIN Movement ON Movement.InvNumber = tmp.BarCode
                                                          AND Movement.DescId IN (zc_Movement_OrderExternal(), zc_Movement_SendOnPrice())
                                                          AND Movement.OperDate BETWEEN inOperDate - INTERVAL '1 DAY' AND inOperDate + INTERVAL '1 DAY'
                                                          AND Movement.StatusId <> zc_Enum_Status_Erased()
                                 ) AS tmpMovement
                                 LEFT JOIN MovementLinkObject AS MovementLinkObject_Contract
                                                              ON MovementLinkObject_Contract.MovementId = tmpMovement.Id
                                                             AND MovementLinkObject_Contract.DescId = zc_MovementLinkObject_Contract()
                                 LEFT JOIN MovementLinkObject AS MovementLinkObject_From
                                                              ON MovementLinkObject_From.MovementId = tmpMovement.Id
                                                             AND MovementLinkObject_From.DescId = zc_MovementLinkObject_From()
                                 LEFT JOIN MovementLinkObject AS MovementLinkObject_To
                                                              ON MovementLinkObject_To.MovementId = tmpMovement.Id
                                                             AND MovementLinkObject_To.DescId = zc_MovementLinkObject_To()
                                 LEFT JOIN ObjectLink AS ObjectLink_Partner_Juridical
                                                      ON ObjectLink_Partner_Juridical.ObjectId = MovementLinkObject_From.ObjectId
                                                     AND ObjectLink_Partner_Juridical.DescId = zc_ObjectLink_Partner_Juridical()
                                 LEFT JOIN ObjectLink AS ObjectLink_UnitFrom_Branch
                                                      ON ObjectLink_UnitFrom_Branch.ObjectId = MovementLinkObject_From.ObjectId
                                                     AND ObjectLink_UnitFrom_Branch.DescId = zc_ObjectLink_Unit_Branch()
                                 LEFT JOIN ObjectLink AS ObjectLink_UnitTo_Branch
                                                      ON ObjectLink_UnitTo_Branch.ObjectId = MovementLinkObject_To.ObjectId
                                                     AND ObjectLink_UnitTo_Branch.DescId = zc_ObjectLink_Unit_Branch()
                           )
           , tmpMovement_find AS (SELECT tmpMovement.Id
                                       , MovementLinkMovement_Order.MovementId AS MovementId_get
                                  FROM tmpMovement
                                       INNER JOIN MovementLinkMovement AS MovementLinkMovement_Order
                                                                       ON MovementLinkMovement_Order.MovementChildId = tmpMovement.Id
                                                                      AND MovementLinkMovement_Order.DescId = zc_MovementLinkMovement_Order()
                                       INNER JOIN Movement ON Movement.Id = MovementLinkMovement_Order.MovementId
                                                          AND Movement.DescId = zc_Movement_WeighingPartner()
                                                          AND Movement.StatusId = zc_Enum_Status_UnComplete()
                                       INNER JOIN MovementLinkObject
                                               AS MovementLinkObject_User
                                               ON MovementLinkObject_User.MovementId = Movement.Id
                                              AND MovementLinkObject_User.DescId = zc_MovementLinkObject_User()
                                              AND MovementLinkObject_User.ObjectId = vbUserId
                                 )
           , tmpJuridicalPrint AS (SELECT tmpGet.Id AS JuridicalId
                                        , tmpGet.isMovement
                                        , tmpGet.isAccount
                                        , tmpGet.isTransport
                                        , tmpGet.isQuality
                                        , tmpGet.isPack
                                        , tmpGet.isSpec
                                        , tmpGet.isTax
                                   FROM (SELECT tmpMovement.JuridicalId FROM tmpMovement WHERE tmpMovement.DescId = zc_Movement_OrderExternal() LIMIT 1) AS tmp
                                        INNER JOIN lpGet_Object_Juridical_PrintKindItem ((SELECT tmpMovement.JuridicalId FROM tmpMovement LIMIT 1)) AS tmpGet ON tmpGet.Id = tmp.JuridicalId
                                  )
      , tmpMovementDescNumber AS (SELECT tmpSelect.Number AS MovementDescNumber
                                  FROM (SELECT CASE WHEN Object_From.DescId = zc_Object_ArticleLoss()
                                                         THEN zc_Movement_Loss()
                                                    ELSE tmpMovement.DescId
                                               END AS MovementDescId
                                             , tmpMovement.FromId
                                             , tmpMovement.ToId
                                             , tmpMovement.isSendOnPriceIn
                                        FROM tmpMovement
                                             LEFT JOIN Object AS Object_From ON Object_From.Id = tmpMovement.FromId
                                        WHERE tmpMovement.DescId = zc_Movement_SendOnPrice()
                                           OR Object_From.DescId = zc_Object_ArticleLoss()
                                       ) AS tmp
                                       INNER JOIN gpSelect_Object_ToolsWeighing_MovementDesc (inBranchCode:= inBranchCode
                                                                                            , inSession   := inSession
                                                                                             ) AS tmpSelect ON tmpSelect.MovementDescId = tmp.MovementDescId
                                                                                                           AND tmpSelect.FromId = CASE WHEN tmp.MovementDescId = zc_Movement_Loss()
                                                                                                                                            THEN tmp.ToId -- ��� ��������
                                                                                                                                       WHEN vbBranchId = zc_Branch_Basis() AND tmp.isSendOnPriceIn = FALSE
                                                                                                                                            THEN tmp.FromId -- ��� �������� - ������ � ����
                                                                                                                                       WHEN vbBranchId = zc_Branch_Basis() AND tmp.isSendOnPriceIn = TRUE
                                                                                                                                            THEN 0 -- ��� �������� - ������ �� ����, � ����� 0 �.�. �� ���������� �� �����������
                                                                                                                                       WHEN tmp.isSendOnPriceIn = TRUE
                                                                                                                                            THEN tmp.FromId -- ��� ������� - ������ �� ����, � ����� FromId �.�. �� ����������
                                                                                                                                       WHEN tmp.isSendOnPriceIn = FALSE
                                                                                                                                            THEN tmp.FromId -- ��� ��� ������� - ������ � ����
                                                                                                                                  END
                                                                                                           AND tmpSelect.ToId   = CASE WHEN tmp.MovementDescId = zc_Movement_Loss()
                                                                                                                                            THEN 0 -- ��� �������� ����� 0 �.�. �� ���������� �� �����������
                                                                                                                                       WHEN vbBranchId = zc_Branch_Basis() AND tmp.isSendOnPriceIn = FALSE
                                                                                                                                            THEN 0 -- ��� �������� - ������ � ����, � ����� 0 �.�. �� ���������� �� �����������
                                                                                                                                       WHEN vbBranchId = zc_Branch_Basis() AND tmp.isSendOnPriceIn = TRUE
                                                                                                                                            THEN tmp.ToId -- ��� �������� - ������ �� ����
                                                                                                                                       WHEN tmp.isSendOnPriceIn = TRUE
                                                                                                                                            THEN tmp.ToId -- ��� ������� - ������ �� ����
                                                                                                                                       WHEN tmp.isSendOnPriceIn = FALSE
                                                                                                                                            THEN tmp.ToId -- ��� ��� ������� - ������ � ����, � ����� ToId �.�. �� ����������
                                                                                                                                  END
                                 )
       SELECT tmpMovement.Id                                 AS MovementId
            , tmpMovement.DescId                             AS MovementDescId_order
            , tmpMovement_find.MovementId_get                AS MovementId_get
            , inBarCode                                      AS BarCode
            , tmpMovement.InvNumber                          AS InvNumber
            , MovementString_InvNumberPartner.ValueData      AS InvNumberPartner

            , tmpMovementDescNumber.MovementDescNumber       AS MovementDescNumber -- !!!������ ��� zc_Movement_SendOnPrice!!!
            , CASE WHEN Object_From.DescId = zc_Object_ArticleLoss()
                        THEN zc_Movement_Loss()
                   WHEN tmpMovement.DescId = zc_Movement_OrderExternal()
                        THEN zc_Movement_Sale()
                   ELSE tmpMovement.DescId
              END AS MovementDescId
            , Object_From.Id                                 AS FromId
            , Object_From.ObjectCode                         AS FromCode
            , Object_From.ValueData                          AS FromName
            , Object_To.Id                                   AS ToId
            , Object_To.ObjectCode                           AS ToCode
            , Object_To.ValueData                            AS ToName
            , Object_PaidKind.Id                             AS PaidKindId
            , Object_PaidKind.ValueData                      AS PaidKindName

            , Object_PriceList.Id                            AS PriceListId
            , Object_PriceList.ObjectCode                    AS PriceListCode
            , Object_PriceList.ValueData                     AS PriceListName
            , View_Contract_InvNumber.ContractId             AS ContractId
            , View_Contract_InvNumber.ContractCode           AS ContractCode
            , View_Contract_InvNumber.InvNumber              AS ContractNumber
            , View_Contract_InvNumber.ContractTagName        AS ContractTagName

            , Object_GoodsProperty.Id                        AS GoodsPropertyId
            , Object_GoodsProperty.ObjectCode                AS GoodsPropertyCode
            , Object_GoodsProperty.ValueData                 AS GoodsPropertyName

            , CASE WHEN tmpMovement.DescId = zc_Movement_OrderExternal()
                        THEN Object_From.Id
                   WHEN tmpMovement.DescId = zc_Movement_SendOnPrice() AND tmpMovement.isSendOnPriceIn = TRUE
                        THEN Object_From.Id
                   WHEN tmpMovement.DescId = zc_Movement_SendOnPrice() AND tmpMovement.isSendOnPriceIn = FALSE
                        THEN Object_To.Id
              END :: Integer AS PartnerId_calc
            , CASE WHEN tmpMovement.DescId = zc_Movement_OrderExternal()
                        THEN Object_From.ObjectCode
                   WHEN tmpMovement.DescId = zc_Movement_SendOnPrice() AND tmpMovement.isSendOnPriceIn = TRUE
                        THEN Object_From.ObjectCode
                   WHEN tmpMovement.DescId = zc_Movement_SendOnPrice() AND tmpMovement.isSendOnPriceIn = FALSE
                        THEN Object_To.ObjectCode
              END :: Integer AS PartnerCode_calc
            , CASE WHEN tmpMovement.DescId = zc_Movement_OrderExternal()
                        THEN Object_From.ValueData
                   WHEN tmpMovement.DescId = zc_Movement_SendOnPrice() AND tmpMovement.isSendOnPriceIn = TRUE
                        THEN Object_From.ValueData
                   WHEN tmpMovement.DescId = zc_Movement_SendOnPrice() AND tmpMovement.isSendOnPriceIn = FALSE
                        THEN Object_To.ValueData
              END :: TVarChar AS PartnerName_calc

            , MovementFloat_ChangePercent.ValueData AS ChangePercent
            , (SELECT tmp.ChangePercentAmount FROM gpGet_Scale_Partner (inOperDate, zc_Movement_Sale(), -1 * Object_From.Id, zc_Enum_InfoMoney_30101(), Object_PaidKind.Id, inSession) AS tmp WHERE tmp.ContractId = View_Contract_InvNumber.ContractId) AS ChangePercentAmount

            , COALESCE (ObjectBoolean_Partner_EdiOrdspr.ValueData, FALSE)  :: Boolean AS isEdiOrdspr
            , COALESCE (ObjectBoolean_Partner_EdiInvoice.ValueData, FALSE) :: Boolean AS isEdiInvoice
            , COALESCE (ObjectBoolean_Partner_EdiDesadv.ValueData, FALSE)  :: Boolean AS isEdiDesadv

            , CASE WHEN tmpJuridicalPrint.isPack = TRUE OR tmpJuridicalPrint.isSpec = TRUE THEN COALESCE (tmpJuridicalPrint.isMovement, FALSE) ELSE TRUE END :: Boolean AS isMovement
            , COALESCE (tmpJuridicalPrint.isAccount,   FALSE) :: Boolean AS isAccount
            , COALESCE (tmpJuridicalPrint.isTransport, FALSE) :: Boolean AS isTransport
            , COALESCE (tmpJuridicalPrint.isQuality,   FALSE) :: Boolean AS isQuality
            , COALESCE (tmpJuridicalPrint.isPack,      FALSE) :: Boolean AS isPack
            , COALESCE (tmpJuridicalPrint.isSpec,      FALSE) :: Boolean AS isSpec
            , COALESCE (tmpJuridicalPrint.isTax,       FALSE) :: Boolean AS isTax

            , ('� <' || tmpMovement.InvNumber || '>' || ' �� <' || DATE (tmpMovement.OperDate) :: TVarChar || '>' || ' '|| COALESCE (Object_Personal.ValueData, '')) :: TVarChar AS OrderExternalName_master

       FROM tmpMovement
            LEFT JOIN tmpMovement_find ON tmpMovement_find.Id = tmpMovement.Id
            LEFT JOIN tmpMovementDescNumber ON tmpMovementDescNumber.MovementDescNumber > 0
            LEFT JOIN tmpJuridicalPrint ON tmpJuridicalPrint.JuridicalId = tmpMovement.JuridicalId

            LEFT JOIN Object AS Object_From ON Object_From.Id = tmpMovement.FromId
            LEFT JOIN MovementLinkObject AS MovementLinkObject_To
                                         ON MovementLinkObject_To.MovementId = tmpMovement.Id
                                        AND MovementLinkObject_To.DescId = zc_MovementLinkObject_To()
            LEFT JOIN Object AS Object_To ON Object_To.Id = MovementLinkObject_To.ObjectId

            LEFT JOIN Object_Contract_InvNumber_View AS View_Contract_InvNumber ON View_Contract_InvNumber.ContractId = tmpMovement.ContractId
            LEFT JOIN Object AS Object_GoodsProperty ON Object_GoodsProperty.Id = tmpMovement.GoodsPropertyId

            LEFT JOIN MovementLinkObject AS MovementLinkObject_PaidKind
                                         ON MovementLinkObject_PaidKind.MovementId = tmpMovement.Id
                                        AND MovementLinkObject_PaidKind.DescId = zc_MovementLinkObject_PaidKind()
                                        AND tmpMovement.DescId = zc_Movement_OrderExternal()
            LEFT JOIN Object AS Object_PaidKind ON Object_PaidKind.Id = MovementLinkObject_PaidKind.ObjectId

            LEFT JOIN MovementLinkObject AS MovementLinkObject_PriceList
                                         ON MovementLinkObject_PriceList.MovementId = tmpMovement.Id
                                        AND MovementLinkObject_PriceList.DescId = zc_MovementLinkObject_PriceList()
            LEFT JOIN Object AS Object_PriceList ON Object_PriceList.Id = MovementLinkObject_PriceList.ObjectId

            LEFT JOIN MovementFloat AS MovementFloat_ChangePercent
                                    ON MovementFloat_ChangePercent.MovementId =  tmpMovement.Id
                                   AND MovementFloat_ChangePercent.DescId = zc_MovementFloat_ChangePercent()
            LEFT JOIN MovementString AS MovementString_InvNumberPartner
                                     ON MovementString_InvNumberPartner.MovementId =  tmpMovement.Id
                                    AND MovementString_InvNumberPartner.DescId = zc_MovementString_InvNumberPartner()

            LEFT JOIN MovementLinkMovement AS MovementLinkMovement_Order
                                           ON MovementLinkMovement_Order.MovementId = tmpMovement.Id
                                          AND MovementLinkMovement_Order.DescId = zc_MovementLinkMovement_Order()

            LEFT JOIN ObjectBoolean AS ObjectBoolean_Partner_EdiOrdspr
                                    ON ObjectBoolean_Partner_EdiOrdspr.ObjectId =  tmpMovement.FromId
                                   AND ObjectBoolean_Partner_EdiOrdspr.DescId = zc_ObjectBoolean_Partner_EdiOrdspr()
                                   AND MovementLinkMovement_Order.MovementChildId > 0 -- �������� �� ����� ������ � EDI
            LEFT JOIN ObjectBoolean AS ObjectBoolean_Partner_EdiInvoice
                                    ON ObjectBoolean_Partner_EdiInvoice.ObjectId =  tmpMovement.FromId
                                   AND ObjectBoolean_Partner_EdiInvoice.DescId = zc_ObjectBoolean_Partner_EdiInvoice()
                                   AND MovementLinkMovement_Order.MovementChildId > 0 -- �������� �� ����� ������ � EDI
            LEFT JOIN ObjectBoolean AS ObjectBoolean_Partner_EdiDesadv
                                    ON ObjectBoolean_Partner_EdiDesadv.ObjectId =  tmpMovement.FromId
                                   AND ObjectBoolean_Partner_EdiDesadv.DescId = zc_ObjectBoolean_Partner_EdiDesadv()
                                   AND MovementLinkMovement_Order.MovementChildId > 0 -- �������� �� ����� ������ � EDI

            LEFT JOIN MovementLinkObject AS MovementLinkObject_Personal
                                         ON MovementLinkObject_Personal.MovementId = tmpMovement.Id
                                        AND MovementLinkObject_Personal.DescId = zc_MovementLinkObject_Personal()
            LEFT JOIN Object AS Object_Personal ON Object_Personal.Id = MovementLinkObject_Personal.ObjectId
      ;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION gpGet_Scale_OrderExternal (TDateTime, Integer, TVarChar, TVarChar) OWNER TO postgres;

/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 18.01.15                                        *
*/

-- ����
-- SELECT * FROM gpGet_Scale_OrderExternal ('27.02.2015', 1, '3535', zfCalc_UserAdmin())
-- SELECT * FROM gpGet_Scale_OrderExternal ('28.05.2015', 1, '2020017207290', zfCalc_UserAdmin())
