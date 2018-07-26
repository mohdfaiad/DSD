-- Function: gpInsertUpdate_Movement_Check_ver3()

DROP FUNCTION IF EXISTS gpInsertUpdate_Movement_Check_ver3 (Integer, TDateTime,  TVarChar, Integer, Integer, TVarChar, TVarChar, Boolean, Integer, TVarChar, TVarChar, TVarChar, TVarChar, Integer, TVarChar, TVarChar, TVarChar, TDateTime, Integer, Integer, Integer, TVarChar, TVarChar);

CREATE OR REPLACE FUNCTION gpInsertUpdate_Movement_Check_ver3(
 INOUT ioId                  Integer   , -- Ключ объекта <Документ ЧЕК>
    IN inDate                TDateTime , -- Дата/время документа
    IN inCashRegister        TVarChar  , -- Серийник кассового аппарата
    IN inPaidType            Integer   , -- тип оплаты
    IN inManagerId           Integer   , -- Менеджер
    IN inBayer               TVarChar  , -- Покупатель ВИП
    IN inFiscalCheckNumber   TVarChar  , -- Номер фискального чека
    IN inNotMCS              Boolean   , -- Не участвует в расчете НТЗ
    IN inDiscountExternalId  Integer   , -- Проект дисконтных карт
    IN inDiscountCardNumber  TVarChar  , -- № Дисконтной карты
    IN inBayerPhone          TVarChar  , -- ***Контактный телефон (Покупателя)
    IN inConfirmedKindName   TVarChar  , -- ***Статус заказа (Состояние VIP-чека)
    IN inInvNumberOrder      TVarChar  , -- ***Номер заказа (с сайта)
    IN inPartnerMedicalId    Integer   , -- Медицинское учреждение(Соц. проект)
    IN inAmbulance           TVarChar  , --
    IN inMedicSP             TVarChar  , -- ФИО врача (Соц. проект)
    IN inInvNumberSP         TVarChar  , -- номер рецепта (Соц. проект)
    IN inOperDateSP          TDateTime , -- дата рецепта (Соц. проект)
    IN inSPKindId            Integer   , -- Вид СП
    IN inPromoCodeId         Integer   , -- Id промокода
    IN inManualDiscount      Integer   , -- Ручная скидка
    IN inUserSession	     TVarChar  , -- сессия пользователя под которой создан чек в программе
    IN inSession             TVarChar    -- сессия пользователя
)
RETURNS Integer
AS
$BODY$
   DECLARE vbUserId Integer;
   DECLARE vbIsInsert Boolean;

   DECLARE vbUnitId Integer;
   DECLARE vbUnitKey TVarChar;
   DECLARE vbInvNumber Integer;
   DECLARE vbCashRegisterId Integer;
   DECLARE vbPaidTypeId Integer;
