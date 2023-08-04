*** Settings ***

Resource    resources/keyword.robot
Library     FakerLibrary    locale=fr_FR
Library    Dialogs
*** Test Cases ***
1 J'ouvre le site
    openNewBrowser    ${website_url}
    Sleep    3
    keyword.closeBrowser

#CREATE A NEW USER case: valid credentialsgid
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

#CREATE A NEW USER case: empty required field_USER
New User -empty required fiel for user
    [Tags]   E01
    @{errors_Msg_Required}    Create List    Ce champ est obligatoire     Champ obligatoire        Information obligatoire    

    openNewBrowser    ${website_url}
    Maximize Browser Window
    Sleep      3
     Click Element   xpath=/html/body/div[4]/div[2]/button
    Sleep   1
    Click Button    xpath=//*[@id="dropdown-account"]/button
    Sleep  2
    Click Button    xpath=//*[@id="redirectCreateAccount"] 
    Sleep   2
    Scroll To Element            xpath=//*[@id="nextStepBtn"]
    Sleep    1
    Click Button    xpath=//*[@id="nextStepBtn"]
    
    #DATA RECOVERY
    ${statut} =   Get Text    //*[@id="userInfoForm"]/div/fieldset/div[1]/span
    sleep    1
    ${mail} =    Get Text    //*[@id="userInfoForm"]/div/div[2]/div/label[2]
    Sleep    1
    ${mot de passe} =    Get Text    //*[@id="userInfoForm"]/div/div[3]/div/label[2]
    Sleep    1
    ${civilité} =    Get Text    //*[@id="ServiceSelect"]/span
    Sleep    1
    ${FirstName} =    Get Text    //*[@id="userInfoForm"]/div/div[6]/div[1]/label[2]
    Sleep    1
    ${LastName} =    Get Text    //*[@id="userInfoForm"]/div/div[6]/div[2]/label[2]
    Sleep    1
    ${Telephone}=    Get Text    //*[@id="userInfoForm"]/div/div[8]/div/label[2]
    Sleep    10

    #CHECKING CONTROL
    Should Be Equal    ${statut}    ${errors_Msg_Required}[0]
    Should Be Equal    ${mail}    ${errors_Msg_Required}[1]
    Should Be Equal    ${mot de passe}    ${errors_Msg_Required}[1]
    Should Be Equal    ${civilité}    ${errors_Msg_Required}[2]
    Should Be Equal    ${FirstName}    ${errors_Msg_Required}[1]
    Should Be Equal    ${LastName}    ${errors_Msg_Required}[1]
    Should Be Equal    ${Telephone}    ${errors_Msg_Required}[2] 
    
    Close All Browsers 

#CREATE A NEW USER case: empty required field_ADRESS
New User -empty required fiel for adress
    [Tags]   E02

    #LIST of errors_Msg_Required For Adress registration
    ${add}    set variable    Street is mandatory. Please provide a street.

    @{errors_Msg_Required_Adress}    Create List  ${add}    Code postal obligatoire.    La ville est obligatoire. Veuillez entrer une ville.
    
    #FAKE DATA FROM FAKER
    ${email}=    Email   
    ${mot de passe} =    Password
    ${Telephone}         Phone Number
    ${password} =        Password
    ${FirstName} =       First Name
    ${LastName} =        Name Male

    # SCENARIO
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
    Input Text      xpath=//*[@id="IdentifiersLogin"]    ${email}
    Sleep    2
    Input Text      xpath=//*[@id="NewPwdPassword"]    ${mot de passe}
    Sleep    2
    Click Element   xpath=//*[@id="civilitie"]/option[3]
    Sleep    2
    Input Text      xpath=//*[@id="InfoFirstname"]    ${FirstName}
    Sleep    2
    Input Text      xpath=//*[@id="InfoLastname"]    ${LastName}
    Sleep    3
    Input Text      xpath=//*[@id="directPhone"]    ${Telephone}
    Sleep    2
    Click Button    xpath=//*[@id="nextStepBtn"]
    Sleep    2
    Execute Manual Step    Please complete the CAPTCHA portion of the form.
    Sleep    2
    Click Element    xpath=//*[@id="submitAllForm"]

    Sleep    2

    # DATA RECOVERY
    ${Street} =      Get Text    //*[@id="userInfoCompletedForm"]/div/div[12]/div/label[2]
    sleep    1
    ${postCode} =    Get Text    //*[@id="userInfoCompletedForm"]/div/div[15]/div[1]/label[2]
    Sleep    1
    ${ville} =       Get Text    //*[@id="userInfoCompletedForm"]/div/div[15]/div[2]/label[2]
    
    
    # CHECKING CONTROL

    Should Be Equal    ${Street}    ${errors_Msg_Required_Adress}[0]
    Should Be Equal    ${postCode}    ${errors_Msg_Required_Adress}[1]
    Should Be Equal     ${ville}    ${errors_Msg_Required_Adress}[2]

    sleep    10

    Close All Browsers

    


    
















Lecture fichier excel
    
    Recup Fichier excel améliorer      connexion    2   

    Log To Console    ${nomExcel}
    Log To Console    ${prenomExcel}
    Log To Console    ${mail}
    Log To Console    ${mdp}

Ecriture sur fichier Excel test
    ecriturer donnees    nomExcel    prenomExcel    aaa@gmail.com    ghgg    