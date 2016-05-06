-- Function: gpSelect_GoodsOnUnit_ForSite()

DROP FUNCTION IF EXISTS gpSelect_GoodsOnUnit_ForSite (Integer, TVarChar, TVarChar);
DROP FUNCTION IF EXISTS gpSelect_GoodsOnUnit_ForSite (TVarChar, TVarChar, TVarChar);

CREATE OR REPLACE FUNCTION gpSelect_GoodsOnUnit_ForSite(
    IN inUnitId_list      TVarChar ,  -- ������ �������������, ����� ���
    IN inGoodsId_list     TVarChar ,  -- ������ �������, ����� ���
    IN inSession          TVarChar    -- ������ ������������
)
RETURNS TABLE (Id                Integer
             , Article           Integer
             , Id_Site           Integer
             , Name_Site         TBlob
             , Name              TVarChar
             , foto              TVarChar
             , thumb             TVarChar
             , description       TBlob
             , appointment_id    Integer
             , category_id       Integer
             , Name_category     TVarChar
             , published         Integer
             , deleted           Integer
             , ObjectId          Integer   -- �������� ���� (������������)
             , ObjectName        TVarChar  -- �������� ���� (������������)
             , UnitId            Integer   -- ������ (������������)
             , UnitName          TVarChar  -- ������ (������������)
             , Remains           TFloat    -- ������� (� ������ �������)
             , RemainsAll        TFloat    -- ������� (��� ����� �������)
             , AmountDeferred    TFloat    -- ������

             , JuridicalId       Integer    -- ��������� (�� �������� ������� ����� ����)
             , JuridicalName     TVarChar   -- ��������� (�� �������� ������� ����� ����)
             , ContractId        Integer    -- ������� (�� �������� ������� ����� ����)
             , ContractName      TVarChar   -- ������� (�� �������� ������� ����� ����)
             , Manufacturer      TVarChar
             , ExpirationDate    TDateTime -- ���� �������� (�� �������� ������� ����� ����)
             , Price_unit        TFloat -- ���� ������
             , Price_minNoNds    TFloat -- Original - ���� ����� ��� ��� (��� �������, �������������)
             , Price_minO        TFloat -- Original - ���� ����� � ��� (��� �������, �������������)
             , Price_min         TFloat -- ���� ����� ���������� � ��� � ��������
             , Price_minD        TFloat -- Delivery - ���� ����� � ��� � �������� - ��������

             , MarginPercent           TFloat  -- % ������� (�������������)
             , MarginPercent_site      TFloat  -- % ������� - �������� (�������������)
             , MarginCategoryName      TVarChar -- ������� �������� (�������������)
             , MarginCategoryName_site TVarChar -- ������� �������� - �������� (�������������)

             , NDS         TFloat
             , NDSKindName TVarChar
              )
AS
$BODY$
   DECLARE vbUserId Integer;
   DECLARE vbObjectId Integer;

   -- DECLARE inUnitId Integer;

   DECLARE vbIndex Integer;
   -- DECLARE vbMarginCategoryId Integer;
   DECLARE vbMarginCategoryId_site Integer;
