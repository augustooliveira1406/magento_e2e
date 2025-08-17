*** Settings ***

## #####################################################################
## ......Data: 16/08/2025                                             ##
## ......Área: Qualidade                                              ##
## ........QA: Augusto Oliveira                                       ##
## #####################################################################

Resource    ../base.robot

*** Keywords ***
Dado que eu esteja na página principal do Site Magento
    Remove File      ${EXECDIR}${/}.logs\\*.png         #Remove arquivos PNG antes de executar o próximo teste
    Log To Console   =============================================================================
    Log To Console   Acessando a Página principal do Magento E2E
    Log To Console   =============================================================================\n
    Sleep  5
    Wait Until Element Is Visible    ${BTN_CreateAnAccount}
    Capture Page Screenshot

Quando clicar em "Create an Account"
    Log To Console   ==============================================================================
    Log To Console   Clicando no botão de "Create an Account"
    Log To Console   ==============================================================================\n
    Click Element     ${BTN_CreateAnAccount}
    Capture Page Screenshot

E inserir as informações necessárias para criar uma conta
    Log To Console   ============================================================================
    Log To Console    Inserindo os dados de Informações Pessoais
    Log To Console   ============================================================================\n
    Wait Until Page Contains    Create New Customer Account
    Criar Informações Pessoais para cadastro
    Gerar Senha Conforme Requisito

    Click Button                ${BTN_ConfirmCreateAccount}
    Wait Until Page Contains    This is a required field.
    Capture Page Screenshot

    Click Element               ${TXT_FirstName}
    Input Text                  ${TXT_FirstName}       ${FirstName}
    Click Element               ${TXT_LastName}
    Input Text                  ${TXT_LastName}        ${LastName}    
    Click Element               ${TXT_Email}
    Input Text                  ${TXT_Email}           emailinvalido
    Click Button                ${BTN_ConfirmCreateAccount}
    Wait Until Page Contains    Please enter a valid email address (Ex: johndoe@domain.com).
    Capture Page Screenshot

    Click Element               ${TXT_Email}
    Clear Element Text          ${TXT_Email}
    Input Text                  ${TXT_Email}           ${Email}
    Click Element               ${TXT_Password}
    Input Text                  ${TXT_Password}        senhaQualquer
    Wait Until Page Contains    Minimum of different classes of characters in password is 3. Classes of characters: Lower Case, Upper Case, Digits, Special Characters.
    Capture Page Screenshot

    Click Element               ${TXT_Password}
    Clear Element Text          ${TXT_Password}
    Input Text                  ${TXT_Password}        ${Senha_Gerada}    
    # Wait Until Page Contains    Password Strength: Strong
    Click Element               ${TXT_ConfirmPass}
    Input Text                  ${TXT_ConfirmPass}     senhaQualquer    
    Click Button                ${BTN_ConfirmCreateAccount}
    Wait Until Page Contains    Please enter the same value again.
    Capture Page Screenshot

    Click Element               ${TXT_ConfirmPass}
    Clear Element Text          ${TXT_ConfirmPass}    
    Input Text                  ${TXT_ConfirmPass}     ${Senha_Gerada}
    Wait Until Page Contains    Please enter the same value again.
    Capture Page Screenshot
    Click Button                ${BTN_ConfirmCreateAccount}
  
Então meu cadastro será efetuado com sucesso
    Log To Console   ============================================================================
    Log To Console    Cadastro Realizado com Sucesso
    Log To Console   ============================================================================\n
    Wait Until Page Contains    My Account
    Wait Until Page Contains    Thank you for registering with Main Website Store.
    Capture Page Screenshot
    E realizo o logout na plataforma
    Gerar arquivo com os dados de login para reutilizar

E realizo o logout na plataforma
    Log To Console   ============================================================================
    Log To Console   Logout Realizado com Sucesso
    Log To Console   ============================================================================\n
    Wait Until Element Is Visible    ${BTN_MenuExit}
    Click Element                    ${BTN_MenuExit}
    Wait Until Element Is Visible    ${BTN_SignOut}
    Capture Page Screenshot
    Click Element                    ${BTN_SignOut}
    Gerar WORD conforme prints gerados durante a automação

