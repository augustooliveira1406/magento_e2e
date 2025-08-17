*** Settings ***
Documentation     Página com as Keywords de Add Products in Cart

## #####################################################################
## ......Data: 16/08/2025                                             ##
## ......Área: Qualidade                                              ##
## ........QA: Augusto Oliveira                                       ##
## #####################################################################

Resource    ../base.robot

*** Keywords ***
E ao adicionar produtos ao carrinho
    Log To Console   ==============================================================================
    Log To Console   Clicando no Menu "Men"
    Log To Console   ==============================================================================\n
    Click Element     ${BTN_MenuMen}
    Capture Page Screenshot
    Log To Console   ==============================================================================
    Log To Console   Selecionar um subitem
    Log To Console   ==============================================================================\n
    Click Element     ${BTN_TeesMen}
    Wait Until Page Contains    Tees
    Capture Page Screenshot
    Log To Console   ==============================================================================
    Log To Console   Inserir o Primeiro item no carrinho
    Log To Console   ==============================================================================\n
    Click Element     ${BTN_TeesBlack}
    Click Element     ${BTN_TeesMedium}
    Capture Page Screenshot
    Click Element     ${BTN_AddCart}
    Wait Until Page Contains    You added Gobi HeatTec® Tee to your shopping cart.
    Log To Console   ==============================================================================
    Log To Console   Inserir o Segundo item no carrinho
    Log To Console   ==============================================================================\n
    Click Element     ${BTN_MenuMen1}
    Click Element     ${BTN_PantsMen}
    Wait Until Page Contains    Pants
    Capture Page Screenshot
    Click Element     ${BTN_PantsBlack}
    Click Element     ${BTN_PantsSize}
    Capture Page Screenshot
    Click Element     ${BTN_AddCart}
    Wait Until Page Contains    You added Caesar Warm-Up Pant to your shopping cart.

E visualizo os itens do Carrinho e realizo o Checkout
    Log To Console   ==============================================================================
    Log To Console   Clicando para ver os itens do Carrinho
    Log To Console   ==============================================================================\n
    Click Element     ${BTN_MyCart}
    Capture Page Screenshot    
    Click Element     ${BTN_CheckOut}    
    Wait Until Page Contains    Shipping Address
    Sleep  5
    Capture Page Screenshot
    Click Element    ${CHK_ItensCart}
    Sleep  2
    Capture Page Screenshot
    Click Element    ${CHK_Details1}    
    Click Element    ${CHK_Details2}
    Sleep  2
    Capture Page Screenshot
    Click Element    ${CHK_ItensCart}
    E insiro os dados para entrega
