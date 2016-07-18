-- Function: gpGet_Movement_Invoice()

DROP FUNCTION IF EXISTS gpGet_Movement_Invoice (Integer, TDateTime, TVarChar);

CREATE OR REPLACE FUNCTION gpGet_Movement_Invoice(
    IN inMovementId        Integer  , -- ���� ���������
    IN inOperDate          TDateTime, -- ���� ���������
    IN inSession           TVarChar   -- ������ ������������
)
RETURNS TABLE (Id Integer, InvNumber TVarChar, OperDate TDateTime, StatusCode Integer, StatusName TVarChar
             , InsertDate TDateTime, InsertName TVarChar

             , PriceWithVAT Boolean, VATPercent TFloat, ChangePercent TFloat
             , CurrencyValue TFloat
             , CurrencyDocumentId Integer, CurrencyDocumentName TVarChar

             , JuridicalId Integer, JuridicalName TVarChar
             , ContractId Integer, ContractName TVarChar
             , PaidKindId Integer, PaidKindName TVarChar
             , Comment TVarChar
             , OrderIncomeId Integer, OrderIncomeName TVarChar
              )
AS
$BODY$
  DECLARE vbUserId Integer;
BEGIN

     -- �������� ���� ������������ �� ����� ���������
     -- vbUserId := PERFORM lpCheckRight (inSession, zc_Enum_Process_Get_Movement_Invoice());
     vbUserId := inSession;

     IF COALESCE (inMovementId, 0) = 0
     THEN
     RETURN QUERY
         SELECT
               0 AS Id
             , CAST (NEXTVAL ('movement_invoice_seq') AS TVarChar) AS InvNumber
             , inOperDate                                 AS OperDate
             , Object_Status.Code                         AS StatusCode
             , Object_Status.Name                         AS StatusName
             
             , CURRENT_TIMESTAMP ::TDateTime              AS InsertDate
             , COALESCE(Object_Insert.ValueData,'')  ::TVarChar AS InsertName
                          
             , CAST (True as Boolean)                     AS PriceWithVAT
             , CAST (20 as TFloat)                        AS VATPercent
             , CAST (0 as TFloat)                         AS ChangePercent
             , CAST (1 as TFloat)                         AS CurrencyValue

             , Object_CurrencyDocument.Id                 AS CurrencyDocumentId	-- ���
             , Object_CurrencyDocument.ValueData          AS CurrencyDocumentName

             , 0                                          AS JuridicalId
             , CAST ('' as TVarChar)                      AS JuridicalName
             , 0                                          AS ContractId
             , CAST ('' as TVarChar)                      AS ContractName
             , 0                                          AS PaidKindId
             , CAST ('' as TVarChar)                      AS PaidKindName  
  
             , CAST ('' as TVarChar) 	                  AS Comment
             , 0                                          AS OrderIncomeId
             , CAST ('' as TVarChar) 	                  AS OrderIncomeName

          FROM lfGet_Object_Status(zc_Enum_Status_UnComplete()) AS Object_Status
               LEFT JOIN Object AS Object_Insert ON Object_Insert.Id = vbUserId
               JOIN Object AS Object_CurrencyDocument ON Object_CurrencyDocument.descid= zc_Object_Currency()
                                             AND Object_CurrencyDocument.id = 14461	             -- ���
          ;

     ELSE

     RETURN QUERY
       WITH tmpMI AS (SELECT MI_OrderIncome.MovementId AS MovementId
                      FROM MovementItem
                           INNER JOIN MovementItemFloat AS MIFloat_MovementId
                                                        ON MIFloat_MovementId.MovementItemId = MovementItem.Id
                                                       AND MIFloat_MovementId.DescId = zc_MIFloat_MovementItemId()
                                                       AND MIFloat_MovementId.ValueData > 0
                           INNER JOIN MovementItem AS MI_OrderIncome ON MI_OrderIncome.Id = MIFloat_MovementId.ValueData :: Integer
                      WHERE MovementItem.MovementId = inMovementId
                        AND MovementItem.DescId     = zc_MI_Master()
                        AND MovementItem.isErased   = FALSE
                      ORDER BY MovementItem.Id DESC
                      LIMIT 1
                     )
      SELECT Movement.Id                            AS Id
           , Movement.InvNumber                     AS InvNumber
           , Movement.OperDate                      AS OperDate
           , Object_Status.ObjectCode               AS StatusCode
           , Object_Status.ValueData                AS StatusName
           
           , MovementDate_Insert.ValueData          AS InsertDate
           , Object_Insert.ValueData                AS InsertName
           
           , MovementBoolean_PriceWithVAT.ValueData AS PriceWithVAT
           , MovementFloat_VATPercent.ValueData     AS VATPercent
           , MovementFloat_ChangePercent.ValueData  AS ChangePercent
           , MovementFloat_CurrencyValue.ValueData  AS CurrencyValue

           , Object_CurrencyDocument.Id             AS CurrencyDocumentId
           , Object_CurrencyDocument.ValueData      AS CurrencyDocumentName


           , Object_Juridical.Id                    AS JuridicalId
           , Object_Juridical.ValueData             AS JuridicalName

           , Object_Contract.Id                     AS ContractId
           , Object_Contract.ValueData              AS ContractName

           , Object_PaidKind.Id                     AS PaidKindId
           , Object_PaidKind.ValueData              AS PaidKindName

           , MovementString_Comment.ValueData       AS Comment
           , tmpMI.MovementId                       AS OrderIncomeId
           , zfCalc_PartionMovementName (Movement_OrderIncome.DescId, MovementDesc_OrderIncome.ItemName, Movement_OrderIncome.InvNumber, Movement_OrderIncome.OperDate) AS OrderIncomeName

       FROM Movement
            LEFT JOIN tmpMI ON 1 = 1
            LEFT JOIN Movement AS Movement_OrderIncome ON Movement_OrderIncome.Id = tmpMI.MovementId
            LEFT JOIN MovementDesc AS MovementDesc_OrderIncome ON MovementDesc_OrderIncome.Id = Movement_OrderIncome.DescId
            
            LEFT JOIN Object AS Object_Status ON Object_Status.Id = Movement.StatusId

            LEFT JOIN MovementDate AS MovementDate_Insert
                                   ON MovementDate_Insert.MovementId =  Movement.Id
                                  AND MovementDate_Insert.DescId = zc_MovementDate_Insert()

            LEFT JOIN MovementLinkObject AS MLO_Insert
                                         ON MLO_Insert.MovementId = Movement.Id
                                        AND MLO_Insert.DescId = zc_MovementLinkObject_Insert()
            LEFT JOIN Object AS Object_Insert ON Object_Insert.Id = MLO_Insert.ObjectId  

            LEFT JOIN MovementString AS MovementString_Comment 
                                     ON MovementString_Comment.MovementId = Movement.Id
                                    AND MovementString_Comment.DescId = zc_MovementString_Comment()

            LEFT JOIN MovementBoolean AS MovementBoolean_PriceWithVAT
                                      ON MovementBoolean_PriceWithVAT.MovementId =  Movement.Id
                                     AND MovementBoolean_PriceWithVAT.DescId = zc_MovementBoolean_PriceWithVAT()
            LEFT JOIN MovementFloat AS MovementFloat_VATPercent
                                    ON MovementFloat_VATPercent.MovementId =  Movement.Id
                                   AND MovementFloat_VATPercent.DescId = zc_MovementFloat_VATPercent()
            LEFT JOIN MovementFloat AS MovementFloat_ChangePercent
                                    ON MovementFloat_ChangePercent.MovementId =  Movement.Id
                                   AND MovementFloat_ChangePercent.DescId = zc_MovementFloat_ChangePercent()
            LEFT JOIN MovementFloat AS MovementFloat_CurrencyValue
                                    ON MovementFloat_CurrencyValue.MovementId =  Movement.Id
                                   AND MovementFloat_CurrencyValue.DescId = zc_MovementFloat_CurrencyValue()

            LEFT JOIN MovementLinkObject AS MovementLinkObject_Contract
                                         ON MovementLinkObject_Contract.MovementId = Movement.Id
                                        AND MovementLinkObject_Contract.DescId = zc_MovementLinkObject_Contract()
            LEFT JOIN Object AS Object_Contract ON Object_Contract.Id = MovementLinkObject_Contract.ObjectId

            LEFT JOIN MovementLinkObject AS MovementLinkObject_PaidKind
                                         ON MovementLinkObject_PaidKind.MovementId = Movement.Id
                                        AND MovementLinkObject_PaidKind.DescId = zc_MovementLinkObject_PaidKind()
            LEFT JOIN Object AS Object_PaidKind ON Object_PaidKind.Id = MovementLinkObject_PaidKind.ObjectId

            LEFT JOIN MovementLinkObject AS MovementLinkObject_Juridical
                                         ON MovementLinkObject_Juridical.MovementId = Movement.Id
                                        AND MovementLinkObject_Juridical.DescId = zc_MovementLinkObject_Juridical()
            LEFT JOIN Object AS Object_Juridical ON Object_Juridical.Id = MovementLinkObject_Juridical.ObjectId

            LEFT JOIN MovementLinkObject AS MovementLinkObject_CurrencyDocument
                                         ON MovementLinkObject_CurrencyDocument.MovementId = Movement.Id
                                        AND MovementLinkObject_CurrencyDocument.DescId = zc_MovementLinkObject_CurrencyDocument()
            LEFT JOIN Object AS Object_CurrencyDocument ON Object_CurrencyDocument.Id = MovementLinkObject_CurrencyDocument.ObjectId
    
       WHERE Movement.Id =  inMovementId
         AND Movement.DescId = zc_Movement_Invoice();

       END IF;

END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;


/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 15.07.16         *                                                       *
*/

-- ����
-- 