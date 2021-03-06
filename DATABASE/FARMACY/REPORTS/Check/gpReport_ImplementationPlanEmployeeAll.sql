-- Function: gpReport_ImplementationPlanEmployeeAll()

DROP FUNCTION IF EXISTS gpReport_ImplementationPlanEmployeeAll (TDateTime, TVarChar);

CREATE OR REPLACE FUNCTION gpReport_ImplementationPlanEmployeeAll(
    IN inStartDate     TDateTime , -- Дата в месяце
    IN inSession       TVarChar    -- сессия пользователя
)
RETURNS TABLE (
  Orders             Integer,

  UserID             Integer,
  UserName           TVarChar,
  UnitID             Integer,
  UnitName           TVarChar,
  NormOfManDays      Integer,
  FactOfManDays      Integer,
  TotalExecutionLine TFloat,
  AmountTheFineTab   TFloat,
  BonusAmountTab     TFloat,
  Total              TFloat
)
AS
$BODY$
   DECLARE vbDateStart TDateTime;
   DECLARE vbDateEnd TDateTime;
   DECLARE vbQueryText Text;
   DECLARE curUnit CURSOR FOR SELECT UnitID FROM tmpImplementation GROUP BY UnitCategoryId, UnitID ORDER BY UnitCategoryId, UnitID;
   DECLARE vbUnitID Integer;
BEGIN
     -- проверка прав пользователя на вызов процедуры
     -- PERFORM lpCheckRight (inSession, zc_Enum_Process_Select_Movement_OrderInternal());

    vbDateStart := date_trunc('month', inStartDate);
    vbDateEnd := date_trunc('month', vbDateStart + INTERVAL '1 month');

      -- Отработано по календарю
    CREATE TEMP TABLE tmpUserUnitDayTable (
            UserID             Integer,
            UnitID             Integer,

            NormOfManDays      Integer,
            FactOfManDays      Integer,
            PercentAttendance  TFloat

      ) ON COMMIT DROP;

      -- Заполнение отработано по календарю
    INSERT INTO tmpUserUnitDayTable (
            UserID,
            UnitID,

            FactOfManDays)

    WITH tmpUserUnitDay AS (SELECT 
             MovementLinkObject_Insert.ObjectId                   AS UserId
           , MovementLinkObject_Unit.ObjectId                     AS UnitId
           , date_trunc('day', MovementDate_Insert.ValueData)     AS OperDate
           , Count(*)                                                                                      AS CountCheck
     FROM Movement


        INNER JOIN MovementLinkObject AS MovementLinkObject_Unit
                                      ON MovementLinkObject_Unit.MovementId = Movement.Id
                                     AND MovementLinkObject_Unit.DescId = zc_MovementLinkObject_Unit()


        INNER JOIN MovementLinkObject AS MovementLinkObject_Insert
                                      ON MovementLinkObject_Insert.MovementId = Movement.Id
                                     AND MovementLinkObject_Insert.DescId = zc_movementlinkobject_insert()

        INNER JOIN MovementDate AS MovementDate_Insert
                                ON MovementDate_Insert.MovementId = Movement.Id
                               AND MovementDate_Insert.DescId = zc_MovementDate_Insert()

     WHERE MovementDate_Insert.ValueData >= vbDateStart
       AND MovementDate_Insert.ValueData < vbDateEnd
       AND Movement.DescId = zc_Movement_Check()
       AND Movement.StatusId = zc_Enum_Status_Complete()
       AND MovementLinkObject_Insert.ObjectId is Not Null
     GROUP BY MovementLinkObject_Insert.ObjectId
            , MovementLinkObject_Unit.ObjectId
            , date_trunc('day', MovementDate_Insert.ValueData))

    SELECT
        tmpUserUnitDay.UserID,
        tmpUserUnitDay.UnitID,
        Count(*) as FactOfManDays
    FROM tmpUserUnitDay
    WHERE CountCheck >= 5
    GROUP BY tmpUserUnitDay.UserID, tmpUserUnitDay.UnitID
    ORDER BY tmpUserUnitDay.UserID, tmpUserUnitDay.UnitID;

      -- Заполнение: Норма человекодней
    UPDATE tmpUserUnitDayTable SET
        NormOfManDays = UnitNormOfManDays.NormOfManDays,
        PercentAttendance = CASE WHEN UnitNormOfManDays.NormOfManDays = 0 THEN 0.0 ELSE
            CASE WHEN tmpUserUnitDayTable.FactOfManDays >= UnitNormOfManDays.NormOfManDays THEN 100.0 ELSE
            ROUND(1.0 * tmpUserUnitDayTable.FactOfManDays / UnitNormOfManDays.NormOfManDays * 100.0, 2) END END
    FROM (SELECT
            Object_Unit.Id                                            AS UnitId,
            COALESCE(ObjectFloat_NormOfManDays.ValueData, 0)::Integer AS NormOfManDays
       FROM Object AS Object_Unit

           INNER JOIN ObjectFloat AS ObjectFloat_NormOfManDays
                                  ON ObjectFloat_NormOfManDays.ObjectId = Object_Unit.Id
                                 AND ObjectFloat_NormOfManDays.DescId = zc_ObjectFloat_Unit_NormOfManDays()

       WHERE Object_Unit.DescId = zc_Object_Unit()
         AND Object_Unit.isErased = False) AS UnitNormOfManDays

    WHERE tmpUserUnitDayTable.UnitId = UnitNormOfManDays.UnitId;

      -- Проверка заполнения нормы человекодней
