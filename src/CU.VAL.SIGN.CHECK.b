* @ValidationCode : MjotMTcyOTE4MTk3OkNwMTI1MjoxNjI0OTgyNTY0NjUzOkRFTEw6LTE6LTE6MDowOmZhbHNlOk4vQTpSMTlfU1A0MS4wOi0xOi0x
* @ValidationInfo : Timestamp         : 29 Jun 2021 21:32:44
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
SUBROUTINE CU.VAL.SIGN.CHECK
*-----------------------------------------------------------------------------
* Description:- 1.Field Signatory Code/Name is inputted, then rest of the sub-associated fields values
*                 can’t be empty and even it contains several set of signatories not to be empty.
*                 Out of one field(Middle Name) is not mandatory.
*               2.An account can have one or multiple signatories who can be a member of T24 or
*                 may be not be a member of T24.Two types of process for taking up fields value
*                 based on the Signatory Code/Name.
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

    checkMessage = EB.SystemTables.getMessage()
    IF EB.SystemTables.getMessage() EQ 'VAL' THEN
        RETURN
    END ELSE
        GOSUB Initialise
        YSignMemValNew = EB.SystemTables.getComi()
        IF YSignMemValNew NE '' THEN
            GOSUB SignMemIdCheck
        END
    END
    
RETURN

Initialise:
*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    FnCustomer = 'F.CUSTOMER'
    FvCustomer = ''
    EB.DataAccess.Opf(FnCustomer,FvCustomer)
    
    FnRelation = 'F.RELATION'
    FvRelation = ''
    EB.DataAccess.Opf(FnRelation,FvRelation)

    YAppln = 'ACCOUNT':@FM:'CUSTOMER'
    YField = 'L.SIGN.MEM.NO':@VM:'L.SIGN.TITLE':@VM:'L.SIGN.FIRST.NA':@VM:'L.SIGN.MID.NAME':@VM:'L.SIGN.SUR.NAME':@VM:'L.SIGN.ADD':@VM:'L.SIGN.TOWN':@VM:'L.SIGN.COUNTY':@VM:'L.SIGN.COUNTRY':@VM:'L.SIGN.EIRCODE':@VM:'L.SIGN.PHONE.NO':@VM:'L.SIGN.START.DA':@VM:'L.SIGN.END.DATE':@VM:'L.SIGN.DOC':@VM:'L.SIGN.RELATION':@VM:'L.SIGN.TYPE':@FM:'SUBURB.TOWN':@VM:'CITY.MUNICIPAL':@VM:'PROVINCE.STATE':@VM:'POSTAL.CODE':@VM:'TEL.MOBILE'
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
    YSuburbTownPos   = YPosArr<2,1>
    YCityMunicipalPos= YPosArr<2,2>
    YProvStatePos    = YPosArr<2,3>
    YPostalCodePos   = YPosArr<2,4>
    YTelMobilePos    = YPosArr<2,5>

    tmp.AF = EB.SystemTables.getAf()
    tmp.AV = EB.SystemTables.getAv()
    tmp.AS = EB.SystemTables.getAs()
                    
RETURN
*---------------------------------------------------------------------------------------------------------------------------------------------
SignMemIdCheck:
              
    IF EB.SystemTables.getRNew(AC.AccountOpening.Account.Customer) NE YSignMemValNew THEN
        IF NUM(YSignMemValNew) THEN
            GOSUB SignFieldsUpdates
        END
    END ELSE
        EB.SystemTables.setAf(AC.AccountOpening.Account.LocalRef)
        EB.SystemTables.setAv(YSignMemNoPos)
        EB.SystemTables.setAs(tmp.AS)
        yText = 'AA-SIGN.MEM.SAME' ;* Same Member as Signatory.
        EB.SystemTables.setEtext(yText)
        EB.ErrorProcessing.StoreEndError()
    END

RETURN

