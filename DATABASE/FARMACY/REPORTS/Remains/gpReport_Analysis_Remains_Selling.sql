-- Function:  gpReport_Analysis_Remains_Selling

DROP FUNCTION IF EXISTS gpReport_Analysis_Remains_Selling (TDateTime, TDateTime, TVarChar);

CREATE OR REPLACE FUNCTION gpReport_Analysis_Remains_Selling (
  inStartDate TDateTime,
  inEndDate TDateTime,
  inSession TVarChar
)
RETURNS TABLE (
  UnitID integer,
  UnitName TVarChar,
  GoodsId integer,
  GoodsName TVarChar,
  PromoID tvarchar,
  GoodsGroupId integer,
  GoodsGroupName TVarChar,
  NDSKindId integer,
  NDSKindName TVarChar,
  JuridicalID integer,
  JuridicalName tvarchar,
  Amount TFloat,
  OutSaldo TFloat
) AS
$BODY$
  DECLARE vbUserId Integer;
BEGIN
   -- проверка прав пользователя на вызов процедуры
   -- vbUserId:= lpCheckRight(inSession, zc_Enum_Process_User());
   vbUserId:= lpGetUserBySession (inSession);


   -- для остальных...
   RETURN QUERY
    WITH
    tmpContainer AS (
                        SELECT AnalysisContainer.UnitID                                                      AS UnitID
                             , AnalysisContainer.GoodsId                                                     AS GoodsId
                             , Sum(AnalysisContainer.Saldo)::TFloat                                          AS Saldo
                        FROM AnalysisContainer AS AnalysisContainer
                        GROUP BY AnalysisContainer.UnitID
                               , AnalysisContainer.GoodsId),

    tmpAnalysisContainerItem AS (
                        SELECT AnalysisContainerItem.UnitID                                               AS UnitID
                             , AnalysisContainerItem.GoodsId                                              AS GoodsId


                             , Sum(CASE WHEN AnalysisContainerItem.OperDate <= inEndDate THEN 
                                 AnalysisContainerItem.AmountCheck END)                                  AS Amount
                             , Sum(CASE WHEN AnalysisContainerItem.OperDate > inEndDate THEN 
                                 AnalysisContainerItem.Saldo END)                                         AS Saldo
                        FROM AnalysisContainerItem AS AnalysisContainerItem
                        WHERE AnalysisContainerItem.OperDate >= inStartDate
                        GROUP BY AnalysisContainerItem.UnitID
                               , AnalysisContainerItem.GoodsId)

   SELECT
      Object_Unit.ObjectCode           AS UnitID
    , (Object_Unit.ValueData || COALESCE(' (' || Object_Parent.ValueData || ')', ''))::TVarChar  AS UnitName
    , Object_Goods.ObjectCode          AS GoodsId
    , Object_Goods.ValueData           AS GoodsName
    , Null::TVarChar                   AS PromoID
    , Object_GoodsGroup.ObjectCode     AS GoodsGroupId
    , Object_GoodsGroup.ValueData      AS GoodsGroupName
    , Object_NDSKind.ObjectCode        AS NDSKindId
    , Object_NDSKind.ValueData         AS NDSKindName
    , Null::Integer                    AS JuridicalID
    , Null::TVarChar                   AS JuridicalName
    , tmpAnalysisContainerItem.Amount::TFloat    AS Amount
    , (tmpContainer.Saldo - COALESCE(tmpAnalysisContainerItem.Saldo, 0))::TFloat AS OutSaldo
   FROM tmpContainer
     LEFT OUTER JOIN tmpAnalysisContainerItem AS tmpAnalysisContainerItem
        ON tmpAnalysisContainerItem.UnitId = tmpContainer.UnitId AND
           tmpAnalysisContainerItem.GoodsId = tmpContainer.GoodsId

     INNER JOIN Object AS Object_Unit
                       ON Object_Unit.ID = tmpContainer.UnitID
     INNER JOIN Object AS Object_Goods
                       ON Object_Goods.Id = tmpContainer.GoodsID

     LEFT JOIN ObjectLink AS ObjectLink_Goods_GoodsGroup
                          ON ObjectLink_Goods_GoodsGroup.ObjectId = Object_Goods.Id
                         AND ObjectLink_Goods_GoodsGroup.DescId = zc_ObjectLink_Goods_GoodsGroup()
     LEFT JOIN Object AS Object_GoodsGroup ON Object_GoodsGroup.Id = ObjectLink_Goods_GoodsGroup.ChildObjectId

     LEFT JOIN ObjectLink AS ObjectLink_Goods_NDSKind
                          ON ObjectLink_Goods_NDSKind.ObjectId = Object_Goods.Id
                         AND ObjectLink_Goods_NDSKind.DescId = zc_ObjectLink_Goods_NDSKind()
     LEFT JOIN Object AS Object_NDSKind ON Object_NDSKind.Id = ObjectLink_Goods_NDSKind.ChildObjectId
    
     LEFT JOIN ObjectLink AS ObjectLink_Unit_Parent
                          ON ObjectLink_Unit_Parent.ObjectId = Object_Unit.Id
                         AND ObjectLink_Unit_Parent.DescId = zc_ObjectLink_Unit_Parent()
     LEFT JOIN Object AS Object_Parent 
                      ON Object_Parent.Id = ObjectLink_Unit_Parent.ChildObjectId    

   WHERE ((tmpContainer.Saldo - COALESCE(tmpAnalysisContainerItem.Saldo, 0)) <> 0 OR
           COALESCE(tmpAnalysisContainerItem.Amount, 0) <> 0);
END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;

/*
 ИСТОРИЯ РАЗРАБОТКИ: ДАТА, АВТОР
               Шаблий О.В.
 11.08.18        *                                                                         *
 15.04.18        *                                                                         *

*/

-- тест
-- select * from gpReport_Analysis_Remains_Selling ('2018-04-01'::TDateTime, '2018-04-30'::TDateTime, '3')
