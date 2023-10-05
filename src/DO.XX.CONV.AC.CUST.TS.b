* @ValidationCode : MjoxNjk5MjAwMzYwOkNwMTI1MjoxNjI0OTgzODUyNjUyOkRFTEw6LTE6LTE6MDowOmZhbHNlOk4vQTpSMTlfU1A0MS4wOi0xOi0x
* @ValidationInfo : Timestamp         : 29 Jun 2021 21:54:12
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
*-----------------------------------------------------------------------------
$PACKAGE Cu.Account
SUBROUTINE DO.XX.CONV.AC.CUST.TS( sInRecordId, rInRecord, sInOutValue )
*-----------------------------------------------------------------------------
* Description:- Conversion routine for DO Data Source to get Customer name  from
*               CUSTOMER aaplication based on provided customer id
*               CUSTOMER > TITLE + SHORT NAME  CustTS  DO.XX.CONV.AC.CUST.TS
*               sInRecordId = Customer No -  - InArguments
*               sInOutValue = TITLE + SHORT NAME -  - OutArguments
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
    GOSUB Process

RETURN

Init:
*-----------------------------------------------------------------------------
    rCustomer = rInRecord
    ySpace = ' '
*   LoanAppIndividual-20151117-1339003283-100129-LO15021GD0TD
*    sCustomerId = s$DoQueueId['-', 4, 1]

RETURN

Process:
*-----------------------------------------------------------------------------


* yCustTS = UPCASE(rCustomer<Customer_Title>[1,1]):LOWCASE(rCustomer<Customer_Title>[2,99]):ySpace:rCustomer<Customer_ShortName>
    yCustName = rCustomer<Customer_Name1>
    sInOutValue = yCustName

RETURN





