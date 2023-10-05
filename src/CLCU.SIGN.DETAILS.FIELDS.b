* @ValidationCode : MjotMTIwODQ2ODI2MDpDcDEyNTI6MTYyNDk4Mjg4MTIyNjpERUxMOi0xOi0xOjA6MDp0cnVlOk4vQTpSMTlfU1A0MS4wOi0xOi0x
* @ValidationInfo : Timestamp         : 29 Jun 2021 21:38:01
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : DELL
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_SP41.0
*----------------------------------------------------------------------------
* Description: Fields routine for CLCU.SIGN.DETAILS.FIELDS
*
*----------------------------------------------------------------------------
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
SUBROUTINE CLCU.SIGN.DETAILS.FIELDS
  
    $USING EB.SystemTables
    $USING EB.Template
    $USING ST.CompanyCreation
    
*-----------------------------------------------------------------------------
    EB.SystemTables.setIdF('@ID'); EB.SystemTables.setIdN(35); EB.SystemTables.setIdT('A')
*-----------------------------------------------------------------------------
    fieldName = 'ACCOUNT.ID'
    fieldType = ''
    fieldType<1> = 'ANY'
    fieldType<3> = ''
    fieldLength = '35'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)

    fieldName = 'MEMBER.ID'
    fieldType = ''
    fieldType<1> = 'ANY'
    fieldType<3> = ''
    fieldLength = '35'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)
    
    fieldName = 'SIGN.MEM.NO.NAM'
    fieldType = ''
    fieldType<1> = 'ANY'
    fieldType<3> = ''
    fieldLength = '30'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)


    fieldName = 'SIGN.TITLE'
    fieldType = ''
    fieldType<1> = 'ANY'
    fieldType<3> = ''
    fieldLength = '5'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)

    fieldName = 'SIGN.FIRST.NAM'
    fieldType = ''
    fieldType<1> = 'ANY'
    fieldType<3> = ''
    fieldLength = '35'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)

    fieldName = 'SIGN.MID.NAM'
    fieldType = ''
    fieldType<1> = 'ANY'
    fieldType<3> = ''
    fieldLength = '35'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)

    fieldName = 'SIGN.SUR.NAM'
    fieldType = ''
    fieldType<1> = 'ANY'
    fieldType<3> = ''
    fieldLength = '35'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)

    fieldName = 'SIGN.ADD'
    fieldType = ''
    fieldType<1> = 'ANY'
    fieldType<3> = ''
    fieldLength = '35'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)

    fieldName = 'SIGN.TOWN'
    fieldType = ''
    fieldType<1> = 'ANY'
    fieldType<3> = ''
    fieldLength = '35'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)
    
    fieldName = 'SIGN.COUNTY'
    fieldType = ''
    fieldType<1> = 'ANY'
    fieldType<3> = ''
    fieldLength = '35'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)

    fieldName = 'SIGN.COUNTRY'
    fieldType = ''
    fieldType<1> = 'ANY'
    fieldType<3> = ''
    fieldLength = '35'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)
    
    fieldName = 'SIGN.EIRCODE'
    fieldType = ''
    fieldType<1> = 'ANY'
    fieldType<3> = ''
    fieldLength = '10'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)

    fieldName = 'SIGN.PH.NO'
    fieldType = ''
    fieldType<1> = 'ANY'
    fieldType<3> = ''
    fieldLength = '35'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)

    fieldName = 'ACT.START.DATE'
    fieldType = ''
    fieldType<1> = 'D'
    fieldType<3> = ''
    fieldLength = '11'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)

    fieldName = 'ACT.END.DATE'
    fieldType = ''
    fieldType<1> = 'D'
    fieldType<3> = ''
    fieldLength = '11'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)

    fieldName = 'SIGN.RELATION'
    fieldType = ''
    fieldType<1> = 'ANY'
    fieldType<3> = ''
    fieldLength = '35'
    neighbour = ''
    EB.Template.TableAddfielddefinition(fieldName,fieldLength,fieldType,neighbour)

    

*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------

    
RETURN
END
