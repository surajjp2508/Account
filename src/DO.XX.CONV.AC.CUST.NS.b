* @ValidationCode : Mjo4MDg5ODA5MzM6Q3AxMjUyOjE2MjQ5ODMyOTIzNzI6REVMTDotMTotMTowOjA6ZmFsc2U6Ti9BOlIxOV9TUDQxLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 29 Jun 2021 21:44:52
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
SUBROUTINE DO.XX.CONV.AC.CUST.NS( sInRecordId, rInRecord, sInOutValue )
*-----------------------------------------------------------------------------
* Description:- Conversion routine for DO Data Source to get Customer name  from
*               CUSTOMER aaplication based on provided customer id
*               CUSTOMER > NAME.1 + SHORT NAME     CustNS  DO.XX.CONV.AC.CUST.NS
*               sInRecordId = Customer No -  - InArguments
*               sInOutValue = NAME.1 + SHORT NAME -  - OutArguments
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

    yCustNS = rCustomer<Customer_Name1>:ySpace:rCustomer<Customer_ShortName>
    sInOutValue = yCustNS

RETURN





