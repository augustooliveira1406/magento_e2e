*** Settings ***
Documentation     Página com as Keywords de Checkout

## #####################################################################
## ......Data: 16/08/2025                                             ##
## ......Área: Qualidade                                              ##
## ........QA: Augusto Oliveira                                       ##
## #####################################################################

Resource    ../base.robot

*** Keywords ***
E insiro os dados para entrega
    Log To Console   ==============================================================================
    Log To Console   Inserindo os dados de entrega    
    Log To Console   ==============================================================================\n
    Criar Informações Pessoais para entrega
    Capture Page Screenshot
    Click Element                    ${TXT_AdrressLine1}
    Input Text                       ${TXT_AdrressLine1}      ${Adrress}

    Selecionar Item Aleatorio do Country    ${SLC_Country}    
    Selecionar Item Aleatorio do State      ${SLC_State}

    Click Element                    ${TXT_City}
    Input Text                       ${TXT_City}              ${City}    
    Click Element                    ${TXT_ZipCode}
    Input Text                       ${TXT_ZipCode}           ${ZipCode}
    Click Element                    ${TXT_PhoneNumber}
    Input Text                       ${TXT_PhoneNumber}       ${PhoneNumber}       
    Sleep  2
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
    Capture Page Screenshot
    Wait Until Element Is Visible    ${BTN_NexCart}
    Click Button                     ${CHK_MethodShipping}
    Click Button                     ${BTN_NexCart}
    Sleep  2    
    Wait Until Page Contains         Payment Method
    Wait Until Element Is Visible    ${BTN_PlaceOrder}
    Sleep  5
    Capture Page Screenshot
    Click Button                     ${BTN_PlaceOrder}
    
Então a compra é realizada com sucesso    
    Log To Console   ==============================================================================
    Log To Console   Compra realizada com sucesso
    Log To Console   ==============================================================================\n
    Wait Until Page Contains    Thank you for your purchase!
    Capture Page Screenshot
    Wait Until Element Is Visible    ${BTN_ContinueShopping}
    Sleep  3
    Click Element                    ${BTN_ContinueShopping}
    Gerar WORD conforme prints gerados durante a automação

Criar Informações Pessoais para entrega
    ${Adrress}         FakerLibrary.Address
    Set Suite Variable    ${Adrress}
    
    ${City}             FakerLibrary.City
    Set Suite Variable    ${City}

    ${ZipCode}          FakerLibrary.Postcode
    Set Suite Variable    ${ZipCode}

    ${PhoneNumber}          FakerLibrary.Phone Number
    Set Suite Variable    ${PhoneNumber}


Selecionar Item Aleatorio do Country
     [Arguments]    ${LOCATOR}    
    # Conta quantos itens existem no select
    ${QTD}=    Get Element Count    ${LOCATOR}
    Log    Existem ${qtd} opções no select
    # Seleciona a opção de índice 30 (começa em 0, então 30 = 31ª opção)
    Select From List By Index    ${LOCATOR}    30

Selecionar Item Aleatorio do State
    [Arguments]    ${LOCATOR}    
    ${LABELS}=    Get List Items    ${LOCATOR}
    # Remove PLaceholders comuns
    Remove Values From List    ${LABELS}    Please select    Selecione
    ${CHOICE}=    Evaluate    random.choice($LABELS)    modules=random
    Select From List By Label    ${LOCATOR}    ${CHOICE}

