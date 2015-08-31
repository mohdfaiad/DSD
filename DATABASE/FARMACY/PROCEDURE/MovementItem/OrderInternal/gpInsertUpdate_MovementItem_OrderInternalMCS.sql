-- Function: gpInsertUpdate_MovementItem_OrderInternal()

DROP FUNCTION IF EXISTS gpInsertUpdate_MovementItem_OrderInternalMCS(Integer, Boolean, TVarChar);

CREATE OR REPLACE FUNCTION gpInsertUpdate_MovementItem_OrderInternalMCS(
    IN inUnitId              Integer   , -- �������������
    IN inNeedCreate          Boolean   , -- ����� �� ���������
   OUT outOrderExists        Boolean   , -- ������ ����������
    IN inSession             TVarChar    -- ������ ������������
)
RETURNS Boolean
AS
$BODY$
   DECLARE vbUserId Integer;
   DECLARE vbObjectId Integer;
   DECLARE vbId Integer;
   DECLARE vbMovementId Integer;
   DECLARE vbOperDate TDateTime;
BEGIN
    -- �������� ���� ������������ �� ����� ���������
    -- PERFORM lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_MovementItem_OrderInternal());
    IF inNeedCreate = True  --���� � ���������� ��������� ����� �� �������������
    THEN -- �� ������������ ������ �� ������� ����� �������� � ���
        vbUserId := inSession;
        vbObjectId := lpGet_DefaultValue('zc_Object_Retail', vbUserId);
        vbOperDate := CURRENT_DATE;
        --���� ������ �� �������, ����������, �������� ���������
        SELECT Movement.Id INTO vbMovementId
        FROM Movement
            JOIN MovementLinkObject AS MovementLinkObject_Unit
                                    ON MovementLinkObject_Unit.MovementId = Movement.Id
                                   AND MovementLinkObject_Unit.DescId = zc_MovementLinkObject_Unit()
        WHERE 
            Movement.StatusId = zc_Enum_Status_UnComplete() 
            AND 
            Movement.DescId = zc_Movement_OrderInternal() 
            AND 
            Movement.OperDate = vbOperDate 
            AND 
            MovementLinkObject_Unit.ObjectId = inUnitId
        ORDER BY
            Movement.Id
        LIMIT 1;

        IF COALESCE(vbMovementId, 0) = 0 THEN --���� ����� ��� - �������
            vbMovementId := gpInsertUpdate_Movement_OrderInternal(0, '', vbOperDate, inUnitId, 0, inSession);
        END IF;
        --������� ���������� ������
        DELETE FROM MovementItemFloat
        WHERE 
            MovementItemId in (
                                SELECT MovementItem.Id 
                                FROM MovementItem
                                    INNER JOIN MovementItemFloat AS MIFloat_AmountSecond
                                                                 ON MIFloat_AmountSecond.MovementItemId = MovementItem.Id
                                                                AND MIFloat_AmountSecond.DescId = zc_MIFloat_AmountSecond() 
                                WHERE 
                                    MovementItem.MovementId = vbMovementId
                              )
            AND
            DescId = zc_MIFloat_AmountManual();
        
        
        DELETE FROM MovementItemFloat
        WHERE 
            MovementItemId in (
                                SELECT Id from MovementItem
                                Where MovementItem.MovementId = vbMovementId
                              )
            AND
            DescId = zc_MIFloat_AmountSecond();
        --�������� �������� ������� ����� �������� � ���
        PERFORM
            lpInsertUpdate_MovementItemFloat(inDescId         := zc_MIFloat_AmountSecond()
                                            ,inMovementItemId := lpInsertUpdate_MovementItem_OrderInternal(ioId         := COALESCE(MovementItemSaved.Id,0)
                                                                                                          ,inMovementId := vbMovementId
                                                                                                          ,inGoodsId    := Object_Price.GoodsId
                                                                                                          ,inAmount     := COALESCE(MovementItemSaved.Amount,0)
                                                                                                          ,inAmountManual:= NULL
                                                                                                          ,inPrice      := Object_Price.Price
                                                                                                          ,inUserId     := vbUserId)
                                           ,inValueData       := floor(Object_Price.MCSValue - SUM(COALESCE(Container.Amount,0)))::TFloat)
        from Object_Price_View AS Object_Price
            LEFT OUTER JOIN ContainerLinkObject AS ContainerLinkObject_Unit
                                                ON ContainerLinkObject_Unit.DescId = zc_ContainerLinkObject_Unit()
                                               AND ContainerLinkObject_Unit.ObjectId = Object_Price.UnitId
            LEFT OUTER JOIN Container ON ContainerLinkObject_Unit.ContainerId = Container.Id
                                     AND Container.ObjectId = Object_Price.GoodsId
                                     AND Container.DescId = zc_Container_Count() 
                                     AND Container.Amount > 0
            LEFT OUTER JOIN MovementItem AS MovementItemSaved
                                         ON MovementItemSaved.MovementId = vbMovementId
                                        AND MovementItemSaved.ObjectId = Object_Price.GoodsId
            LEFT OUTER JOIN Object_Goods_View ON Object_Price.GoodsId = Object_Goods_View.Id                            
        WHERE
            Object_Price.MCSValue > 0
            AND
            Object_Price.MCSIsClose = False 
            AND
            Object_Price.UnitId = inUnitId
        GROUP BY
            Object_Price.UnitId,
            Object_Price.GoodsId,
            Object_Price.MCSValue,
            Object_Price.Price,
            MovementItemSaved.Id,
            MovementItemSaved.Amount,
            Object_Price.MCSValue,
            Object_Goods_View.MinimumLot
        HAVING
            floor(Object_Price.MCSValue - SUM(COALESCE(Container.Amount,0)))::TFloat > 0;
        --������������� ������ ���������� ��� ����� � ������������
        PERFORM
            lpInsertUpdate_MovementItemFloat(inDescId         := zc_MIFloat_AmountManual()
                                            ,inMovementItemId := MovementItemSaved.Id
                                            ,inValueData      := (CEIL((MovementItemSaved.Amount + COALESCE(MIFloat_AmountSecond.ValueData,0)) / COALESCE(Object_Goods.MinimumLot, 1)) * COALESCE(Object_Goods.MinimumLot, 1))
                                            )
        FROM
            MovementItem AS MovementItemSaved
            INNER JOIN MovementItemFloat AS MIFloat_AmountSecond
                                         ON MIFloat_AmountSecond.MovementItemId = MovementId
                                                                AND MIFloat_AmountSecond.DescId = zc_MIFloat_AmountSecond() 
            INNER JOIN Object_Goods_View AS Object_Goods
                                         ON Object_Goods.Id = MovementItemSaved.ObjectId
        WHERE
            MovementItemSaved.MovementId = vbMovementId;
    END IF;
    IF EXISTS(  SELECT Movement.Id
                FROM Movement
                    JOIN MovementLinkObject AS MovementLinkObject_Unit
                                            ON MovementLinkObject_Unit.MovementId = Movement.Id
                                           AND MovementLinkObject_Unit.DescId = zc_MovementLinkObject_Unit()
                WHERE 
                    Movement.StatusId = zc_Enum_Status_UnComplete() 
                    AND 
                    Movement.DescId = zc_Movement_OrderInternal() 
                    AND 
                    Movement.OperDate = vbOperDate 
                    AND 
                    MovementLinkObject_Unit.ObjectId = inUnitId
             )
    THEN
        outOrderExists := True;
    ELSE
        outOrderExists := False;
    END IF;        
      
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE;


/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.   ��������� �.�.
 29.08.15                                                                        * ObjectPrice.MCSIsClose = False
 31.07.15                                                                        *
*/

-- ����
-- SELECT * FROM gpInsertUpdate_MovementItem_OrderInternalMCS (inUnitId := 183292, inNeedCreate:= True, inSession:= '3')
