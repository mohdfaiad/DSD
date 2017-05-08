-- Function: gpSelect_MovementItem_Inventory()

DROP FUNCTION IF EXISTS gpSelect_MovementItem_Inventory (Integer, Boolean, TVarChar);

CREATE OR REPLACE FUNCTION gpSelect_MovementItem_Inventory(
    IN inMovementId       Integer      , -- ���� ���������
    IN inIsErased         Boolean      , -- 
    IN inSession          TVarChar       -- ������ ������������
)
RETURNS TABLE (Id Integer, PartionId Integer
             , GoodsId Integer, GoodsCode Integer, GoodsName TVarChar
             , GoodsGroupNameFull TVarChar, MeasureName TVarChar
             , CompositionGroupName TVarChar
             , CompositionName TVarChar
             , GoodsInfoName TVarChar
             , LineFabricaName TVarChar
             , LabelName TVarChar
             , GoodsSizeName TVarChar
             , Amount TFloat, AmountSecond TFloat, AmountRemains TFloat, AmountSecondRemains TFloat
             , CountForPrice TFloat
             , OperPrice TFloat, OperPriceList TFloat
             , AmountSumm TFloat, AmountSummRemains TFloat
             , AmountPriceListSumm TFloat, AmountPriceListSummRemains TFloat
             , AmountSecondSumm TFloat, AmountSecondRemainsSumm TFloat
             , AmountSecondPriceListSumm TFloat, AmountSecondRemainsPLSumm TFloat
             , Comment TVarChar
             , isErased Boolean
              )
