*** Settings ***

Resource        ./base.robot

*** Variables ***
${CHROMEDRIVER_PATH}    ${EXECDIR} /resources/libs/chromedriver.exe
${browser}           chrome

${SITE}              https://magento2-demo.magebit.com/

*** Keywords ***
Open Session
    # Baixa ou pega a versão correta do ChromeDriver
    ${driver_path}=    Evaluate    webdriver_manager.chrome.ChromeDriverManager().install()    sys, webdriver_manager.chrome
    ${driver_path}=    Replace String    ${driver_path}    \\    /

    # Cria o objeto Service
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service("""${driver_path}""")    sys

    # Cria opções do Chrome
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --disable-logging
    Call Method    ${options}    add_argument    --disable-infobars

    # Cria o WebDriver passando Service e Options
    Create Webdriver    Chrome    service=${service}    options=${options}

    Set Selenium Timeout    30
    # Set Window Size         1280    1030
    Set Window Position     0     0
    Maximize Browser Window
    SeleniumLibrary.Go To                   ${SITE}

Close Session
    Capture Page Screenshot
    Close All Browsers

Gerar WORD conforme prints gerados durante a automação
    [Arguments]    
    Log To Console  ===============================================================================
    Log To Console  Aguardar gerar o arquivo PDF/WORD com as evidências da Automação
    Log To Console  ===============================================================================\n
    Gerar Evidencia Com Passos Extraidos
    