BEGIN
    -- !!!заменили!!!
    IF COALESCE (inUserSession, '') <> '' AND inUserSession <> '5'
    THEN
        inSession := inUserSession;
    END IF;

    -- проверка прав пользователя на вызов процедуры
    -- PERFORM lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_Movement_...());
    vbUserId := lpGetUserBySession (inSession);

    vbUnitKey := COALESCE(lpGet_DefaultValue('zc_Object_Unit', vbUserId), '');
    IF vbUnitKey = '' THEN
        vbUnitKey := '0';
    END IF;
    vbUnitId := vbUnitKey::Integer;

    IF COALESCE(vbUnitId, 0) = 0 THEN
        RAISE EXCEPTION 'Для пользователя не установлено значение параметра Подразделение';
    END IF;

    IF inDate is null
    THEN
        inDate := CURRENT_TIMESTAMP::TDateTime;
    END IF;

    -- определяем признак Создание/Корректировка
    vbIsInsert:= COALESCE (ioId, 0) = 0;

    IF COALESCE(ioId,0) = 0
    THEN
        SELECT
            COALESCE(MAX(zfConvert_StringToNumber(InvNumber)), 0) + 1
        INTO
            vbInvNumber
        FROM
            Movement_Check_View
        WHERE
            Movement_Check_View.UnitId = vbUnitId
            AND
            Movement_Check_View.OperDate > CURRENT_DATE;
    ELSE
        SELECT
            InvNumber
        INTO
            vbInvNumber
        FROM
            Movement_Check_View
        WHERE
            Movement_Check_View.Id = ioId;
    END IF;


    -- сохранили <Документ>
    ioId := lpInsertUpdate_Movement (ioId, zc_Movement_Check(), vbInvNumber::TVarChar, inDate, NULL);

    -- сохранили связь с <Подразделением>
    PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_Unit(), ioId, vbUnitId);

    -- сохранили связь с кассовым аппаратом
    IF COALESCE(inCashRegister,'') <> ''
    THEN
        vbCashRegisterId := gpGet_Object_CashRegister_By_Serial(inSerial := inCashRegister,
                                                                inSession := inSession);
        PERFORM lpInsertUpdate_MovementLinkObject(zc_MovementLinkObject_CashRegister(),ioId,vbCashRegisterId);
    END IF;

    -- сохранили отметку <Не участвует в расчете НТЗ>
    PERFORM lpInsertUpdate_MovementBoolean (zc_MovementBoolean_NotMCS(), ioId, inNotMCS);

    -- сохранили Номер чека в кассовом аппарате
    PERFORM lpInsertUpdate_MovementString(zc_MovementString_FiscalCheckNumber(),ioId,inFiscalCheckNumber);

    -- сохранили связь с <Тип оплаты>
    IF inPaidType <> -1
    THEN
        if inPaidType = 0
        THEN
            PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_PaidType(),ioId,zc_Enum_PaidType_Cash());
        ELSEIF inPaidType = 1
        THEN
            PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_PaidType(),ioId,zc_Enum_PaidType_Card());
        ELSE
            RAISE EXCEPTION 'Ошибка.Не определен тип оплаты';
        END IF;
    END IF;

    -- сохранили связь с менеджером и покупателем + <Статус заказа (Состояние VIP-чека)>
    IF COALESCE (inManagerId,0) <> 0
    THEN
        -- сохранили менеджера
        PERFORM lpInsertUpdate_MovementLinkObject(zc_MovementLinkObject_CheckMember(), ioId, inManagerId);
        -- сохранили ФИО покупателя
        PERFORM lpInsertUpdate_MovementString(zc_MovementString_Bayer(), ioId, inBayer);
        -- Отмечаем документ как отложенный
        PERFORM lpInsertUpdate_MovementBoolean(zc_MovementBoolean_Deferred(), ioId, TRUE);
        -- !!! только 1 раз!!! сохранили
        IF vbIsInsert = TRUE
        THEN
            -- сохранили связь с <Статус заказа (Состояние VIP-чека)>
            PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_ConfirmedKind(), ioId, zc_Enum_ConfirmedKind_Complete());
        END IF;

    END IF;

    -- сохранили связь с <Дисконтная карта> + здесь же и сформировали <Дисконтная карта>
    PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_DiscountCard(), ioId, CASE WHEN inDiscountExternalId > 0 THEN lpInsertFind_Object_DiscountCard (inObjectId:= inDiscountExternalId, inValue:= inDiscountCardNumber, inUserId:= vbUserId) ELSE 0 END);

    -- сохранили связь с <>
    PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_PartnerMedical(), ioId, inPartnerMedicalId);
    -- сохранили <>
    PERFORM lpInsertUpdate_MovementString (zc_MovementString_Ambulance(), ioId, inAmbulance);
    -- сохранили <>
    PERFORM lpInsertUpdate_MovementString (zc_MovementString_MedicSP(), ioId, inMedicSP);
    -- сохранили <>
    PERFORM lpInsertUpdate_MovementString (zc_MovementString_InvNumberSP(), ioId, inInvNumberSP);
    -- сохранили <>
    PERFORM lpInsertUpdate_MovementBoolean (zc_MovementBoolean_RoundingTo10(), ioId, True);
    -- сохранили <>
    IF inInvNumberSP <> ''
    THEN
       -- сохранили <>
       PERFORM lpInsertUpdate_MovementDate (zc_MovementDate_OperDateSP(), ioId, inOperDateSP);

       -- сохранили связь с <вид соц.проекта>
       PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_SPKind(), ioId, inSPKindId);
    END IF;
	-- сохранили Id промокода
	IF InPromoCodeId <> 0 THEN
	   PERFORM lpInsertUpdate_MovementFloat (zc_MovementFloat_MovementItemId(), ioId, inPromoCodeId);
	END IF;
    -- сохранили Ручную скидку
    IF inManualDiscount <> 0 THEN
	   PERFORM lpInsertUpdate_MovementFloat (zc_MovementFloat_ManualDiscount(), ioId, inManualDiscount);
	END IF;

    IF vbIsInsert = TRUE
      THEN
          -- сохранили свойство <Дата создания>
          PERFORM lpInsertUpdate_MovementDate (zc_MovementDate_Insert(), ioId, CURRENT_TIMESTAMP);
          -- сохранили свойство <Пользователь (создание)>
          PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_Insert(), ioId, vbUserId);
    END IF;

    -- сохранили протокол
    PERFORM lpInsert_MovementProtocol (ioId, vbUserId, vbIsInsert);


    -- !!!ВРЕМЕННО для ТЕСТА!!!
    IF inSession = zfCalc_UserAdmin()
    THEN
        RAISE EXCEPTION 'Тест прошел успешно для <%> <%>', inUserSession, inSession;
    END IF;


END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;

/*
 ИСТОРИЯ РАЗРАБОТКИ: ДАТА, АВТОР
               Фелонюк И.В.   Кухтин И.В.   Климентьев К.И.   Манько Д.А.  Воробкало А.А.  Подмогильный В.В.   Шаблий О.В.
 29.06.18                                                                                                         * add ManualDiscount
 05.02.18                                                                                         * add PromoCode
 23.05.17         * add zc_Enum_SPKind_SP
 06.10.16         * add сохранение св-в дата/польз. создания
 20.07.16                                        *
 03.11.15                                                                       *
*/

-- тест
-- SELECT * FROM gpInsertUpdate_Movement_Check_ver2 (ioId := 0, inUnitId := 183293, inDate := NULL::TDateTime, inBayer := 'Test Bayer'::TVarChar, inSession:= zfCalc_UserAdmin());
