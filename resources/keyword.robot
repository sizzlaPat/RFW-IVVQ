*** Settings ***
Library    SeleniumLibrary
Library     ExcelLibrary
Resource    variables.robot
Library    Dialogs
Library     FakerLibrary    locale=fr_FR


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

ecriturer donnees 
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

Scroll To Element
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})

Scenario Cas_passant
        ${email}=    Email 
        ${mot de passe} =    Password
        ${Telephone}  Phone Number
        ${password} =    Password
        ${FirstName} =    First Name
        ${LastName} =    Name Male
        ${adress} =    Address
        ${ZIP Code} =  Postcode
        ${Town} =    City
        [Arguments]   ${email}    ${mot de passe}    ${FirstName}    ${LastName}    ${Telephone}    ${adress}    ${ZIP Code}    ${Town}
        Click Element   xpath=/html/body/div[4]/div[2]/button
        Sleep   1
        Click Button    xpath=//*[@id="dropdown-account"]/button
        Sleep  2
        Click Button    xpath=//*[@id="redirectCreateAccount"] 
        Sleep   2
        Click Element   xpath=//*[@id="userInfoForm"]/div/fieldset/div[2]/label/span
        Sleep     2
        Input Text    xpath=//*[@id="IdentifiersLogin"]    ${email}
        Sleep    2
        Input Text    xpath=//*[@id="NewPwdPassword"]    ${mot de passe}
        Sleep    2
        Click Element    xpath=//*[@id="civilitie"]/option[3]
        Sleep    2
        Input Text    xpath=//*[@id="InfoFirstname"]    ${FirstName}
        Sleep    2
        Input Text    xpath=//*[@id="InfoLastname"]    ${LastName}
        Sleep    3
        Input Text    xpath=//*[@id="directPhone"]    ${Telephone}
        Sleep    2
        Click Button    xpath=//*[@id="nextStepBtn"]
        Sleep    2
        Input Text    xpath=//*[@id="CompaniesAddress"]     ${adress}
        Sleep    1
        Input Text    xpath=//*[@id="CompaniesPostCode"]    ${ZIP Code}
        Sleep    2
        Input Text    xpath=//*[@id="CompaniesCity"]    ${Town}
        Sleep    2
        Execute Manual Step    Please complete the CAPTCHA portion of the form.
        Sleep    2
        Click Element    xpath=//*[@id="submitAllForm"]
        sleep    2

   
    
 
    