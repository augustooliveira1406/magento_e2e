*** Settings ***
Documentation     Página com as Keywords de Login

## #####################################################################
## ......Data: 16/08/2025                                             ##
## ......Área: Qualidade                                              ##
## ........QA: Augusto Oliveira                                       ##
## #####################################################################

Resource    ../base.robot

*** Keywords ***
Quando clicar em "Sig In"
    Log To Console   ==============================================================================
    Log To Console   Clicando no botão de "Sig In"
    Log To Console   ==============================================================================\n
    Click Element     ${BTN_SignIn}
    Capture Page Screenshot

E inserir as informações de Login
    Log To Console     ============================================================================
    Log To Console      Inserindo as informações de login
    Log To Console     ============================================================================\n
    Wait Until Page Contains    Customer Login
    E realizo a leitura dods dados de login
    
    Click Button                ${BTN_SignInLogin}
    Wait Until Page Contains    This is a required field.
    #Wait Until Page Contains    A login and a password are required.
    Capture Page Screenshot

    Click Element               ${TXT_EmailLogin}
    Input Text                  ${TXT_EmailLogin}       ${DADOS_LOGIN}

    Click Element               ${TXT_PassLogin}
    Input Text                  ${TXT_PassLogin}        ${DADOS_PASS}
    Capture Page Screenshot
    Click Button                ${BTN_SignInLogin}
    E o Login é realizado com sucesso

E o Login é realizado com sucesso
    Log To Console     ============================================================================
    Log To Console     Login Realizado com Sucesso
    Log To Console     ============================================================================\n
    Wait Until Page Contains    Welcome, ${DADOS_FIRST} ${DADOS_LAST}!
    Sleep  2
    Capture Page Screenshot
    Click Element              ${BTN_MenuExit}
    Capture Page Screenshot
    Click Element              ${BTN_MyAccount}
    Wait Until Page Contains    My Account
    Sleep  2
    Capture Page Screenshot    