/*    IF EXISTS(SELECT FROM tmpUserUnitDayTable WHERE NormOfManDays IS NULL) THEN
      RAISE EXCEPTION 'По аптеке <%> не заполнены нормы человекодней ',
        (SELECT Object_Unit.ValueData FROM tmpUserUnitDayTable
            LEFT JOIN Object AS Object_Unit ON Object_Unit.Id = tmpUserUnitDayTable.UnitId
         WHERE NormOfManDays IS NULL LIMIT 1);
    END IF; */

      -- Результирующая таблица
    CREATE TEMP TABLE tmpResult (
            Id                 SERIAL    NOT NULL PRIMARY KEY,

            UserID             Integer,
            UserName           TVarChar,

            UnitID             Integer,
            UnitName           TVarChar,

            NormOfManDays      Integer,
            FactOfManDays      Integer,

            TotalExecutionLine TFloat,
            AmountTheFineTab   TFloat,
            BonusAmountTab     TFloat,
            Total              TFloat
      ) ON COMMIT DROP;

      -- Заполнение шапки результирующей таблицы
    INSERT INTO tmpResult (
             UserID,
             UserName,
             UnitID,
             UnitName,
             TotalExecutionLine,
             AmountTheFineTab,
             BonusAmountTab,
             Total)

    SELECT DISTINCT
       tmpUserUnitDayTable.UserId,
       Object_Member.ValueData,
       tmpUserUnitDayTable.UnitId,
       Object_Unit.ValueData,
       0, 0, 0, 0
    FROM tmpUserUnitDayTable
       INNER JOIN (
         SELECT
           tmpUserUnitDayTable.UserId,
           Max(tmpUserUnitDayTable.FactOfManDays) as MaxDayCount
         FROM tmpUserUnitDayTable
         GROUP BY tmpUserUnitDayTable.UserId) AS MaxDayCount ON MaxDayCount.UserId = tmpUserUnitDayTable.UserId
                                             AND MaxDayCount.MaxDayCount = tmpUserUnitDayTable.FactOfManDays

       LEFT JOIN Object AS Object_Unit ON Object_Unit.Id = tmpUserUnitDayTable.UnitId

       LEFT JOIN ObjectLink AS ObjectLink_User_Member
                            ON ObjectLink_User_Member.ObjectId = tmpUserUnitDayTable.UserId
                           AND ObjectLink_User_Member.DescId = zc_ObjectLink_User_Member()

       LEFT JOIN Object AS Object_Member ON Object_Member.Id = ObjectLink_User_Member.childobjectid

       ORDER BY Object_Member.ValueData;

    CREATE TEMP TABLE tmpImplementation (
            UserId Integer,
            UnitCategoryId Integer,
            UnitID Integer,
            GoodsId Integer,
            Amount TFloat,
            Price TFloat,

            AmountPlan TFloat,
            AmountPlanMax TFloat,

            AmountPlanTab TFloat,
            AmountPlanMaxTab TFloat,

            AmountTheFineTab TFloat,
            BonusAmountTab TFloat
      ) ON COMMIT DROP;


      -- Заполняем данные по продажам
    INSERT INTO tmpImplementation (
            UserId,
            UnitCategoryId,
            UnitID,
            GoodsId,
            Amount,
            Price,
            AmountPlan,
            AmountPlanMax)

    WITH tempPromoUnit AS (SELECT
           MovementLinkObject_UnitCategory.ObjectId              AS UnitCategoryID
         , ObjectLink_Unit_Category.ObjectId                     AS UnitID
         , MI_PromoUnit.ObjectId                                 AS GoodsId
         , MIFloat_Price.ValueData                               AS Price
         , MI_PromoUnit.Amount                                   AS AmountPlan
         , MIFloat_AmountPlanMax.ValueData::TFloat               AS AmountPlanMax
     FROM Movement AS Movement_PromoUnit

              INNER JOIN MovementLinkObject AS MovementLinkObject_UnitCategory
                                           ON MovementLinkObject_UnitCategory.MovementId = Movement_PromoUnit.Id
                                          AND MovementLinkObject_UnitCategory.DescId = zc_MovementLinkObject_UnitCategory()

              INNER JOIN ObjectLink AS ObjectLink_Unit_Category
                             ON ObjectLink_Unit_Category.ChildObjectId = MovementLinkObject_UnitCategory.ObjectId
                            AND ObjectLink_Unit_Category.DescId = zc_ObjectLink_Unit_Category()

              INNER JOIN MovementItem AS MI_PromoUnit ON MI_PromoUnit.MovementId = Movement_PromoUnit.Id
                                    AND MI_PromoUnit.DescId = zc_MI_Master()
                                    AND MI_PromoUnit.isErased = FALSE

              INNER JOIN MovementItemFloat AS MIFloat_Price  ON MIFloat_Price.MovementItemId = MI_PromoUnit.Id
                                         AND MIFloat_Price.DescId = zc_MIFloat_Price()

              INNER JOIN MovementItemFloat AS MIFloat_AmountPlanMax
                                          ON MIFloat_AmountPlanMax.MovementItemId = MI_PromoUnit.Id
                                         AND MIFloat_AmountPlanMax.DescId = zc_MIFloat_AmountPlanMax()

     WHERE Movement_PromoUnit.StatusId = zc_Enum_Status_Complete()
       AND Movement_PromoUnit.DescId = zc_Movement_PromoUnit()
       AND COALESCE(MIFloat_AmountPlanMax.ValueData, 0) > 0
       AND Movement_PromoUnit.OperDate >= vbDateStart
       AND Movement_PromoUnit.OperDate < vbDateEnd),

    tmpImplementation AS (SELECT
               COALESCE (MovementLinkObject_Insert.ObjectId, 
                         MovementLinkObject_UserConfirmedKind.ObjectId)     AS UserId
             , MovementLinkObject_Unit.ObjectId                             AS UnitId
             , MovementItem.ObjectId                                        AS GoodsId
             , Sum(MovementItem.Amount)::TFloat                             AS Amount
             , ROUND(Sum(COALESCE (MIFloat_Price.ValueData, 0)::TFloat *
               MovementItem.Amount) / Sum(MovementItem.Amount), 2)::TFloat  AS Price
         FROM Movement

            LEFT JOIN MovementLinkObject AS MovementLinkObject_Insert
                                         ON MovementLinkObject_Insert.MovementId = Movement.Id
                                        AND MovementLinkObject_Insert.DescId = zc_MovementLinkObject_Insert()

            LEFT JOIN MovementLinkObject AS MovementLinkObject_UserConfirmedKind
                                         ON MovementLinkObject_UserConfirmedKind.MovementId = Movement.Id
                                        AND MovementLinkObject_UserConfirmedKind.DescId = zc_MovementLinkObject_UserConfirmedKind()

            LEFT JOIN MovementDate AS MovementDate_Insert
                                   ON MovementDate_Insert.MovementId = Movement.Id
                                  AND MovementDate_Insert.DescId = zc_MovementDate_Insert()

            LEFT JOIN MovementLinkObject AS MovementLinkObject_Unit
                                         ON MovementLinkObject_Unit.MovementId = Movement.Id
                                        AND MovementLinkObject_Unit.DescId = zc_MovementLinkObject_Unit()


            INNER JOIN MovementItem AS MovementItem
                                    ON MovementItem.MovementId = Movement.Id
                                   AND MovementItem.isErased   = FALSE

            INNER JOIN (SELECT DISTINCT tempPromoUnit.GoodsId FROM tempPromoUnit) AS PromoUnit ON PromoUnit.GoodsId = MovementItem.ObjectId

            LEFT JOIN MovementItemFloat AS MIFloat_Price
                                        ON MIFloat_Price.MovementItemId = MovementItem.Id
                                       AND MIFloat_Price.DescId = zc_MIFloat_Price()

         WHERE COALESCE (MovementDate_Insert.ValueData, Movement.OperDate) >= vbDateStart
           AND COALESCE (MovementDate_Insert.ValueData, Movement.OperDate) < vbDateEnd
           AND COALESCE (MovementLinkObject_Insert.ObjectId, 
                         MovementLinkObject_UserConfirmedKind.ObjectId) IN (SELECT DISTINCT tmpResult.UserID FROM tmpResult)
           AND Movement.DescId = zc_Movement_Check()
           AND Movement.StatusId = zc_Enum_Status_Complete()
           AND MovementItem.Amount <> 0
         GROUP BY COALESCE (MovementLinkObject_Insert.ObjectId, MovementLinkObject_UserConfirmedKind.ObjectId)
             , MovementLinkObject_Unit.ObjectId
             , MovementItem.ObjectId
         HAVING Sum(MovementItem.Amount)::TFloat > 0)

     SELECT
           UserUnitDayTable.UserID                               AS UserID
         , PromoUnit.UnitCategoryId                              AS UnitCategoryId
         , UserUnitDayTable.UnitID                               AS UnitID
         , PromoUnit.GoodsId                                     AS GoodsId
         , COALESCE(Implementation.Amount, 0)                    AS Amount
         , COALESCE(Implementation.Price, PromoUnit.Price)       AS Price
         , PromoUnit.AmountPlan                                  AS AmountPlan
         , PromoUnit.AmountPlanMax                               AS AmountPlanMax
     FROM tmpUserUnitDayTable AS UserUnitDayTable
           INNER JOIN tempPromoUnit AS PromoUnit ON PromoUnit.UnitID = UserUnitDayTable.UnitID
           LEFT JOIN tmpImplementation AS Implementation ON Implementation.UserID = UserUnitDayTable.UserID
                                      AND Implementation.UnitID = PromoUnit.UnitID
                                      AND Implementation.GoodsId = PromoUnit.GoodsId

     ORDER BY Implementation.UserID, Implementation.UnitID, Implementation.GoodsId;

      -- Расчет суммы плана с учетом табеля
     UPDATE tmpImplementation SET AmountPlanTab = 1.0 * AmountPlan * tmpUserUnitDayTable.PercentAttendance / 100.0,
            AmountPlanMaxTab  = 1.0 * AmountPlanMax * tmpUserUnitDayTable.PercentAttendance / 100.0
     FROM tmpUserUnitDayTable
     WHERE tmpImplementation.UserID = tmpUserUnitDayTable.UserID
       AND tmpImplementation.UnitID = tmpUserUnitDayTable.UnitID;

      -- Собираем общее количество
     UPDATE tmpImplementation SET Amount = ImplementationAll.AmountAll
     FROM (SELECT
            Implementation.GoodsId                       AS GoodsId
          , Implementation.UserId                        AS UserId
          , SUM(Implementation.Amount)                   AS AmountAll
       FROM tmpImplementation AS Implementation
       GROUP BY Implementation.GoodsId, Implementation.UserId) AS ImplementationAll
     WHERE tmpImplementation.UserId = ImplementationAll.UserId
       AND tmpImplementation.GoodsId = ImplementationAll.GoodsId;

      -- Расчет суммы штрафа и премии
     UPDATE tmpImplementation SET AmountTheFineTab = CASE WHEN Amount < AmountPlanTab THEN
              1.0 * (AmountPlanTab - Amount) * Price * UnitCategory.PenaltyNonMinPlan / 100 ELSE 0 END,
            BonusAmountTab = CASE WHEN Amount >= AmountPlanMaxTab THEN
              1.0 * Amount * Price * UnitCategory.PremiumImplPlan / 100 ELSE 0 END
     FROM (SELECT
            Object_UnitCategory.Id                       AS UnitCategoryId
          , ObjectFloat_PenaltyNonMinPlan.ValueData      AS PenaltyNonMinPlan
          , ObjectFloat_PremiumImplPlan.ValueData        AS PremiumImplPlan
       FROM Object AS Object_UnitCategory

           LEFT JOIN ObjectFloat AS ObjectFloat_PenaltyNonMinPlan
                                 ON ObjectFloat_PenaltyNonMinPlan.ObjectId = Object_UnitCategory.Id
                                AND ObjectFloat_PenaltyNonMinPlan.DescId = zc_ObjectFloat_UnitCategory_PenaltyNonMinPlan()

           LEFT JOIN ObjectFloat AS ObjectFloat_PremiumImplPlan
                                 ON ObjectFloat_PremiumImplPlan.ObjectId = Object_UnitCategory.Id
                                AND ObjectFloat_PremiumImplPlan.DescId = zc_ObjectFloat_UnitCategory_PremiumImplPlan()

       WHERE Object_UnitCategory.DescId = zc_Object_UnitCategory()
         AND Object_UnitCategory.isErased = False) AS UnitCategory
     WHERE tmpImplementation.UnitCategoryId = UnitCategory.UnitCategoryId;

       -- Заполняем Норма человекодней
     UPDATE tmpResult SET NormOfManDays = COALESCE(tmpUserUnitDayTable.NormOfManDays, 0)
     FROM tmpUserUnitDayTable
     WHERE tmpResult.UserID = tmpUserUnitDayTable.UserID
       AND tmpResult.UnitID = tmpUserUnitDayTable.UnitID;

       -- Заполняем Факт человекодней
     UPDATE tmpResult SET FactOfManDays = COALESCE(tmpUserUnitDayTable.FactOfManDays, 0)
     FROM (SELECT tmpUserUnitDayTable.UserID,
            MAX(tmpUserUnitDayTable.FactOfManDays) AS FactOfManDays
         FROM tmpUserUnitDayTable AS tmpUserUnitDayTable
         GROUP BY tmpUserUnitDayTable.UserID) AS tmpUserUnitDayTable
     WHERE tmpResult.UserID = tmpUserUnitDayTable.UserID;

      -- Выбираем итоговою сумму штрафа и премии
     UPDATE tmpResult SET
        AmountTheFineTab = COALESCE(Implementation.AmountTheFineTab, 0),
        BonusAmountTab = COALESCE(Implementation.BonusAmountTab, 0)
     FROM (SELECT Implementation.UserID,
            Implementation.UnitID,
            SUM(Implementation.AmountTheFineTab) AS AmountTheFineTab,
            SUM(Implementation.BonusAmountTab) AS BonusAmountTab
         FROM tmpImplementation AS Implementation
            INNER JOIN (SELECT tmpResult.UnitID, tmpResult.UserID FROM tmpResult) AS T1
                      ON Implementation.UserID = T1.UserID
                     AND Implementation.UnitID = T1.UnitID
         GROUP BY Implementation.UserID, Implementation.UnitID) AS Implementation
     WHERE tmpResult.UserID = Implementation.UserID
       AND tmpResult.UnitID = Implementation.UnitID;

       -- Собираем Общий % выполнения построчный:
     UPDATE tmpResult SET
        TotalExecutionLine = CASE WHEN CountConsider <> 0 THEN 1.0 * CountAmount / CountConsider * 100 ELSE 0 END
     FROM (SELECT Implementation.UserID  AS UserID,
             SUM(CASE WHEN Implementation.Amount > 0 AND Implementation.AmountPlanTab > 0 AND 
                 Implementation.Amount >= Implementation.AmountPlanTab then 1 else 0 end)::Integer  AS CountAmount,
             SUM(CASE WHEN Implementation.AmountPlanTab >= 0.1 then 1 else 0 end)::Integer          AS CountConsider
           FROM
             (SELECT Implementation.UserID AS UserID,
                Sum(Implementation.Amount) AS Amount,
                MAX(Implementation.AmountPlanTab) AS AmountPlanTab
              FROM tmpImplementation AS Implementation
                 INNER JOIN (SELECT tmpResult.UnitID, tmpResult.UserID FROM tmpResult) AS T1
                         ON Implementation.UserID = T1.UserID
                        AND Implementation.UnitID = T1.UnitID
              GROUP BY Implementation.UserID, Implementation.GoodsId) AS Implementation
           GROUP BY Implementation.UserID) AS Implementation
     WHERE tmpResult.UserID = Implementation.UserID;

      -- Расчет итогов
     UPDATE tmpResult SET Total = CASE WHEN tmpResult.TotalExecutionLine >= UnitCategory.MinLineByLineImplPlan THEN
              tmpResult.BonusAmountTab - tmpResult.AmountTheFineTab ELSE 0 END
     FROM (SELECT
            ObjectLink_Unit_Category.ObjectId            AS UnitId
          , ObjectFloat_MinLineByLineImplPlan.ValueData  AS MinLineByLineImplPlan
       FROM Object AS Object_UnitCategory

           INNER JOIN ObjectLink AS ObjectLink_Unit_Category
                                 ON ObjectLink_Unit_Category.ChildObjectId = Object_UnitCategory.Id
                                AND ObjectLink_Unit_Category.DescId = zc_ObjectLink_Unit_Category()

           LEFT JOIN ObjectFloat AS ObjectFloat_MinLineByLineImplPlan
                                 ON ObjectFloat_MinLineByLineImplPlan.ObjectId = Object_UnitCategory.Id
                                AND ObjectFloat_MinLineByLineImplPlan.DescId = zc_ObjectFloat_UnitCategory_MinLineByLineImplPlan()

       WHERE Object_UnitCategory.DescId = zc_Object_UnitCategory()
         AND Object_UnitCategory.isErased = False) AS UnitCategory
     WHERE tmpResult.UnitId = UnitCategory.UnitId;

       -- Результат
     RETURN QUERY
     SELECT
        Result.ID::Integer,
        Result.UserID,
        Result.UserName,
        Result.UnitID,
        Result.UnitName,
        Result.NormOfManDays,
        Result.FactOfManDays,
        Result.TotalExecutionLine,
        Result.AmountTheFineTab,
        Result.BonusAmountTab,
        Result.Total
     FROM tmpResult AS Result
     ORDER BY Result.ID;

END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;

/*
 ИСТОРИЯ РАЗРАБОТКИ: ДАТА, АВТОР
               Шаблий О.В.
 17.10.18         *
 13.10.18         *
 05.10.18         *
 05.09.18         *
 01.08.18         *
 15.07.18         *
 06.07.18         *
 01.06.18         *
*/

-- тест
-- select * from gpReport_ImplementationPlanEmployeeAll(inStartDate := ('13.10.2018')::TDateTime ,  inSession := '3');
