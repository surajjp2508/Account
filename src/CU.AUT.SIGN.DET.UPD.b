* @ValidationCode : MjoxNjYzMDAwNDI4OkNwMTI1MjoxNjI0OTgyNTAzMTg1OkRFTEw6LTE6LTE6MDowOmZhbHNlOk4vQTpSMTlfU1A0MS4wOi0xOi0x
* @ValidationInfo : Timestamp         : 29 Jun 2021 21:31:43
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
SUBROUTINE CU.AUT.SIGN.DET.UPD
*-----------------------------------------------------------------------------
* Description:- Document generation is required when a signatory is created/amended at ACCOUNT level
*               from enquiry linked to request document through concat table
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
    
    
    
    GOSUB OpenFiles
    GOSUB Initialise
    GOSUB UpdSignDet
    
RETURN

OpenFiles:
  
    FnClcuSignDetails = 'F.CLCU.SIGN.DETAILS'
    FvClcuSignDetails = ''
    EB.DataAccess.Opf(FnClcuSignDetails,FvClcuSignDetails)
   
    FnAccount = 'F.ACCOUNT'
    FvAccount = ''
    EB.DataAccess.Opf(FnAccount,FvAccount)
   
RETURN
Initialise:

    YAppln = 'ACCOUNT'
    YField = 'L.SIGN.MEM.NO':@VM:'L.SIGN.TITLE':@VM:'L.SIGN.FIRST.NA':@VM:'L.SIGN.MID.NAME':@VM:'L.SIGN.SUR.NAME':@VM:'L.SIGN.ADD':@VM:'L.SIGN.TOWN':@VM:'L.SIGN.COUNTY':@VM:'L.SIGN.COUNTRY':@VM:'L.SIGN.EIRCODE':@VM:'L.SIGN.PHONE.NO':@VM:'L.SIGN.START.DA':@VM:'L.SIGN.END.DATE':@VM:'L.SIGN.RELATION'
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
    YSignRelationPos = YPosArr<1,14>
      
    YSignMemVal      = ''
    YSignMemVal = EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignMemNoPos>
    YSignMemValCount = ''
    YSignMemValCount = DCOUNT(YSignMemVal,@SM)
     
     
RETURN
  
UpdSignDet:
  
    YAccountId       = EB.SystemTables.getIdNew()
   
    i = 1
    LOOP
    WHILE i LE YSignMemValCount
        YSignMemNoNam = ''
        YUpdArray     = ''
        YSignId       = ''
        YSignMemNoNam = YSignMemVal<1,1,i>
        IF YSignMemNoNam NE '' THEN
            YSignId  = YAccountId:'-':YSignMemNoNam
            YUpdArray<Cu.Account.ClcuSignDetails.AccountId>       =  YAccountId
            YUpdArray<Cu.Account.ClcuSignDetails.MemberId>        =  EB.SystemTables.getRNew(AC.AccountOpening.Account.Customer)
            YUpdArray<Cu.Account.ClcuSignDetails.SignMemNoNam>    =  YSignMemNoNam
            YUpdArray<Cu.Account.ClcuSignDetails.SignTitle>       =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignTitlePos,i>
            YUpdArray<Cu.Account.ClcuSignDetails.SignFirstNam>    =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignFirstNamPos,i>
            YUpdArray<Cu.Account.ClcuSignDetails.SignMidNam>      =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignMidNamPos,i>
            YUpdArray<Cu.Account.ClcuSignDetails.SignSurNam>      =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignSurNamPos,i>
            YUpdArray<Cu.Account.ClcuSignDetails.SignAdd>         =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignAddPos,i>
            YUpdArray<Cu.Account.ClcuSignDetails.SignTown>        =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignTownPos,i>
            YUpdArray<Cu.Account.ClcuSignDetails.SignCounty>      =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignCountyPos,i>
            YUpdArray<Cu.Account.ClcuSignDetails.SignCountry>     =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignCountryPos,i>
            YUpdArray<Cu.Account.ClcuSignDetails.SignEircode>     =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignEirCodePos,i>
            YUpdArray<Cu.Account.ClcuSignDetails.SignPhNo>        =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignPhNoPos,i>
            YUpdArray<Cu.Account.ClcuSignDetails.SignActStartDate>=  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignStartDatPos,i>
            YUpdArray<Cu.Account.ClcuSignDetails.SignActEndDate>  =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignEndDatPos,i>
            YUpdArray<Cu.Account.ClcuSignDetails.SignRelation>    =  EB.SystemTables.getRNew(AC.AccountOpening.Account.LocalRef)<1,YSignRelationPos,i>
            EB.DataAccess.FWrite(FnClcuSignDetails,YSignId,YUpdArray)
        
        END
        i = i + 1
    REPEAT
  
RETURN
  
  
    
END