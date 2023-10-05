* @ValidationCode : MjoxOTE2NzE2NzU2OkNwMTI1MjoxNjI0OTgyOTEyODg1OkRFTEw6LTE6LTE6MDowOmZhbHNlOk4vQTpSMTlfU1A0MS4wOi0xOi0x
* @ValidationInfo : Timestamp         : 29 Jun 2021 21:38:32
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : DELL
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R19_SP41.0
* Arguments
*----------------------------------------------------------------------------
*
! Incoming : No

! Outgoing : No
*
*----------------------------------------------------------------------------
* Change history
*----------------------------------------------------------------------------
* Date <dd/mm/yyyy>   Who                        Reference                             Description
* 22-06-2021          Nirmal Kumar N             Account_Signatory_concat_table        Initial Draft
*----------------------------------------------------------------------------
*
*----------------------------------------------------------------------------
$PACKAGE Cu.Account
SUBROUTINE CLCU.SIGN.DETAILS
*-----------------------------------------------------------------------------
    $USING EB.SystemTables
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.setTableName('CLCU.SIGN.DETAILS');* Full application name including product prefix
    EB.Template.setTableTitle('CLCU.SIGN.DETAILS');* Screen title
    EB.Template.setTableStereotype('L');* H, U, L, W or T
    EB.Template.setTableProduct('EB');* Must be on EB.PRODUCT
    EB.Template.setTableSubproduct('');* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('INT');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
    EB.Template.setTableRelatedfiles('');* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('CU.SIGN');* Use to create I_F.CLCU.SIGN.DETAILS
*-----------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked functions
    EB.Template.setTableTriggerfield('')  ;* Trigger field used for OPERATION style fields
    
RETURN
END