BEGIN
    -- �������� ���� ������������ �� ����� ���������
    -- PERFORM lpCheckRight (inSession, zc_Enum_Process_Select_Movement_Income());
    vbUserId:= lpGetUserBySession (inSession);

    -- ������������ <�������� ����>
    vbObjectId:= lpGet_DefaultValue ('zc_Object_Retail', vbUserId);


    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.tables WHERE TABLE_NAME = '_tmpgoodsminprice_list')
    THEN
        -- �������
        CREATE TEMP TABLE _tmpGoodsMinPrice_List (GoodsId Integer) ON COMMIT DROP;
    ELSE
        DELETE FROM _tmpGoodsMinPrice_List;
    END IF;
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.tables WHERE TABLE_NAME = '_tmpunitminprice_list')
    THEN
        -- �������
        CREATE TEMP TABLE _tmpUnitMinPrice_List (UnitId Integer) ON COMMIT DROP;
    ELSE
        DELETE FROM _tmpUnitMinPrice_List;
    END IF;

    -- ������ �������������
    vbIndex := 1;
    WHILE SPLIT_PART (inUnitId_list, ',', vbIndex) <> '' LOOP
        -- ��������� �� ��� �����
        INSERT INTO _tmpUnitMinPrice_List (UnitId) SELECT SPLIT_PART (inUnitId_list, ',', vbIndex) :: Integer;
        -- ������ ����������
        vbIndex := vbIndex + 1;
    END LOOP;
    -- !!!��������!!!
    -- inUnitId:= (SELECT tmpList.UnitId FROM _tmpUnitMinPrice_List LIMIT 1);

    -- ������ ������
    vbIndex := 1;
    WHILE SPLIT_PART (inGoodsId_list, ',', vbIndex) <> '' LOOP
        -- ��������� �� ��� �����
        INSERT INTO _tmpGoodsMinPrice_List (GoodsId) SELECT SPLIT_PART (inGoodsId_list, ',', vbIndex) :: Integer;
        -- ������ ����������
        vbIndex := vbIndex + 1;
    END LOOP;

    -- ���� ��� �������
    IF NOT EXISTS (SELECT 1 FROM _tmpGoodsMinPrice_List WHERE GoodsId <> 0)
    THEN
         -- ��� �������
         INSERT INTO _tmpGoodsMinPrice_List (GoodsId)
           SELECT DISTINCT Container.ObjectId -- ����� ����� "����"
           FROM _tmpUnitMinPrice_List
                INNER JOIN Container ON Container.WhereObjectId = tmpList.UnitId
                                    AND Container.DescId = zc_Container_Count()
                                    AND Container.Amount <> 0
          ;
    END IF;


    -- !!!�����������!!!
    ANALYZE _tmpGoodsMinPrice_List;
    -- !!!�����������!!!
    ANALYZE _tmpUnitMinPrice_List;


    -- ��� ������������ - _tmpContainerCount
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.tables WHERE TABLE_NAME = LOWER ('_tmpContainerCount'))
    THEN
        -- �������
        CREATE TEMP TABLE _tmpContainerCount (UnitId Integer, GoodsId Integer, Amount TFloat) ON COMMIT DROP;
    ELSE
        DELETE FROM _tmpContainerCount;
    END IF;
    --
    INSERT INTO _tmpContainerCount (UnitId, GoodsId, Amount)
                SELECT Container.WhereObjectId AS UnitId
                     , Container.ObjectId      AS GoodsId
                     , SUM (Container.Amount)  AS Amount
                FROM _tmpGoodsMinPrice_List
                     INNER JOIN Container ON Container.ObjectId = _tmpGoodsMinPrice_List.GoodsId
                                         AND Container.DescId   = zc_Container_Count()
                                         AND Container.Amount   <> 0
                     INNER JOIN _tmpUnitMinPrice_List AS tmpList ON tmpList.UnitId = Container.WhereObjectId
                GROUP BY Container.WhereObjectId
                       , Container.ObjectId
                HAVING SUM (Container.Amount) > 0
               ;

    -- !!!�����������!!!
    ANALYZE _tmpContainerCount;

    -- ��� ������������ - _tmpList
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.tables WHERE TABLE_NAME = LOWER ('_tmpList'))
    THEN
        -- �������
        CREATE TEMP TABLE _tmpList (UnitId Integer, GoodsId Integer) ON COMMIT DROP;
    ELSE
        DELETE FROM _tmpList;
    END IF;
    --
    INSERT INTO _tmpList (UnitId, GoodsId)
                SELECT DISTINCT _tmpContainerCount.UnitId, _tmpContainerCount.GoodsId FROM _tmpContainerCount;
                /*SELECT _tmpUnitMinPrice_List.UnitId
                     , _tmpGoodsMinPrice_List.GoodsId
                FROM _tmpGoodsMinPrice_List
                     LEFT JOIN _tmpUnitMinPrice_List ON 1=1
               ;*/

    -- ��� ������������ - _tmpMinPrice_List
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.tables WHERE TABLE_NAME = LOWER ('_tmpMinPrice_List'))
    THEN
        -- �������
        CREATE TEMP TABLE _tmpMinPrice_List (GoodsId            Integer,
                                            GoodsCode          Integer,
                                            GoodsName          TVarChar,
                                            PartionGoodsDate   TDateTime,
                                            Partner_GoodsId    Integer,
                                            Partner_GoodsCode  TVarChar,
                                            Partner_GoodsName  TVarChar,
                                            MakerName          TVarChar,
                                            ContractId         Integer,
                                            JuridicalId        Integer,
                                            JuridicalName      TVarChar,
                                            Price              TFloat, 
                                            SuperFinalPrice    TFloat,
                                            isTop              Boolean,
                                            isOneJuridical     Boolean
                                           ) ON COMMIT DROP;
    ELSE
        DELETE FROM _tmpMinPrice_List;
    END IF;
    --
             INSERT INTO _tmpMinPrice_List (GoodsId            ,
                                            GoodsCode ,
                                            GoodsName          ,
                                            PartionGoodsDate   ,
                                            Partner_GoodsId    ,
                                            Partner_GoodsCode  ,
                                            Partner_GoodsName  ,
                                            MakerName          ,
                                            ContractId         ,
                                            JuridicalId        ,
                                            JuridicalName      ,
                                            Price              ,
                                            SuperFinalPrice    ,
                                            isTop              ,
                                            isOneJuridical)
                                     SELECT tmp.GoodsId            ,
                                            tmp.GoodsCode ,
                                            tmp.GoodsName          ,
                                            tmp.PartionGoodsDate   ,
                                            tmp.Partner_GoodsId    ,
                                            tmp.Partner_GoodsCode  ,
                                            tmp.Partner_GoodsName  ,
                                            tmp.MakerName          ,
                                            tmp.ContractId         ,
                                            tmp.JuridicalId        ,
                                            tmp.JuridicalName      ,
                                            tmp.Price              ,
                                            tmp.SuperFinalPrice    ,
                                            tmp.isTop              ,
                                            tmp.isOneJuridical
                FROM lpSelectMinPrice_List (inUnitId  := 0          -- !!!�.�. �� ������� �� UnitId, ���� ...!!!
                                          , inObjectId:= vbObjectId
                                          , inUserId  := vbUserId
                                           ) AS tmp
               ;


    -- ����� ��������� ��� �����
    vbMarginCategoryId_site:= (SELECT ObjectBoolean.ObjectId
                               FROM ObjectBoolean
                               WHERE ObjectBoolean.ValueData = TRUE
                                 AND ObjectBoolean.DescId = zc_ObjectBoolean_MarginCategory_Site()
                               LIMIT 1
                              );


    -- !!!�����������!!!
    ANALYZE _tmpList;
    -- !!!�����������!!!
    ANALYZE _tmpMinPrice_List;


    -- ���������
    RETURN QUERY
       WITH tmpMI_Deferred AS
               (SELECT tmpList.UnitId
                     , MovementItem.ObjectId     AS GoodsId
                     , SUM (MovementItem.Amount) AS Amount
                FROM _tmpUnitMinPrice_List AS tmpList
                     INNER JOIN MovementLinkObject AS MovementLinkObject_Unit
                                                   ON MovementLinkObject_Unit.ObjectId = tmpList.UnitId
                                                  AND MovementLinkObject_Unit.DescId = zc_MovementLinkObject_Unit()
                     INNER JOIN MovementBoolean AS MovementBoolean_Deferred
                                                ON MovementBoolean_Deferred.MovementId = MovementLinkObject_Unit.MovementId
                                               AND MovementBoolean_Deferred.DescId = zc_MovementBoolean_Deferred()
                                               AND MovementBoolean_Deferred.ValueData = TRUE
                     INNER JOIN Movement ON Movement.Id       = MovementLinkObject_Unit.MovementId
                                        AND Movement.StatusId = zc_Enum_Status_UnComplete()
                                        AND Movement.DescId   = zc_Movement_Check()
                     INNER JOIN MovementItem ON MovementItem.MovementId = Movement.Id
                                            AND MovementItem.isErased   = FALSE
                     INNER JOIN _tmpGoodsMinPrice_List ON _tmpGoodsMinPrice_List.GoodsId = MovementItem.ObjectId
                GROUP BY tmpList.UnitId
                       , MovementItem.ObjectId
               )
          , MarginCategory_Unit AS
               (SELECT tmp.UnitId
                     , tmp.MarginCategoryId
                FROM (SELECT tmpList.UnitId
                           , ObjectLink_MarginCategory.ChildObjectId AS MarginCategoryId
                           , ROW_NUMBER() OVER (PARTITION BY tmpList.UnitId, ObjectLink_MarginCategory.ChildObjectId ORDER BY tmpList.UnitId, ObjectLink_MarginCategory.ChildObjectId) AS Ord
                      FROM _tmpUnitMinPrice_List AS tmpList
                           INNER JOIN ObjectLink AS ObjectLink_MarginCategoryLink_Unit
                                                 ON ObjectLink_MarginCategoryLink_Unit.ChildObjectId = tmpList.UnitId
                                                AND ObjectLink_MarginCategoryLink_Unit.DescId        = zc_ObjectLink_MarginCategoryLink_Unit()
                           LEFT JOIN ObjectLink AS ObjectLink_MarginCategory
                                                ON ObjectLink_MarginCategory.ObjectId = ObjectLink_MarginCategoryLink_Unit.ObjectId
                                               AND ObjectLink_MarginCategory.DescId   = zc_ObjectLink_MarginCategoryLink_MarginCategory()
                           LEFT JOIN ObjectFloat AS ObjectFloat_Percent
                                                 ON ObjectFloat_Percent.ObjectId = ObjectLink_MarginCategory.ChildObjectId
                                                AND ObjectFloat_Percent.DescId   = zc_ObjectFloat_MarginCategory_Percent()
                      WHERE COALESCE (ObjectFloat_Percent.ValueData, 0) = 0 -- !!!��� ��� �����!!!
                     ) AS tmp
                WHERE tmp.Ord = 1 -- !!!������ ���� ���������!!!
               )
          , Price_Unit AS
               (SELECT tmpList.UnitId
                     , _tmpGoodsMinPrice_List.GoodsId
                     , ROUND (ObjectFloat_Price_Value.ValueData, 2) :: TFloat AS Price
                FROM _tmpGoodsMinPrice_List
                     INNER JOIN ObjectLink AS ObjectLink_Price_Goods
                                           ON ObjectLink_Price_Goods.ChildObjectId = _tmpGoodsMinPrice_List.GoodsId
                                          AND ObjectLink_Price_Goods.DescId        = zc_ObjectLink_Price_Goods()
                     INNER JOIN ObjectLink AS ObjectLink_Price_Unit
                                           ON ObjectLink_Price_Unit.ObjectId      = ObjectLink_Price_Goods.ObjectId
                                          AND ObjectLink_Price_Unit.DescId        = zc_ObjectLink_Price_Unit()
                     INNER JOIN _tmpUnitMinPrice_List AS tmpList ON tmpList.UnitId = ObjectLink_Price_Unit.ChildObjectId
                     LEFT JOIN ObjectFloat AS ObjectFloat_Price_Value
                                           ON ObjectFloat_Price_Value.ObjectId = ObjectLink_Price_Goods.ObjectId
                                          AND ObjectFloat_Price_Value.DescId = zc_ObjectFloat_Price_Value()
               )
          , MarginCategory_all AS
               (SELECT DISTINCT 
                       tmp.UnitId
                     , Object_MarginCategoryItem_View.MarginCategoryId
                     , Object_MarginCategoryItem_View.MarginPercent
                     , Object_MarginCategoryItem_View.MinPrice
                     , ROW_NUMBER() OVER (PARTITION BY tmp.UnitId, Object_MarginCategoryItem_View.MarginCategoryId ORDER BY tmp.UnitId, Object_MarginCategoryItem_View.MarginCategoryId, Object_MarginCategoryItem_View.MinPrice) AS ORD
                FROM (SELECT MarginCategory_Unit.UnitId, MarginCategory_Unit.MarginCategoryId FROM MarginCategory_Unit
                     UNION
                      SELECT 0 AS UnitId, vbMarginCategoryId_site AS MarginCategoryId
                     ) AS tmp
                     INNER JOIN Object_MarginCategoryItem_View ON Object_MarginCategoryItem_View.MarginCategoryId = tmp.MarginCategoryId
               )
          , MarginCategory AS
               (SELECT DISTINCT 
                       MarginCategory_all.UnitId
                     , MarginCategory_all.MarginCategoryId
                     , MarginCategory_all.MarginPercent
                     , MarginCategory_all.MinPrice
                     , COALESCE (MarginCategory_all_next.MinPrice, 1000000) AS MaxPrice 
                FROM MarginCategory_all
                     LEFT JOIN MarginCategory_all AS MarginCategory_all_next ON MarginCategory_all_next.UnitId           = MarginCategory_all.UnitId
                                                                            AND MarginCategory_all_next.MarginCategoryId = MarginCategory_all.MarginCategoryId
                                                                            AND MarginCategory_all_next.ORD = MarginCategory_all.ORD + 1
                WHERE MarginCategory_all.MarginCategoryId <> vbMarginCategoryId_site
               )
          , MarginCategory_site AS
               (SELECT DISTINCT 
                       MarginCategory_all.MarginPercent
                     , MarginCategory_all.MinPrice
                     , COALESCE (MarginCategory_all_next.MinPrice, 1000000) AS MaxPrice 
                FROM MarginCategory_all
                     LEFT JOIN MarginCategory_all AS MarginCategory_all_next ON MarginCategory_all_next.MarginCategoryId = MarginCategory_all.MarginCategoryId
                                                                            AND MarginCategory_all_next.ORD = MarginCategory_all.ORD + 1
                WHERE MarginCategory_all.MarginCategoryId = vbMarginCategoryId_site
               )

        SELECT Object_Goods.Id                             AS Id
             , Object_Goods.ObjectCode                     AS Article
             , ObjectFloat_Goods_Site.ValueData :: Integer AS Id_Site
             , ObjectBlob_Site.ValueData                   AS Name_Site
             , Object_Goods.ValueData                      AS Name
             , ObjectString_Foto.ValueData                             AS foto
             , ObjectString_Thumb.ValueData                            AS thumb
             , ObjectBlob_Description.ValueData                        AS description
             , ObjectLink_Goods_Appointment.ChildObjectId              AS appointment_id
             , ObjectLink_Goods_GoodsGroup.ChildObjectId               AS category_id
             , Object_GoodsGroup.ValueData                             AS Name_category

             , CASE WHEN ObjectBoolean_Goods_Published.ValueData = TRUE THEN 1 ELSE 0 END :: Integer AS published
             , CASE WHEN Object_Goods.isErased = TRUE THEN 1 ELSE 0 END                   :: Integer AS deleted

             , ObjectLink_Goods_Object.ChildObjectId                   AS ObjectId
             , Object.ValueData                                        AS ObjectName
             , Object_Unit.Id                                          AS UnitId
             , Object_Unit.ValueData                                   AS UnitName

             , (ContainerCount.Amount - COALESCE (tmpMI_Deferred.Amount, 0)) :: TFloat AS Remains
             , ContainerCount.Amount                                         :: TFloat AS RemainsAll
             , tmpMI_Deferred.Amount                                         :: TFloat AS AmountDeferred

             , MinPrice_List.JuridicalId
             , MinPrice_List.JuridicalName
             , MinPrice_List.ContractId
             , Object_Contract.ValueData       AS ContractName
             , MinPrice_List.MakerName         AS Manufacturer
             , MinPrice_List.PartionGoodsDate  AS ExpirationDate

             , Price_Unit.Price    AS Price_unit
             , MinPrice_List.Price AS Price_minNoNds
             , ROUND (MinPrice_List.Price * (1 + COALESCE (ObjectFloat_NDSKind_NDS.ValueData, 0) / 100), 2) :: TFloat  AS Price_minO
             , ROUND (MinPrice_List.Price * (1 + COALESCE (ObjectFloat_NDSKind_NDS.ValueData, 0) / 100) * (1 + COALESCE (MarginCategory.MarginPercent, 0)      / 100), 2) :: TFloat  AS Price_min
             , ROUND (MinPrice_List.Price * (1 + COALESCE (ObjectFloat_NDSKind_NDS.ValueData, 0) / 100) * (1 + COALESCE (MarginCategory_site.MarginPercent, 0) / 100), 2) :: TFloat  AS Price_minD

             , MarginCategory.MarginPercent         AS MarginPercent
             , MarginCategory_site.MarginPercent    AS MarginPercent_site
             , Object_MarginCategory.ValueData      AS MarginCategoryName
             , Object_MarginCategory_site.ValueData AS MarginCategoryName_site

             , ObjectFloat_NDSKind_NDS.ValueData    AS NDS
             , Object_NDSKind.ValueData             AS NDSKindName

        FROM _tmpList AS tmpList -- _tmpGoodsMinPrice_List
             -- LEFT JOIN _tmpUnitMinPrice_List ON 1=1

             LEFT JOIN tmpMI_Deferred ON tmpMI_Deferred.GoodsId = tmpList.GoodsId
                                     AND tmpMI_Deferred.UnitId  = tmpList.UnitId

             LEFT JOIN Price_Unit     ON Price_Unit.GoodsId     = tmpList.GoodsId
                                     AND Price_Unit.UnitId      = tmpList.UnitId
             LEFT JOIN _tmpContainerCount AS ContainerCount
                                          ON ContainerCount.GoodsId = tmpList.GoodsId
                                         AND ContainerCount.UnitId  = tmpList.UnitId
             LEFT JOIN _tmpMinPrice_List AS MinPrice_List  ON MinPrice_List.GoodsId  = tmpList.GoodsId

             LEFT JOIN Object AS Object_Unit ON Object_Unit.Id = tmpList.UnitId
             LEFT JOIN Object AS Object_Goods ON Object_Goods.Id = tmpList.GoodsId
             LEFT JOIN Object AS Object_Contract ON Object_Contract.Id = MinPrice_List.ContractId

                            
             LEFT JOIN ObjectLink AS ObjectLink_Goods_NDSKind
                                  ON ObjectLink_Goods_NDSKind.ObjectId = Object_Goods.Id
                                 AND ObjectLink_Goods_NDSKind.DescId = zc_ObjectLink_Goods_NDSKind()
             LEFT JOIN Object AS Object_NDSKind ON Object_NDSKind.Id = ObjectLink_Goods_NDSKind.ChildObjectId
             LEFT JOIN ObjectFloat AS ObjectFloat_NDSKind_NDS
                                   ON ObjectFloat_NDSKind_NDS.ObjectId = ObjectLink_Goods_NDSKind.ChildObjectId
                                  AND ObjectFloat_NDSKind_NDS.DescId = zc_ObjectFloat_NDSKind_NDS()   

             /*LEFT JOIN ObjectString AS ObjectString_Goods_Maker
                                    ON ObjectString_Goods_Maker.ObjectId = Object_Goods.Id
                                   AND ObjectString_Goods_Maker.DescId = zc_ObjectString_Goods_Maker()*/
             LEFT JOIN ObjectLink AS ObjectLink_Goods_GoodsGroup
                                  ON ObjectLink_Goods_GoodsGroup.ObjectId = Object_Goods.Id
                                 AND ObjectLink_Goods_GoodsGroup.DescId = zc_ObjectLink_Goods_GoodsGroup()
             LEFT JOIN Object AS Object_GoodsGroup ON Object_GoodsGroup.Id = ObjectLink_Goods_GoodsGroup.ChildObjectId
             LEFT JOIN ObjectLink AS ObjectLink_Goods_Object
                                  ON ObjectLink_Goods_Object.ObjectId = Object_Goods.Id
                                 AND ObjectLink_Goods_Object.DescId = zc_ObjectLink_Goods_Object()
             LEFT JOIN Object ON Object.Id = ObjectLink_Goods_Object.ChildObjectId

             LEFT JOIN ObjectFloat AS ObjectFloat_Goods_Site
                                   ON ObjectFloat_Goods_Site.ObjectId = Object_Goods.Id
                                  AND ObjectFloat_Goods_Site.DescId = zc_ObjectFloat_Goods_Site()
             LEFT JOIN ObjectBoolean AS ObjectBoolean_Goods_Published
                                     ON ObjectBoolean_Goods_Published.ObjectId = Object_Goods.Id
                                    AND ObjectBoolean_Goods_Published.DescId = zc_ObjectBoolean_Goods_Published()
             LEFT JOIN ObjectString AS ObjectString_Foto
                                     ON ObjectString_Foto.ObjectId = Object_Goods.Id 
                                    AND ObjectString_Foto.DescId = zc_ObjectString_Goods_Foto()
             LEFT JOIN ObjectString AS ObjectString_Thumb
                                     ON ObjectString_Thumb.ObjectId = Object_Goods.Id
                                    AND ObjectString_Thumb.DescId = zc_ObjectString_Goods_Thumb()
             LEFT JOIN ObjectBlob AS ObjectBlob_Site
                                   ON ObjectBlob_Site.ObjectId = Object_Goods.Id
                                  AND ObjectBlob_Site.DescId = zc_objectBlob_Goods_Site()
             LEFT JOIN ObjectBlob AS ObjectBlob_Description
                                   ON ObjectBlob_Description.ObjectId = Object_Goods.Id
                                  AND ObjectBlob_Description.DescId = zc_objectBlob_Goods_Description()
             LEFT JOIN ObjectLink AS ObjectLink_Goods_Appointment
                                  ON ObjectLink_Goods_Appointment.ObjectId = Object_Goods.Id
                                 AND ObjectLink_Goods_Appointment.DescId = zc_ObjectLink_Goods_Appointment()

             LEFT JOIN MarginCategory      ON MinPrice_List.Price >= MarginCategory.MinPrice      AND MinPrice_List.Price < MarginCategory.MaxPrice
                                          AND MarginCategory.UnitId = tmpList.UnitId
             LEFT JOIN MarginCategory_site ON MinPrice_List.Price >= MarginCategory_site.MinPrice AND MinPrice_List.Price < MarginCategory_site.MaxPrice
             LEFT JOIN Object AS Object_MarginCategory      ON Object_MarginCategory.Id      = MarginCategory.MarginCategoryId
             LEFT JOIN Object AS Object_MarginCategory_site ON Object_MarginCategory_site.Id = vbMarginCategoryId_site
       ;

