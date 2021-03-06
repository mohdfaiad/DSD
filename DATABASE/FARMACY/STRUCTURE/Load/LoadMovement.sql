/*
  �������� 
    - ������� LoadMovement (������������� ������� ��������)
    - ������
    - ��������
*/

-- Table: Movement

-- DROP TABLE LoadMovementItem; DROP TABLE LoadMovement;

/*-------------------------------------------------------------------------------*/
CREATE TABLE LoadMovement
(
  Id            serial    NOT NULL PRIMARY KEY,
  InvNumber	TVarChar, -- ����� ���������
  OperDate	TDateTime, -- ���� ���������
  TotalCount	TFloat  , -- ����� ����������
  TotalSumm	TFloat  , -- ����� �����
  JuridicalId	Integer , -- ����������� ����
  ContractId	Integer , -- ������� ����
  UnitId        Integer , -- �������������
  NDSKindId	Integer ,  -- ���� ���
  isNDSinPrice	boolean ,  -- ��� � ����?
  isAllGoodsConcat Boolean, -- ��� �� ������ ����� �����
  CONSTRAINT fk_LoadMovement_JuridicalId FOREIGN KEY (JuridicalId)    REFERENCES Object (id),
  CONSTRAINT fk_LoadMovement_ContractId FOREIGN KEY (ContractId)     REFERENCES Object (id),
  CONSTRAINT fk_LoadMovement_UnitId      FOREIGN KEY (UnitId)         REFERENCES Object (id),
  CONSTRAINT fk_LoadMovement_NDSKindId   FOREIGN KEY (NDSKindId)      REFERENCES Object (id)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE LoadMovement
  OWNER TO postgres;
 
CREATE INDEX idx_LoadMovement_OperDate    ON LoadMovement(OperDate);
CREATE INDEX idx_LoadMovement_JuridicalId ON LoadMovement(JuridicalId); 
CREATE INDEX idx_LoadMovement_ContractId  ON LoadMovement(ContractId); 
CREATE INDEX idx_LoadMovement_UnitId      ON LoadMovement(UnitId); -- ����������
CREATE INDEX idx_LoadMovement_NDSKindId   ON LoadMovement(NDSKindId);


/*-------------------------------------------------------------------------------*/



/*
 ����������:
 ������� ����������:
 ����         �����
 ----------------
                 ���������� �.�.   ������ �.�.   
*/
