*** Settings ***
Library    SeleniumLibrary
Resource    variables.robot
Library     ExcelLibrary
#Resource    .\..\main_script.robot
*** Keyword *** 
# BROWSER MANAGEMENT
openNewBrowser
    [Arguments]    ${url}
    Open Browser    ${url}    Chrome
closeBrowser
    Close All Browsers
Recup Fichier excel améliorer
    [Arguments]    ${feuille}    ${ligne}    
    Open Excel Document    ${data}    1
    ${nomExcel} =    Read Excel Cell    ${ligne}    1    ${feuille}
    ${prenomExcel} =  Read Excel Cell    ${ligne}   2    ${feuille}  
    ${mail} =    Read Excel Cell    ${ligne}   3    ${feuille}
    ${mdp} =    Read Excel Cell    ${ligne}   4   ${feuille}

    Set Global Variable    ${nomExcel}
    Set Global Variable    ${prenomExcel}
    Set Global Variable    ${mail}
    Set Global Variable    ${mdp}

Ecrire sur Fichier excel 
    [Arguments]    ${nomExcel}    ${prenomExcel}    ${mail}    ${mdp}  
    Open Excel Document    ${data}    1
    ${Nbligne} =  set variable  1
    ${check} =    Read Excel Cell     ${Nbligne}    1
    WHILE    ${check} != None
    ${Nbligne}  Evaluate  ${Nbligne}+1 
    END

    Write Excel Cell    ${Nbligne}    1  ${nomExcel}
    Write Excel Cell    ${Nbligne}   2  ${prenomExcel}
    Write Excel Cell    ${Nbligne}    3  ${mail} 
    Write Excel Cell    ${Nbligne}    4  ${mdp}

    Save Excel Document  ${data} 

   
    
 
    