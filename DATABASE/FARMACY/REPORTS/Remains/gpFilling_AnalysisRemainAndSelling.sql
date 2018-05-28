-- Function:  gpFilling_AnalysisRemainAndSelling()

DROP FUNCTION IF EXISTS gpFilling_AnalysisRemainAndSelling ();

CREATE OR REPLACE FUNCTION gpFilling_AnalysisRemainAndSelling ()
RETURNS VOID
AS
$BODY$
   DECLARE vbUserId Integer;
   DECLARE vbObjectId Integer;
BEGIN

/*
  DROP TABLE IF EXISTS AnalysisRemainsUnitTemp;
  CREATE TABLE AnalysisRemainsUnitTemp
  (
    Id               SERIAL    NOT NULL PRIMARY KEY,
    UnitID           INTEGER,
    UnitName         tvarchar,
    GoodsId          INTEGER,
    GoodsName        tvarchar,
    PromoID          tvarchar,
    GoodsGroupId     INTEGER,
    GoodsGroupName   tvarchar,
    NDSKindId        INTEGER,
    NDSKindName      tvarchar,
    JuridicalID      INTEGER,
    JuridicalName    tvarchar,
    Saldo            TFloat    NOT NULL DEFAULT 0
  )
  WITH (
    OIDS=FALSE
  );
  ALTER TABLE AnalysisRemainsUnitTemp
    OWNER TO postgres;

    -- Заполняем текуший остаток
  INSERT INTO AnalysisRemainsUnitTemp (
    UnitID,
    UnitName,
    GoodsId,
    GoodsName,
    PromoID,
    GoodsGroupId,
    GoodsGroupName,
    NDSKindId,
    NDSKindName,
    JuridicalID,
    JuridicalName,
    Saldo)

  WITH
    tmpGoodsPromo AS (SELECT DISTINCT
                                 Movement.InvNumber AS PromoID
                                 , Object_Juridical.Id AS JuridicalId
                                 , MI_Goods.ObjectId  AS GoodsId        -- здесь товар
                                 , MovementDate_StartPromo.ValueData  AS StartDate_Promo
                                 , MovementDate_EndPromo.ValueData    AS EndDate_Promo
                            FROM Movement
                              INNER JOIN MovementLinkObject AS MovementLinkObject_Maker
                                                            ON MovementLinkObject_Maker.MovementId = Movement.Id
                                                           AND MovementLinkObject_Maker.DescId = zc_MovementLinkObject_Maker()
                              INNER JOIN MovementDate AS MovementDate_StartPromo
                                                      ON MovementDate_StartPromo.MovementId = Movement.Id
                                                     AND MovementDate_StartPromo.DescId = zc_MovementDate_StartPromo()
                              INNER JOIN MovementDate AS MovementDate_EndPromo
                                                      ON MovementDate_EndPromo.MovementId = Movement.Id
                                                     AND MovementDate_EndPromo.DescId = zc_MovementDate_EndPromo()
                              INNER JOIN MovementItem AS MI_Goods ON MI_Goods.MovementId = Movement.Id
                                                                 AND MI_Goods.DescId = zc_MI_Master()
                                                                 AND MI_Goods.isErased = FALSE
                              INNER JOIN MovementItem AS MI_Promo ON MI_Promo.MovementId = Movement.Id
                                                                 AND MI_Promo.DescId = zc_MI_Child()
                                                                 AND MI_Promo.isErased = FALSE
                              LEFT JOIN Object AS Object_Juridical ON Object_Juridical.Id = MI_Promo.ObjectId
                            WHERE Movement.StatusId = zc_Enum_Status_Complete()
                              AND Movement.DescId = zc_Movement_Promo()
                       ),
    tmpGoodsJPromo AS (SELECT
                              Container.ID                  AS ContainerID
                            , Max(tmpGoodsPromo.PromoID)    AS PromoID
                            , Max(Movement.Id)                   AS MovementId
                          FROM Container
                              INNER JOIN MovementItemContainer ON MovementItemContainer.ContainerId = Container.Id
                                                              AND MovementItemContainer.movementdescid = zc_Movement_Income()
                              INNER JOIN Movement ON Movement.Id = MovementItemContainer.movementid
                              LEFT OUTER JOIN MovementLinkObject AS MovementLinkObject_From
                                                                 ON MovementLinkObject_From.MovementId = Movement.Id
                                                                AND MovementLinkObject_From.DescId = zc_MovementLinkObject_From()
                              LEFT OUTER JOIN tmpGoodsPromo AS tmpGoodsPromo
                                  ON tmpGoodsPromo.JuridicalId = MovementLinkObject_From.ObjectId
                                 AND tmpGoodsPromo.GoodsId = Container.ObjectId
                                 AND tmpGoodsPromo.StartDate_Promo <= MovementItemContainer.OperDate
                                 AND tmpGoodsPromo.EndDate_Promo >= DATE_TRUNC ('DAY',  MovementItemContainer.Operdate)
                           WHERE Container.DescId = zc_Container_count()
                           GROUP BY Container.ID),
    tmpGoodsJuridical AS (SELECT
                              tmpGoodsJPromo.ContainerID    AS ContainerID
                            , tmpGoodsJPromo.PromoID        AS PromoID
                            , Object_From.objectcode        AS JuridicalID
                            , Object_From.valuedata         AS JuridicalName
                          FROM tmpGoodsJPromo
                              LEFT OUTER JOIN MovementLinkObject AS MovementLinkObject_From
                                                                 ON MovementLinkObject_From.MovementId = tmpGoodsJPromo.MovementId
                                                                AND MovementLinkObject_From.DescId = zc_MovementLinkObject_From()
                              LEFT OUTER JOIN Object AS Object_From
                                                     ON MovementLinkObject_From.ObjectId = Object_From.Id)



  SELECT
      Object_Unit.ObjectCode           AS UnitID
    , Object_Unit.ValueData || COALESCE(' (' || Object_Parent.ValueData || ')', '')           AS UnitName
    , Object_Goods.ObjectCode          AS GoodsId
    , Object_Goods.ValueData           AS GoodsName
    , tmpGoodsJuridical.PromoID        AS PromoID
    , Object_GoodsGroup.ObjectCode     AS GoodsGroupId
    , Object_GoodsGroup.ValueData      AS GoodsGroupName
    , Object_NDSKind.ObjectCode        AS NDSKindId
    , Object_NDSKind.ValueData         AS NDSKindName
    , tmpGoodsJuridical.JuridicalID    AS JuridicalID
    , tmpGoodsJuridical.JuridicalName  AS JuridicalName
    , Sum(Container.Amount)
  FROM Container
    LEFT OUTER JOIN tmpGoodsJuridical AS tmpGoodsJuridical
                                      ON tmpGoodsJuridical.ContainerID = Container.Id
    INNER JOIN Object AS Object_Unit
                        ON Object_Unit.ID = Container.WhereObjectId
    INNER JOIN Object AS Object_Goods
                        ON Object_Goods.Id = Container.ObjectId

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


  WHERE Container.DescId = zc_Container_count()
  GROUP BY Container.WhereObjectId, Container.ObjectId, tmpGoodsJuridical.PromoID,
    Object_Unit.ObjectCode, Object_Unit.ValueData, Object_Parent.ValueData, Object_Goods.ObjectCode,Object_Goods.ValueData,
    Object_GoodsGroup.ObjectCode, Object_GoodsGroup.ValueData, Object_NDSKind.ObjectCode, Object_NDSKind.ValueData,
    tmpGoodsJuridical.JuridicalID, tmpGoodsJuridical.JuridicalName;

  DROP TABLE IF EXISTS AnalysisSellingDeyUnitTemp;
  CREATE TABLE IF NOT EXISTS AnalysisSellingDeyUnitTemp
  (
    Id          SERIAL    NOT NULL PRIMARY KEY,
    OperDate    TDateTime,
    UnitID      Integer,
    GoodsId     Integer,
    PromoID     TVarchar,
    JuridicalID Integer,
    Amount      TFloat    NOT NULL DEFAULT 0,
    Saldo       TFloat    NOT NULL DEFAULT 0
  )
  WITH (
    OIDS=FALSE
  );
  ALTER TABLE AnalysisSellingDeyUnitTemp
    OWNER TO postgres;

    -- Заполняем реализацию и остатки по дням
  INSERT INTO  AnalysisSellingDeyUnitTemp (OperDate, UnitID, GoodsId, PromoID, JuridicalID, Amount, Saldo)

  WITH
    tmpGoodsPromo AS (SELECT DISTINCT
                                 Movement.InvNumber AS PromoID
                                 , Object_Juridical.Id AS JuridicalId
                                 , MI_Goods.ObjectId  AS GoodsId        -- здесь товар
                                 , MovementDate_StartPromo.ValueData  AS StartDate_Promo
                                 , MovementDate_EndPromo.ValueData    AS EndDate_Promo
                            FROM Movement
                              INNER JOIN MovementLinkObject AS MovementLinkObject_Maker
                                                            ON MovementLinkObject_Maker.MovementId = Movement.Id
                                                           AND MovementLinkObject_Maker.DescId = zc_MovementLinkObject_Maker()
                              INNER JOIN MovementDate AS MovementDate_StartPromo
                                                      ON MovementDate_StartPromo.MovementId = Movement.Id
                                                     AND MovementDate_StartPromo.DescId = zc_MovementDate_StartPromo()
                              INNER JOIN MovementDate AS MovementDate_EndPromo
                                                      ON MovementDate_EndPromo.MovementId = Movement.Id
                                                     AND MovementDate_EndPromo.DescId = zc_MovementDate_EndPromo()
                              INNER JOIN MovementItem AS MI_Goods ON MI_Goods.MovementId = Movement.Id
                                                                 AND MI_Goods.DescId = zc_MI_Master()
                                                                 AND MI_Goods.isErased = FALSE
                              INNER JOIN MovementItem AS MI_Promo ON MI_Promo.MovementId = Movement.Id
                                                                 AND MI_Promo.DescId = zc_MI_Child()
                                                                 AND MI_Promo.isErased = FALSE
                              LEFT JOIN Object AS Object_Juridical ON Object_Juridical.Id = MI_Promo.ObjectId
                            WHERE Movement.StatusId = zc_Enum_Status_Complete()
                              AND Movement.DescId = zc_Movement_Promo()
                       ),
    tmpGoodsJPromo AS (SELECT
                              Container.ID                  AS ContainerID
                            , Max(tmpGoodsPromo.PromoID)    AS PromoID
                            , Max(Movement.Id)                   AS MovementId
                          FROM Container
                              INNER JOIN MovementItemContainer ON MovementItemContainer.ContainerId = Container.Id
                                                              AND MovementItemContainer.movementdescid = zc_Movement_Income()
                              INNER JOIN Movement ON Movement.Id = MovementItemContainer.movementid
                              LEFT OUTER JOIN MovementLinkObject AS MovementLinkObject_From
                                                                 ON MovementLinkObject_From.MovementId = Movement.Id
                                                                AND MovementLinkObject_From.DescId = zc_MovementLinkObject_From()
                              LEFT OUTER JOIN tmpGoodsPromo AS tmpGoodsPromo
                                  ON tmpGoodsPromo.JuridicalId = MovementLinkObject_From.ObjectId
                                 AND tmpGoodsPromo.GoodsId = Container.ObjectId
                                 AND tmpGoodsPromo.StartDate_Promo <= MovementItemContainer.OperDate
                                 AND tmpGoodsPromo.EndDate_Promo >= DATE_TRUNC ('DAY',  MovementItemContainer.Operdate)
                           WHERE Container.DescId = zc_Container_count()
                           GROUP BY Container.ID),
    tmpGoodsJuridical AS (SELECT
                              tmpGoodsJPromo.ContainerID    AS ContainerID
                            , tmpGoodsJPromo.PromoID        AS PromoID
                            , Object_From.objectcode        AS JuridicalID
                            , Object_From.valuedata         AS JuridicalName
                          FROM tmpGoodsJPromo
                              LEFT OUTER JOIN MovementLinkObject AS MovementLinkObject_From
                                                                 ON MovementLinkObject_From.MovementId = tmpGoodsJPromo.MovementId
                                                                AND MovementLinkObject_From.DescId = zc_MovementLinkObject_From()
                              LEFT OUTER JOIN Object AS Object_From
                                                     ON MovementLinkObject_From.ObjectId = Object_From.Id)


  SELECT
      DATE_TRUNC ('DAY',  MovementItemAll.Operdate)
    , Object_Unit.ObjectCode            AS UnitID
    , Object_Goods.ObjectCode           AS GoodsId
    , tmpGoodsJuridical.PromoID             AS PromoID
    , tmpGoodsJuridical.JuridicalID            AS JuridicalID
    , SUM (case when MovementItemAll.MovementDescId = zc_Movement_Check() then MovementItemAll.Amount else 0 end) AS Amount
    , SUM (MovementItemAll.Amount) AS Salso
  FROM Container
    INNER JOIN MovementItemContainer AS MovementItemAll
                                     ON MovementItemAll.ContainerId = Container.Id
    LEFT OUTER JOIN tmpGoodsJuridical AS tmpGoodsJuridical
                                      ON tmpGoodsJuridical.ContainerID = Container.Id
    INNER JOIN Object AS Object_Unit
                        ON Object_Unit.ID = Container.WhereObjectId
    INNER JOIN Object AS Object_Goods
                        ON Object_Goods.Id = Container.ObjectId


  WHERE Container.DescId = zc_Container_count()
  GROUP BY DATE_TRUNC ('DAY',  MovementItemAll.Operdate),
    Object_Unit.ObjectCode, Object_Goods.ObjectCode, tmpGoodsJuridical.PromoID, tmpGoodsJuridical.JuridicalID;

  DROP TABLE IF EXISTS AnalysisRemainsUnit;
  ALTER TABLE AnalysisRemainsUnitTemp RENAME TO AnalysisRemainsUnit;
  CREATE INDEX idx_AnalysisRemainsUnit_UnitId_GoodsId_Saldo ON AnalysisRemainsUnit(UnitId, GoodsId, Saldo);

  DROP TABLE IF EXISTS AnalysisSellingDeyUnit;
  ALTER TABLE AnalysisSellingDeyUnitTemp RENAME TO AnalysisSellingDeyUnit;
  CREATE INDEX idx_AnalysisSellingDeyUnit_OperDate_UnitId_GoodsId_Amount ON AnalysisSellingDeyUnit(OperDate, UnitId, GoodsId, PromoID, JuridicalID, Amount);
  CREATE INDEX idx_AnalysisSellingDeyUnit_OperDate_UnitId_GoodsId_Saldo ON AnalysisSellingDeyUnit(OperDate, UnitId, GoodsId, PromoID, JuridicalID, Saldo);
*/

  DROP TABLE IF EXISTS AnalysisContainerTemp;
  CREATE TABLE AnalysisContainerTemp
  (
    Id               SERIAL    NOT NULL PRIMARY KEY,
    UnitID           INTEGER,
    GoodsId          INTEGER,

    Price            TFloat    NOT NULL DEFAULT 0,
    PriceWith        TFloat    NOT NULL DEFAULT 0,

    Saldo            TFloat    NOT NULL DEFAULT 0
  )
  WITH (
    OIDS=FALSE
  );
  ALTER TABLE AnalysisContainerTemp
    OWNER TO postgres;


    -- Заполняем текуший остаток с ценами по партиям
  INSERT INTO AnalysisContainerTemp (
    ID,
    UnitID,
    GoodsId,
    Price,
    PriceWith,
    Saldo)
  SELECT Container.Id
       , Container.WhereObjectId
       , Container.ObjectId
       , Max(COALESCE (MIFloat_JuridicalPrice.ValueData, 0))   AS Price
       , Max(COALESCE (MIFloat_PriceWithOutVAT.ValueData, 0))  AS PriceWith
       , Container.Amount
  FROM Container
        -- партия
       LEFT OUTER JOIN ContainerLinkObject AS CLI_MI
                                           ON CLI_MI.ContainerId = Container.Id
                                          AND CLI_MI.DescId = zc_ContainerLinkObject_PartionMovementItem()
       LEFT OUTER JOIN Object AS Object_PartionMovementItem ON Object_PartionMovementItem.Id = CLI_MI.ObjectId
        -- элемент прихода
       LEFT OUTER JOIN MovementItem AS MI_Income
                                    ON MI_Income.Id = Object_PartionMovementItem.ObjectCode

        -- если это партия, которая была создана инвентаризацией - в этом свойстве будет "найденный" ближайший приход от поставщика
       LEFT JOIN MovementItemFloat AS MIFloat_MovementItem
                                   ON MIFloat_MovementItem.MovementItemId = MI_Income.Id
                                  AND MIFloat_MovementItem.DescId = zc_MIFloat_MovementItemId()
         -- элемента прихода от поставщика (если это партия, которая была создана инвентаризацией)
       LEFT JOIN MovementItem AS MI_Income_find ON MI_Income_find.Id = (MIFloat_MovementItem.ValueData :: Integer)

         -- цена с учетом НДС, для элемента прихода от поставщика (или NULL)
       LEFT JOIN MovementItemFloat AS MIFloat_JuridicalPrice
                                   ON MIFloat_JuridicalPrice.MovementItemId = COALESCE (MI_Income_find.Id, MI_Income.Id)
                                  AND MIFloat_JuridicalPrice.DescId = zc_MIFloat_JuridicalPrice()

         -- цена без учета НДС, для элемента прихода от поставщика (или NULL)
       LEFT JOIN MovementItemFloat AS MIFloat_PriceWithOutVAT
                                   ON MIFloat_PriceWithOutVAT.MovementItemId = COALESCE (MI_Income_find.Id, MI_Income.Id)
                                  AND MIFloat_PriceWithOutVAT.DescId = zc_MIFloat_PriceWithOutVAT()

  WHERE Container.DescId = zc_Container_count()
  GROUP BY Container.Id, Container.WhereObjectId, Container.ObjectId, Container.Amount;

  DROP TABLE IF EXISTS AnalysisContainerItemTemp;
  CREATE TABLE AnalysisContainerItemTemp
  (
    Id                      SERIAL    NOT NULL PRIMARY KEY,

    UnitID                  INTEGER,
    GoodsId                 INTEGER,

    OperDate                TDateTime,

    AmountIncome            TFloat,  -- Приход
    AmountIncomeSumWith     TFloat,
    AmountIncomeSum         TFloat,

    AmountReturnOut         TFloat,  -- Возврат поставщику
    AmountReturnOutSum      TFloat,

    AmountCheck             TFloat,  -- Кассовый чек
    AmountCheckSumJuridical TFloat,
    AmountCheckSum          TFloat,

    AmountSale              TFloat,  -- Продажа
    AmountSaleSumJuridical  TFloat,
    AmountSaleSum           TFloat,

    AmountInventory         TFloat,  -- Переучет
    AmountInventorySum      TFloat,

    AmountLoss              TFloat,  -- Списание
    AmountLossSum           TFloat,

    AmountSend              TFloat,  -- Перемещение
    AmountSendSum           TFloat,

    Saldo                   TFloat    NOT NULL DEFAULT 0
  )
  WITH (
    OIDS=FALSE
  );
  ALTER TABLE AnalysisContainerItemTemp
    OWNER TO postgres;

  INSERT INTO AnalysisContainerItemTemp (
    UnitID,
    GoodsId,

    OperDate,

    AmountIncome,
    AmountIncomeSumWith,
    AmountIncomeSum,

    AmountReturnOut,
    AmountReturnOutSum,

    AmountCheck,
    AmountCheckSumJuridical,
    AmountCheckSum,

    AmountSale,
    AmountSaleSumJuridical,
    AmountSaleSum,

    AmountInventory,
    AmountInventorySum,

    AmountLoss,
    AmountLossSum,

    AmountSend,
    AmountSendSum,

    Saldo)

      SELECT
          AnalysisContainer.UnitID
        , AnalysisContainer.GoodsId
        , DATE_TRUNC ('DAY', MovementItemAll.OperDate)                                 AS OperDate

        , SUM(case when MovementItemAll.MovementDescId = zc_Movement_Income() then
            MovementItemAll.Amount end)                                                AS AmountIncome       -- Приход
        , SUM(case when MovementItemAll.MovementDescId = zc_Movement_Income() then
            (MovementItemAll.Amount * COALESCE (MIFloat_PriceWithOutVAT.ValueData, 0))
            ::NUMERIC (16, 2) end)::TFloat                                             AS AmountIncomeSumWith
        , SUM(case when MovementItemAll.MovementDescId = zc_Movement_Income() then
            (MovementItemAll.Amount * COALESCE (MIFloat_JuridicalPrice.ValueData, 0))
            ::NUMERIC (16, 2) end)::TFloat                                             AS AmountIncomeSum

        , - SUM(case when MovementItemAll.MovementDescId = zc_Movement_ReturnOut() then
           MovementItemAll.Amount end)                                                 AS AmountReturnOut   -- Возврат поставщику
        , - SUM(case when MovementItemAll.MovementDescId = zc_Movement_ReturnOut() then
            (MovementItemAll.Amount * COALESCE (MIFloat_Price.ValueData, 0))
            ::NUMERIC (16, 2) end)::TFloat                                             AS AmountReturnOutSum

        , - SUM(case when MovementItemAll.MovementDescId = zc_Movement_Check() then
            MovementItemAll.Amount end)                                                AS AmountCheck       -- Кассовый чек
        , - SUM(case when MovementItemAll.MovementDescId = zc_Movement_Check() then
            (MovementItemAll.Amount * COALESCE ( AnalysisContainer.Price, 0))
            ::NUMERIC (16, 2) end)::TFloat                                             AS AmountCheckSumJuridical
        , - SUM(case when MovementItemAll.MovementDescId = zc_Movement_Check() then
            (MovementItemAll.Amount * COALESCE (MIFloat_Price.ValueData, 0))
            ::NUMERIC (16, 2) end)::TFloat                                             AS AmountCheckSum

        , - SUM(case when MovementItemAll.MovementDescId = zc_Movement_Sale() then
            MovementItemAll.Amount end)                                                AS AmountSale        -- Продажа
        , - SUM(case when MovementItemAll.MovementDescId = zc_Movement_Sale() then
            (MovementItemAll.Amount * COALESCE ( AnalysisContainer.Price, 0))
            ::NUMERIC (16, 2) end)::TFloat                                             AS AmountSaleSumJuridical
        , - SUM(case when MovementItemAll.MovementDescId = zc_Movement_Sale() then
            (MovementItemAll.Amount * COALESCE (MIFloat_Price.ValueData, 0))
            ::NUMERIC (16, 2) end)::TFloat                                             AS AmountSaleSum

        , SUM(case when MovementItemAll.MovementDescId = zc_Movement_Inventory() then
            MovementItemAll.Amount end)                                                AS AmountInventory   -- Переучет
        , SUM(case when MovementItemAll.MovementDescId = zc_Movement_Inventory() then
            (MovementItemAll.Amount * COALESCE (MIFloat_Price.ValueData, 0))
            ::NUMERIC (16, 2) end)::TFloat                                             AS AmountInventorySum

        , SUM(case when MovementItemAll.MovementDescId = zc_Movement_Loss() then
            MovementItemAll.Amount end)                                                AS AmountLoss        -- Списание
        , SUM(case when MovementItemAll.MovementDescId = zc_Movement_Loss() then
            (MovementItemAll.Amount * COALESCE (MIFloat_Price.ValueData, 0))
            ::NUMERIC (16, 2) end)::TFloat                                             AS AmountLossSum

        , SUM(case when MovementItemAll.MovementDescId = zc_Movement_Send() then
            MovementItemAll.Amount end)                                                AS AmountSend        -- Перемещение
        , SUM(case when MovementItemAll.MovementDescId = zc_Movement_Send() then
            (MovementItemAll.Amount * COALESCE ( AnalysisContainer.Price, 0))
            ::NUMERIC (16, 2) end)::TFloat                                             AS AmountSendSum

        , SUM(MovementItemAll.Amount)                                                  AS Saldo
      FROM AnalysisContainerTemp AS  AnalysisContainer
        INNER JOIN MovementItemContainer AS MovementItemAll
                                         ON MovementItemAll.ContainerId =  AnalysisContainer.Id

        LEFT JOIN MovementItem AS MovementItem
                                ON MovementItem.id = MovementItemAll.movementitemid

        LEFT JOIN MovementItemFloat AS MIFloat_Price
                                    ON MIFloat_Price.MovementItemId = MovementItem.Id
                                   AND MIFloat_Price.DescId = zc_MIFloat_Price()

        LEFT JOIN MovementItemFloat AS MIFloat_JuridicalPrice
                                    ON MIFloat_JuridicalPrice.MovementItemId = MovementItem.Id
                                   AND MIFloat_JuridicalPrice.DescId = zc_MIFloat_JuridicalPrice()

        LEFT JOIN MovementItemFloat AS MIFloat_PriceWithOutVAT
                                    ON MIFloat_PriceWithOutVAT.MovementItemId = MovementItem.Id
                                   AND MIFloat_PriceWithOutVAT.DescId = zc_MIFloat_PriceWithOutVAT()

      GROUP BY  AnalysisContainer.UnitID, AnalysisContainer.GoodsId, DATE_TRUNC ('DAY', MovementItemAll.OperDate);

  DROP TABLE IF EXISTS AnalysisContainer;
  ALTER TABLE AnalysisContainerTemp RENAME TO AnalysisContainer;
  CREATE INDEX idx_AnalysisContainer_UnitId_GoodsId_Saldo ON AnalysisContainer(UnitId, GoodsId, Saldo);

  DROP TABLE IF EXISTS AnalysisContainerItem;
  ALTER TABLE AnalysisContainerItemTemp RENAME TO AnalysisContainerItem;
  CREATE INDEX idx_AnalysisContainerItem_UnitId_GoodsId_OperDate_Saldo ON AnalysisContainerItem(UnitId, GoodsId, OperDate, Saldo);

END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;


/*
 ИСТОРИЯ РАЗРАБОТКИ: ДАТА, АВТОР
               Шаблий О.В.
 25.05.18        *                                                                         *
 15.04.18        *                                                                         *

*/

-- тест
-- SELECT * FROM gpFilling_AnalysisRemainAndSelling();
-- SELECT Count(*) FROM AnalysisRemainsUnit;
-- SELECT Count(*) FROM AnalysisSellingDeyUnit;
-- SELECT Count(*) FROM AnalysisContainer;
-- SELECT Count(*) FROM AnalysisContainerItem;
