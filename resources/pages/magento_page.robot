*** Settings ***
Documentation    PageInspect da Tela Automobile Insurance

Resource    ../base.robot

*** Variables ***

${BTN_CreateAnAccount}            xpath=//html/body/div[2]/header/div[1]/div/ul/li[3]/a
${BTN_SignIn}                     xpath=//html/body/div[2]/header/div[1]/div/ul/li[2]/a

#### Cadastro
${TXT_FirstName}                  id:firstname
${TXT_LastName}                   id:lastname
${CHK_NewsLetter}                 id:is_subscribed
${TXT_Email}                      id:email_address
${TXT_Password}                   id:password
${TXT_ConfirmPass}                id:password-confirmation
${BTN_ConfirmCreateAccount}       xpath=//html/body/div[2]/main/div[3]/div/form/div/div[1]/button


#### Página My Account
${BTN_MenuExit}                   xpath=//html/body/div[2]/header/div[1]/div/ul/li[2]/span/button
${BTN_MyAccount}                  xpath=//html/body/div[2]/header/div[1]/div/ul/li[2]/div/ul/li[1]/a
${BTN_SignOut}                    xpath=//html/body/div[2]/header/div[1]/div/ul/li[2]/div/ul/li[4]/a

#### Página de Login
${TXT_EmailLogin}                 id:email
${TXT_PassLogin}                  id:pass
${BTN_SignInLogin}                id:send2

####
${BTN_MenuMen}                    id:ui-id-5
${BTN_TeesMen}                    xpath=//html/body/div[2]/main/div[4]/div[2]/div/div/ul[1]/li[3]/a

${BTN_TeesBlack}                  xpath=//html/body/div[2]/main/div[4]/div[1]/div[3]/ol/li[1]/div/div/div[3]/div[2]/div/div[1]
${BTN_TeesMedium}                 xpath=//html/body/div[2]/main/div[4]/div[1]/div[3]/ol/li[1]/div/div/div[3]/div[1]/div/div[3]
${BTN_PantsMen}                   xpath=//html/body/div[2]/main/div[4]/div[2]/div/div/ul[2]/li[1]/a
${BTN_PantsBlack}                 xpath=//html/body/div[2]/main/div[4]/div[1]/div[3]/ol/li[1]/div/div/div[3]/div[2]/div/div[1]
${BTN_PantsSize}                  xpath=//html/body/div[2]/main/div[4]/div[1]/div[3]/ol/li[1]/div/div/div[3]/div[1]/div/div[4]

${BTN_MenuMen1}                   xpath=//html/body/div[2]/div[2]/ul/li[2]/a


${BTN_AddCart}                    xpath=//html/body/div[2]/main/div[4]/div[1]/div[3]/ol/li[1]/div/div/div[4]/div/div[1]/form/button
${BTN_MyCart}                     xpath=//html/body/div[2]/header/div[2]/div[1]/a

${BTN_CheckOut}                   id:top-cart-btn-checkout

##### Página de Checkout
${TXT_AdrressLine1}               xpath=//html/body/div[2]/main/div[2]/div/div[2]/div[4]/ol/li[1]/div[2]/form/div/fieldset/div/div[1]/div/input
${TXT_AdrressLine2}               xpath=//html/body/div[2]/main/div[2]/div/div[2]/div[4]/ol/li[1]/div[2]/form/div/fieldset/div/div[2]/div/input
${TXT_AdrressLine3}               xpath=//html/body/div[2]/main/div[2]/div/div[2]/div[4]/ol/li[1]/div[2]/form/div/fieldset/div/div[3]/div/input

${SLC_Country}                    xpath=//html/body/div[2]/main/div[2]/div/div[2]/div[4]/ol/li[1]/div[2]/form/div/div[4]/div/select
${SLC_State}                      xpath=//html/body/div[2]/main/div[2]/div/div[2]/div[4]/ol/li[1]/div[2]/form/div/div[5]/div/select

${TXT_City}                       xpath=//html/body/div[2]/main/div[2]/div/div[2]/div[4]/ol/li[1]/div[2]/form/div/div[7]/div/input
${TXT_ZipCode}                    xpath=//html/body/div[2]/main/div[2]/div/div[2]/div[4]/ol/li[1]/div[2]/form/div/div[8]/div/input
${TXT_PhoneNumber}                xpath=//html/body/div[2]/main/div[2]/div/div[2]/div[4]/ol/li[1]/div[2]/form/div/div[9]/div/input

${CHK_ItensCart}                  xpath=//html/body/div[2]/main/div[2]/div/div[2]/aside/div[2]/div/div/div[1]/div/div[1]
${CHK_Details1}                   xpath=//html/body/div[2]/main/div[2]/div/div[2]/aside/div[2]/div/div/div[1]/div/div[2]/div/ol/li[1]/div/div/div[2]/span
${CHK_Details2}                   xpath=//html/body/div[2]/main/div[2]/div/div[2]/aside/div[2]/div/div/div[1]/div/div[2]/div/ol/li[2]/div/div/div[2]/span

${CHK_MethodShipping}             xpath=//html/body/div[2]/main/div[2]/div/div[2]/div[4]/ol/li[2]/div/div[3]/form/div[1]/table/tbody/tr[1]/td[1]/input
${BTN_NexCart}                    xpath=//html/body/div[2]/main/div[2]/div/div[2]/div[4]/ol/li[2]/div/div[3]/form/div[3]/div/button
${BTN_PlaceOrder}                 xpath=//html/body/div[3]/main/div[2]/div/div[2]/div[4]/ol/li[3]/div/form/fieldset/div[1]/div/div/div[2]/div[2]/div[4]/div/button

${BTN_PrinReceipt}                xpath=//html/body/div[2]/main/div[1]/a
${BTN_ContinueShopping}           xpath=//html/body/div[2]/main/div[3]/div/div[2]/div/div/a
