*** Settings ***
Documentation     Automação E2E no site de demonstração do Magento

## #####################################################################
## ......Data: 16/08/2025                                             ##
## ......Área: Qualidade                                              ##
## ........QA: Augusto Oliveira                                       ##
## #####################################################################

Resource    ../resources/base.robot

Test Setup        Open Session
Test Teardown     Close Session

*** Test Case ***
#robot -N "Testes Automatizados E2E Magento" -d .logs -i Magento features\magento_E2E.robot
Cenario 001: Validar realizar Cadastro de Usuário na Plataforma Magento
    [Tags]    CadastroUsuario    Magento
    Dado que eu esteja na página principal do Site Magento
    Quando clicar em "Create an Account"
    E inserir as informações necessárias para criar uma conta
    Então meu cadastro será efetuado com sucesso

Cenario 002: Validar realizar login com sucesso e realizar uma compra
    [Tags]    LoginSucesso    Magento
    Dado que eu esteja na página principal do Site Magento
    Quando clicar em "Sig In"
    E inserir as informações de Login    
    E ao adicionar produtos ao carrinho
    E visualizo os itens do Carrinho e realizo o Checkout
    Então a compra é realizada com sucesso
