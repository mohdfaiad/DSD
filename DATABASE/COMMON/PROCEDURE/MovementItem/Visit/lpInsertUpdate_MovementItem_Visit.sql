-- Function: lpInsertUpdate_MovementItem_Visit()

DROP FUNCTION IF EXISTS lpInsertUpdate_MovementItem_Visit (Integer, Integer, Integer, TFloat, TVarChar, Integer);

CREATE OR REPLACE FUNCTION lpInsertUpdate_MovementItem_Visit(
 INOUT ioId                Integer   , -- ���� ������� <������� ���������>
    IN inMovementId        Integer   , -- ���� ������� <��������>
    IN inPhotoMobileId     Integer   , -- ������
    IN inAmount            TFloat    , -- ����������
    IN inComment           TVarChar  , -- 
    IN inUserId            Integer     -- ������������
)
RETURNS Integer AS
$BODY$
   DECLARE vbIsInsert Boolean;
BEGIN
      -- ������������ ������� ��������/�������������
      vbIsInsert:= COALESCE (ioId, 0) = 0;

      -- ��������� <������� ���������>
      ioId := lpInsertUpdate_MovementItem (ioId, zc_MI_Master(), inPhotoMobileId, inMovementId, inAmount, NULL);

      -- ��������� �������� <>
      PERFORM lpInsertUpdate_MovementItemString (zc_MIString_Comment(), ioId, inComment);

      -- ��������� ��������
      PERFORM lpInsert_MovementItemProtocol (ioId, inUserId, vbIsInsert);

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   �������� �.�.
 26.03.17         *
*/

-- ����
-- SELECT * FROM lpInsertUpdate_MovementItem_Visit (ioId:= 0, inMovementId:= 10, inPhotoMobileId:= 1, inAmount:= 0, inPhotoMobileKindId:= 0, inUserId:= 1, inGUID:= NULL)