*---------------------------------------------------------------------------------------------------------------------
SignFieldsUpdates:
    
    YCusrec      = ''
    YCusError    = ''
    YRelRec      = ''   ;YRelError    = '' ; YRelId = '' ; YRelDesc = ''
    
    
    EB.DataAccess.FRead(FnCustomer,YSignMemValNew,YCusrec,FvCustomer,YCusError)
    
    IF YCusrec NE '' THEN
        YRelId = YCusrec<ST.Customer.Customer.EbCusRelationCode>
        EB.DataAccess.FRead(FnRelation,YRelId,YRelRec,FvRelation,YRelError)
        YRelDesc   = YRelRec<ST.Customer.Relation.EbRelDescription><1,1>
       
        tmp=EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef);
        tmp<1,YSignTitlePos,tmp.AS> = YCusrec<ST.Customer.Customer.EbCusTitle>;
        EB.SystemTables.setRNew(AC.AccountOpening.Account.LocalRef, tmp)
        tmp=EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef); tmp<1,YSignFirstNamPos,tmp.AS> = YCusrec<ST.Customer.Customer.EbCusNameOne>; EB.SystemTables.setRNew(AC.AccountOpening.Account.LocalRef, tmp)
        tmp=EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef); tmp<1,YSignSurNamPos,tmp.AS> = YCusrec<ST.Customer.Customer.EbCusShortName>; EB.SystemTables.setRNew(AC.AccountOpening.Account.LocalRef, tmp)
        tmp=EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef); tmp<1,YSignAddPos,tmp.AS> = YCusrec<ST.Customer.Customer.EbCusStreet>; EB.SystemTables.setRNew(AC.AccountOpening.Account.LocalRef, tmp)
        tmp=EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef); tmp<1,YSignTownPos,tmp.AS> = YCusrec<ST.Customer.Customer.EbCusLocalRef><1,YSuburbTownPos>; EB.SystemTables.setRNew(AC.AccountOpening.Account.LocalRef, tmp)
        tmp=EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef); tmp<1,YSignCountyPos,tmp.AS> = YCusrec<ST.Customer.Customer.EbCusLocalRef><1,YCityMunicipalPos>; EB.SystemTables.setRNew(AC.AccountOpening.Account.LocalRef, tmp)
        tmp=EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef); tmp<1,YSignCountryPos,tmp.AS> = YCusrec<ST.Customer.Customer.EbCusLocalRef><1,YProvStatePos>; EB.SystemTables.setRNew(AC.AccountOpening.Account.LocalRef, tmp)
        tmp=EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef); tmp<1,YSignEirCodePos,tmp.AS> = YCusrec<ST.Customer.Customer.EbCusLocalRef><1,YPostalCodePos>; EB.SystemTables.setRNew(AC.AccountOpening.Account.LocalRef, tmp)
        tmp=EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef); tmp<1,YSignPhNoPos,tmp.AS> = YCusrec<ST.Customer.Customer.EbCusLocalRef><1,YTelMobilePos>; EB.SystemTables.setRNew(AC.AccountOpening.Account.LocalRef, tmp)
        tmp=EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef); tmp<1,YSignRelationPos,tmp.AS> = YRelDesc; EB.SystemTables.setRNew(AC.AccountOpening.Account.LocalRef, tmp)
        tmp=EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef); tmp<1,YSignStartDatPos,tmp.AS> = EB.SystemTables.getToday(); EB.SystemTables.setRNew(AC.AccountOpening.Account.LocalRef, tmp)
        tmp=EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef); tmp<1,YSignDocPos,tmp.AS> = 'Y'; EB.SystemTables.setRNew(AC.AccountOpening.Account.LocalRef, tmp)
       
    END ELSE
        EB.SystemTables.setAf(AC.AccountOpening.Account.LocalRef)
        EB.SystemTables.setAv(YSignMemNoPos)
        EB.SystemTables.setAs(tmp.AS)
        yText = 'AA-SIGN.NOT.CUST'           ;*'Must be a valid Member number.'
        EB.SystemTables.setEtext(yText)
        EB.ErrorProcessing.StoreEndError()
    END
    
RETURN
*-----------------------------------------------------------------------------------------------------------------
END