END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;
ALTER FUNCTION gpSelect_GoodsOnUnit_ForSite (TVarChar, TVarChar, TVarChar) OWNER TO postgres;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 19.04.16                                        *
*/

-- ����
-- SELECT * FROM gpSelect_GoodsOnUnit_ForSite (inUnitId_list:= '183292', inGoodsId_list:= '951', inSession:= zfCalc_UserSite()) ORDER BY 1;
-- SELECT * FROM gpSelect_GoodsOnUnit_ForSite (inUnitId_list:= '377613,183292', inGoodsId_list:= '331,951,16876,40618', inSession:= zfCalc_UserSite()) ORDER BY 1;
SELECT p.id, p.id_site, p.name, p.name_site, p.article, p.article, p.unitid, p.juridicalid, p.juridicalname, p.contractid, p.contractname, p.expirationdate, p.manufacturer, p.remains, p.price_unit, p.price_mino, p.price_mino, p.price_min, p.price_mind 
FROM gpselect_goodsonunit_forsite('183292,183288,377605,375627,394426,472116,494882,1529734,1781716,377606,377595,183290,183289,183294,377613,377574,377594,377610,183293,375626,183291', '21157,12940,16876,351328,15661,358,40180,337,343,349,352,355,331,328,46564,17533,361,37468,334,346,340,25420,351331,36076,21169,382,376,379,385,391', zfCalc_UserSite()) AS p 
ORDER BY p.price_unit
