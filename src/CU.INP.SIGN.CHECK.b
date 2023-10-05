* @ValidationCode : MjotMTEyNzY2ODI3MjpDcDEyNTI6MTYyNDk4MTk2OTM0ODpERUxMOi0xOi0xOjA6MDpmYWxzZTpOL0E6UjE5X1NQNDEuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 29 Jun 2021 21:22:49
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : DELL
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R19_SP41.0

$PACKAGE Cu.Account
SUBROUTINE CU.INP.SIGN.CHECK
*-----------------------------------------------------------------------------
* Description:- 1.Signatory Code/Name by name where rest of the fields will be manually inputted
*               2.Signatory Code/Name by code/name where rest of the fields will be empty, throws an error.
*               3.Active end date field should be greater than or equal to Today date.
*               4.Active end date field must be manual input.
*-----------------------------------------------------------------------------
* Modification History :
* Date              Who                Reference                 Description
*-----------------------------------------------------------------------------
* 25-06-2021        Nirmal Kumar N                              Initial Version
*
*-----------------------------------------------------------------------------
    $USING EB.SystemTables
    $USING EB.ErrorProcessing
    $USING EB.DataAccess
    $USING AC.AccountOpening
    $USING ST.Customer
    $USING EB.LocalReferences
    $USING EB.Updates
   
   
    IF EB.SystemTables.getVFunction() EQ 'S' THEN
        RETURN
    END
   
    GOSUB Initialise
    GOSUB SignMemIdCheck
   
   
RETURN

Initialise:
*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    FnCustomer = 'F.CUSTOMER'
    FvCustomer = ''
    EB.DataAccess.Opf(FnCustomer,FvCustomer)

    YAppln = 'ACCOUNT'
    YField = 'L.SIGN.MEM.NO':@VM:'L.SIGN.TITLE':@VM:'L.SIGN.FIRST.NA':@VM:'L.SIGN.MID.NAME':@VM:'L.SIGN.SUR.NAME':@VM:'L.SIGN.ADD':@VM:'L.SIGN.TOWN':@VM:'L.SIGN.COUNTY':@VM:'L.SIGN.COUNTRY':@VM:'L.SIGN.EIRCODE':@VM:'L.SIGN.PHONE.NO':@VM:'L.SIGN.START.DA':@VM:'L.SIGN.END.DATE':@VM:'L.SIGN.DOC':@VM:'L.SIGN.RELATION':@VM:'L.SIGN.TYPE'
    YPosArr = ''
    EB.Updates.MultiGetLocRef(YAppln, YField, YPosArr)

    YSignMemNoPos    = YPosArr<1,1>
    YSignTitlePos    = YPosArr<1,2>
    YSignFirstNamPos = YPosArr<1,3>
    YSignMidNamPos   = YPosArr<1,4>
    YSignSurNamPos   = YPosArr<1,5>
    YSignAddPos      = YPosArr<1,6>
    YSignTownPos     = YPosArr<1,7>
    YSignCountyPos   = YPosArr<1,8>
    YSignCountryPos  = YPosArr<1,9>
    YSignEirCodePos  = YPosArr<1,10>
    YSignPhNoPos     = YPosArr<1,11>
    YSignStartDatPos = YPosArr<1,12>
    YSignEndDatPos   = YPosArr<1,13>
    YSignDocPos      = YPosArr<1,14>
    YSignRelationPos = YPosArr<1,15>
    YSignTypePos     = YPosArr<1,16>
    
    yToday = EB.SystemTables.getToday()
    
RETURN
*---------------------------------------------------------------------------------------------------------------------------------------------
SignMemIdCheck:
    YSignMemValNew = EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignMemNoPos>

    YSignMemValCount = ''
    YSignMemValCount = DCOUNT(YSignMemValNew,@SM)
    j = 1
    LOOP
    WHILE j LE YSignMemValCount
            
        GOSUB CheckAllSign
        GOSUB SubValueError
           
        j = j + 1
    REPEAT
        
RETURN

*----------------------------------------------------------------------------------------------------------------------------------------------------
CheckAllSign:

    YSignMemId = '' ; YSignTitleVal    = '' ; YSignFirstNamVal = '' ; YSignSurNamVal   = '' ; YSignAddVal      = ''; YSignTownVal     = '' ; YSignCountyVal   = ''; YSignEirCodeVal  = ''; YSignPhNoVal     = '' ; YSignEndDate = '' ; YSignRelationVal = ''
    YSignMemId        = EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignMemNoPos,j>
    YSignTitleVal    =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignTitlePos,j>
    YSignFirstNamVal =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignFirstNamPos,j>
    YSignSurNamVal   =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignSurNamPos,j>
    YSignAddVal      =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignAddPos,j>
    YSignTownVal     =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignTownPos,j>
    YSignCountyVal   =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignCountyPos,j>
    YSignCountryVal  =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignCountryPos,j>
    YSignEirCodeVal  =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignEirCodePos,j>
    YSignPhNoVal     =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignPhNoPos,j>
    YSignRelationVal =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignRelationPos,j>
    YSignEndDateVal  =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignEndDatPos,j>
    

RETURN

*--------------------------------------------------------------------------------------------------------------------------------------------------------

SubValueError:

    IF ((YSignMemId EQ '') OR (YSignTitleVal EQ '') OR (YSignFirstNamVal EQ '') OR (YSignSurNamVal EQ '') OR (YSignAddVal EQ '') OR (YSignTownVal EQ '') OR (YSignCountyVal EQ '') OR (YSignCountryVal EQ '' ) OR (YSignEirCodeVal EQ '') OR (YSignPhNoVal EQ '') OR (YSignRelationVal EQ '')) THEN
        EB.SystemTables.setAf(AC.AccountOpening.Account.LocalRef)
        EB.SystemTables.setAv(YSignMemValNew)
        EB.SystemTables.setAs(j)
        yText = 'AA-SIGN.ALL.MAN'     ;*'Signatory fields are mandatory'
        EB.SystemTables.setEtext(yText)
        EB.ErrorProcessing.StoreEndError()
    END
    
    IF YSignEndDateVal EQ '' THEN
        EB.SystemTables.setAf(AC.AccountOpening.Account.LocalRef)
        EB.SystemTables.setAv(YSignEndDateVal)
        EB.SystemTables.setAs(j)
        yText = 'AA-SIGN.END.DATE'          ;*'End Date must be manual input'
        EB.SystemTables.setEtext(yText)
        EB.ErrorProcessing.StoreEndError()
    END
   
    IF YSignEndDateVal LT yToday THEN
        EB.SystemTables.setAf(AC.AccountOpening.Account.LocalRef)
        EB.SystemTables.setAv(YSignEndDateVal)
        EB.SystemTables.setAs(j)
        yText = 'AA-SIGN.END.VAL'          ;*'End Date should be greater or equal to Today date'
        EB.SystemTables.setEtext(yText)
        EB.ErrorProcessing.StoreEndError()
    END
    
RETURN
*--------------------------------------------------------------------------------------------------------------
END
