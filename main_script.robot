*** Settings ***
resource     resources\keyword.robot
resource    resources\variables.robot
Library     FakerLibrary    locale=fr_FR
Library    Dialogs
*** Test Cases ***
1 J'ouvre le site
    openNewBrowser    ${website_url}
    Sleep    3
    keyword.closeBrowser

#CREATE A NEW USER case: valid credentials
New_USER with valid credentials
    [Tags]    N01
    ${email}=    Email   
    ${mot de passe} =    Password
    ${Telephone}  Phone Number
    ${password} =    Password
    ${FirstName} =    First Name
    ${LastName} =    Name Male
    ${adress} =    Address
    ${ZIP Code} =  Postcode
    ${Town} =    City

    openNewBrowser    ${website_url}
    Maximize Browser Window
    Sleep      3
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
   
    Close All Browsers

Lecture fichier excel
    
    Recup Fichier excel améliorer      connexion    2   

    Log To Console    ${nomExcel}
    Log To Console    ${prenomExcel}
    Log To Console    ${mail}
    Log To Console    ${mdp}