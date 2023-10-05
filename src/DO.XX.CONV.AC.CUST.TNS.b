* @ValidationCode : MjotMTc4NTc2MjM5MjpDcDEyNTI6MTYyNDk4MzgxODY5NDpERUxMOi0xOi0xOjA6MDpmYWxzZTpOL0E6UjE5X1NQNDEuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 29 Jun 2021 21:53:38
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : DELL
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R19_SP41.0
*-----------------------------------------------------------------------------
* <Rating>-32</Rating>
*----------------------------------------------------------------------------
$PACKAGE Cu.Account
SUBROUTINE DO.XX.CONV.AC.CUST.TNS( sInRecordId, rInRecord, sInOutValue )
*-----------------------------------------------------------------------------
* Description:- Conversion routine for DO Data Source to get Customer name  from
*               CUSTOMER aaplication based on provided customer id
*               CUSTOMER > TITLE + NAME.1 + SHORT NAME CustTNS DO.XX.CONV.AC.CUST.TNS
*               sInRecordId = Customer No -  - InArguments
*               sInOutValue = TITLE + NAME.1 + SHORT NAME -  - OutArguments
*-----------------------------------------------------------------------------
* Modification History :
* Date              Who                Reference                 Description
*-----------------------------------------------------------------------------
* 25-06-2021        Nirmal Kumar N                              Initial Version
*
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_DO.PROCESS
    $INSERT I_F.CUSTOMER

Main:
*-----------------------------------------------------------------------------

    GOSUB Init
    IF yDocName EQ 'AcStatement' THEN
        GOSUB AC.STMT.NAME
    END ELSE
        GOSUB Process
    END
    
RETURN

Init:
*-----------------------------------------------------------------------------
    rCustomer = rInRecord
    ySpace = ' '
*   LoanAppIndividual-20151117-1339003283-100129-LO15021GD0TD
*    sCustomerId = s$DoQueueId['-', 4, 1]
     
    yDocName = s$DoQueueId['-', 1, 1]

    APP = 'CUSTOMER'
    Y.LR.FLDS = 'CORRESPOND.NAME'
    Y.LR.POS = ''
    CALL MULTI.GET.LOC.REF(APP,Y.LR.FLDS,Y.LR.POS)
    yCorresp.pos = Y.LR.POS<1,1>
    yCorresp.Name = rCustomer<EB.CUS.LOCAL.REF><1,yCorresp.pos>
    
RETURN

Process:
*-----------------------------------------------------------------------------

    yCustTNS = UPCASE(rCustomer<Customer_Title>[1,1]):LOWCASE(rCustomer<Customer_Title>[2,99]):ySpace:rCustomer<Customer_Name1>:ySpace:rCustomer<Customer_ShortName>
    sInOutValue = yCustTNS
RETURN
*------------------------------------------------------------------------------
AC.STMT.NAME:
*************
    sInOutValue = yCorresp.Name

RETURN
*--------------------------------------------------------------------------------