AS
$BODY$
  DECLARE vbUserId Integer;

  DECLARE vbUnitId Integer;
  DECLARE vbPriceListId Integer;
  DECLARE vbPartnerId Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     -- vbUserId := PERFORM lpCheckRight (inSession, zc_Enum_Process_Select_MI_Inventory());
     vbUserId:= lpGetUserBySession (inSession);

      -- ��������� �����
     RETURN QUERY 
       WITH tmpMI AS (SELECT MovementItem.Id
                           , MovementItem.ObjectId AS GoodsId
                           , MovementItem.PartionId
                           , MovementItem.Amount 
                           , COALESCE (MIFloat_AmountSecond.ValueData, 0)    AS AmountSecond
                           , COALESCE (MIFloat_AmountRemains.ValueData, 0)   AS AmountRemains
                           , COALESCE (MIFloat_AmountSecondRemains.ValueData, 0) AS AmountSecondRemains
                           , COALESCE (MIFloat_CountForPrice.ValueData, 1)   AS CountForPrice
                           , COALESCE (MIFloat_OperPrice.ValueData, 0)       AS OperPrice
                           , COALESCE (MIFloat_OperPriceList.ValueData, 0)   AS OperPriceList
                           , COALESCE (MIString_Comment.ValueData,'')        AS Comment
                           , MovementItem.isErased
                       FROM (SELECT FALSE AS isErased UNION ALL SELECT inIsErased AS isErased WHERE inIsErased = TRUE) AS tmpIsErased
                            JOIN MovementItem ON MovementItem.MovementId = inMovementId
                                             AND MovementItem.DescId     = zc_MI_Master()
                                             AND MovementItem.isErased   = tmpIsErased.isErased
                            LEFT JOIN MovementItemString AS MIString_Comment
                                                        ON MIString_Comment.MovementItemId = MovementItem.Id
                                                       AND MIString_Comment.DescId = zc_MIString_Comment()

                            LEFT JOIN MovementItemFloat AS MIFloat_CountForPrice
                                                        ON MIFloat_CountForPrice.MovementItemId = MovementItem.Id
                                                       AND MIFloat_CountForPrice.DescId = zc_MIFloat_CountForPrice()

                            LEFT JOIN MovementItemFloat AS MIFloat_AmountRemains
                                                        ON MIFloat_AmountRemains.MovementItemId = MovementItem.Id
                                                       AND MIFloat_AmountRemains.DescId = zc_MIFloat_AmountRemains()
                            LEFT JOIN MovementItemFloat AS MIFloat_AmountSecond
                                                        ON MIFloat_AmountSecond.MovementItemId = MovementItem.Id
                                                       AND MIFloat_AmountSecond.DescId = zc_MIFloat_AmountSecond()
                            LEFT JOIN MovementItemFloat AS MIFloat_AmountSecondRemains
                                                        ON MIFloat_AmountSecondRemains.MovementItemId = MovementItem.Id
                                                       AND MIFloat_AmountSecondRemains.DescId = zc_MIFloat_AmountSecondRemains()

                            LEFT JOIN MovementItemFloat AS MIFloat_OperPrice
                                                        ON MIFloat_OperPrice.MovementItemId = MovementItem.Id
                                                       AND MIFloat_OperPrice.DescId = zc_MIFloat_OperPrice()
                            LEFT JOIN MovementItemFloat AS MIFloat_OperPriceList
                                                        ON MIFloat_OperPriceList.MovementItemId = MovementItem.Id
                                                       AND MIFloat_OperPriceList.DescId = zc_MIFloat_OperPriceList()
                       )

       -- ���������
       SELECT
             tmpMI.Id
           , tmpMI.PartionId
           , Object_Goods.Id          AS GoodsId
           , Object_Goods.ObjectCode  AS GoodsCode
           , Object_Goods.ValueData   AS GoodsName
           , ObjectString_Goods_GoodsGroupFull.ValueData AS GoodsGroupNameFull
           , Object_Measure.ValueData AS MeasureName

           , Object_CompositionGroup.ValueData  AS CompositionGroupName  
           , Object_Composition.ValueData   AS CompositionName
           , Object_GoodsInfo.ValueData     AS GoodsInfoName
           , Object_LineFabrica.ValueData   AS LineFabricaName
           , Object_Label.ValueData         AS LabelName
           , Object_GoodsSize.ValueData     AS GoodsSizeName 

           , tmpMI.Amount
           , tmpMI.AmountSecond         ::TFloat
           , tmpMI.AmountRemains        ::TFloat
           , tmpMI.AmountSecondRemains  ::TFloat
           , tmpMI.CountForPrice        ::TFloat
           , tmpMI.OperPrice            ::TFloat
           , tmpMI.OperPriceList        ::TFloat
           , CASE WHEN tmpMI.CountForPrice <> 0 THEN (tmpMI.Amount * tmpMI.OperPrice / tmpMI.CountForPrice) ELSE (tmpMI.Amount * tmpMI.OperPrice) END                       ::TFloat AS AmountSumm
           , CASE WHEN tmpMI.CountForPrice <> 0 THEN (tmpMI.AmountRemains * tmpMI.OperPrice / tmpMI.CountForPrice) ELSE (tmpMI.AmountRemains * tmpMI.OperPrice) END         ::TFloat AS AmountSummRemains
           , CASE WHEN tmpMI.CountForPrice <> 0 THEN (tmpMI.Amount * tmpMI.OperPriceList / tmpMI.CountForPrice) ELSE (tmpMI.Amount * tmpMI.OperPriceList) END               ::TFloat AS AmountPriceListSumm
           , CASE WHEN tmpMI.CountForPrice <> 0 THEN (tmpMI.AmountRemains * tmpMI.OperPriceList / tmpMI.CountForPrice) ELSE (tmpMI.AmountRemains * tmpMI.OperPriceList) END ::TFloat AS AmountPriceListSummRemains

           , CASE WHEN tmpMI.CountForPrice <> 0 THEN (tmpMI.AmountSecond * tmpMI.OperPrice / tmpMI.CountForPrice) ELSE (tmpMI.AmountSecond * tmpMI.OperPrice) END                       ::TFloat AS AmountSecondSumm
           , CASE WHEN tmpMI.CountForPrice <> 0 THEN (tmpMI.AmountSecondRemains * tmpMI.OperPrice / tmpMI.CountForPrice) ELSE (tmpMI.AmountSecondRemains * tmpMI.OperPrice) END         ::TFloat AS AmountSecondRemainsSumm
           , CASE WHEN tmpMI.CountForPrice <> 0 THEN (tmpMI.AmountSecond * tmpMI.OperPriceList / tmpMI.CountForPrice) ELSE (tmpMI.AmountSecond * tmpMI.OperPriceList) END               ::TFloat AS AmountSecondPriceListSumm
           , COALESCE( CASE WHEN tmpMI.CountForPrice <> 0 THEN (tmpMI.AmountSecondRemains * tmpMI.OperPriceList / tmpMI.CountForPrice) ELSE (tmpMI.AmountSecondRemains * tmpMI.OperPriceList) END, 0) ::TFloat AS AmountSecondRemainsPLSumm
                                                                                                                                                                                                   -- AmountSecondRemainsPLSumm
           , tmpMI.Comment              ::TVarChar
           , tmpMI.isErased

       FROM tmpMI
            LEFT JOIN Object AS Object_Goods ON Object_Goods.Id = tmpMI.GoodsId
            LEFT JOIN Object_PartionGoods ON Object_PartionGoods.MovementItemId = tmpMI.PartionId                                 

            LEFT JOIN Object AS Object_GoodsGroup       ON Object_GoodsGroup.Id       = Object_PartionGoods.GoodsGroupId
            LEFT JOIN Object AS Object_Measure          ON Object_Measure.Id          = Object_PartionGoods.MeasureId
            LEFT JOIN Object AS Object_Composition      ON Object_Composition.Id      = Object_PartionGoods.CompositionId
            LEFT JOIN Object AS Object_CompositionGroup ON Object_CompositionGroup.Id = Object_PartionGoods.CompositionGroupId
            LEFT JOIN Object AS Object_GoodsInfo        ON Object_GoodsInfo.Id        = Object_PartionGoods.GoodsInfoId
            LEFT JOIN Object AS Object_LineFabrica      ON Object_LineFabrica.Id      = Object_PartionGoods.LineFabricaId 
            LEFT JOIN Object AS Object_Label            ON Object_Label.Id            = Object_PartionGoods.LabelId
            LEFT JOIN Object AS Object_GoodsSize        ON Object_GoodsSize.Id        = Object_PartionGoods.GoodsSizeId
           
            LEFT JOIN ObjectString AS ObjectString_Goods_GoodsGroupFull
                                   ON ObjectString_Goods_GoodsGroupFull.ObjectId = tmpMI.GoodsId
                                  AND ObjectString_Goods_GoodsGroupFull.DescId   = zc_ObjectString_Goods_GroupNameFull()
       ;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.
 25.04.17         *
*/

-- ����
--select * from gpSelect_MovementItem_Inventory(inMovementId := 23 , inIsErased := 'False' ,  inSession := '2');