#### Variaveis em tempo de execução
Criar Informações Pessoais para cadastro
    ${FirstName}         FakerLibrary.First Name
    #${FirstName}         Convert To Upper Case    ${FirstName}
    Set Suite Variable    ${FirstName}

    ${LastName}          FakerLibrary.Last Name
    #${LastName}          Convert To Upper Case    ${LastName}
    Set Suite Variable    ${LastName}
    
    ${Email}             FakerLibrary.Email
    ${Email}             Convert To Lower Case    ${Email}
    Set Suite Variable    ${Email}

Gerar Senha Conforme Requisito
    # Gera uma senha com letras, números e caracteres especiais
    ${Senha_Gerada}=    Password    length=12    special_chars=True    digits=True    upper_case=True    

    # Valida se contém pelo menos uma letra
    ${Tem_Letra}=    Evaluate    bool(re.search(r"[A-Za-z]", """${Senha_Gerada}"""))    re
    Should Be True    ${Tem_Letra}    Senha não contém letra

    # Valida se contém pelo menos um número
    ${Tem_Numero}=    Evaluate    bool(re.search(r"[0-9]", """${Senha_Gerada}"""))    re
    Should Be True    ${Tem_Numero}    Senha não contém número

    # Valida se contém pelo menos um caractere especial
    ${Tem_Especial}=    Evaluate    bool(re.search(r"[^@$!A-Za-z0-9]", """${Senha_Gerada}"""))    re
    Should Be True    ${Tem_Especial}    Senha não contém caractere especial

    #Log To Consolte   Senha gerada:  ${Senha_Gerada}
    Set Suite Variable    ${Senha_Gerada}

Gerar arquivo com os dados de login para reutilizar
    ${ARQ_LOGIN}    Set variable         ${EXECDIR}${/}resources\\arquivos\\Arq_Login.csv
    Create File       ${ARQ_LOGIN}    
     
    Append To File    ${ARQ_LOGIN}    ${FirstName};
    Append To File    ${ARQ_LOGIN}    ${LastName};
    Append To File    ${ARQ_LOGIN}    ${Email};
    Append To File    ${ARQ_LOGIN}    ${Senha_Gerada};

E realizo a leitura dods dados de login
    ${ARQ_DADOS}=    Get File         ${EXECDIR}${/}resources\\arquivos\\Arq_Login.csv
    ${DADOS_ARQ}=  Split To Lines     ${ARQ_DADOS}
    ${x}    set variable    ${0}
    FOR     ${LINHA}     IN    @{DADOS_ARQ}
        ${LINHAARQ}=         Create List      ${LINHA}${x}                # Obtém a primeira linha do arquivo        
        ${DADOS}    Set Variable    ${LINHAARQ}[0]
        ${DADOS_SEPARADOS}          Split String    ${DADOS}    ;         # Separa os dados da primeira linha
        Set Test Variable           ${DADOS_SEPARADOS}
        ${DADOS_FIRST}    Set Variable    ${DADOS_SEPARADOS}[0]        # Obtém o valor da primeira coluna da primeira linha
        ${DADOS_LAST}     Set Variable    ${DADOS_SEPARADOS}[1]        # Obtém o valor da segunda coluna da primeira linha
        ${DADOS_LOGIN}    Set Variable    ${DADOS_SEPARADOS}[2]        # Obtém o valor da primeira coluna da primeira linha
        ${DADOS_PASS}     Set Variable    ${DADOS_SEPARADOS}[3]        # Obtém o valor da segunda coluna da primeira linha
        Set Suite Variable    ${DADOS_FIRST}
        Set Suite Variable    ${DADOS_LAST}
        Set Suite Variable    ${DADOS_LOGIN}
        Set Suite Variable    ${DADOS_PASS}       
    END
