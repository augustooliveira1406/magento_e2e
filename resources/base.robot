
*** Variables ***
#######################################################################
##                                                                   ##
##                 Configuração de Ambiente                          ##
##                                                                   ##
## ####################################################################

*** Settings ***
########################################################################
##                                                                    ##     
##                    Libraries de todo o projeto                     ##
##                                                                    ##
## #####################################################################
## Criado por: Augusto Oliveira     		       					  ##
## Data: 16/08/2025							                          ##
## Área: Automated Tests                                              ##
## Projeto: Magento                                                   ##
## #####################################################################

Library         SeleniumLibrary
Library         String
Library         FakerLibrary    locale=pt_BR
Library         OperatingSystem
Library         DatabaseLibrary
Library         SoapLibrary
Library         RequestsLibrary
Library         Collections
Library         DateTime
Library         DebugLibrary
Library         Process
Library         JSONLibrary
# Library         webdriver_manager
Library         libs/GerarEvidencias.py

########################################################
#                        Hooks                         #
########################################################
Resource    hooks.robot

########################################################
#                      Pages Web                       #
########################################################
Resource    pages/magento_page.robot

########################################################
#                      Keywords Web                    #
########################################################
Resource    keywords/kws_add_to_cart.robot
Resource    keywords/kws_create_account.robot
Resource    keywords/kws_checkout.robot
Resource    keywords/kws_login.robot

