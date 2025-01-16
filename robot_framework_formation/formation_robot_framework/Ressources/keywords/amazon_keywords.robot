*** Settings ***

Resource    ../../Ressources/library.resource
Resource    ../../Ressources/variables/amazon_variables.robot

*** Keywords ***

Open amazon
    [Documentation]    Open the browser
    Open Browser    ${url_amazon}    ${browser}
    Maximize Browser Window
    Click Button    ${cook_amazon}

Accept cookie
    [Documentation]    Accept cookie
    Wait Until Element Is Visible    ${cook_amazon}
    Click Button    ${cook_amazon}

Identification
    Sleep    2s
    Click Element    ${btn_identification}
    Input Text    ${champ_login_amazon}    ${login_amazon}
    Click Element    ${continue_login}
    Sleep    2s
    Input Password    ${champ_mdp_amazon}    ${mdp_amazon}
    Press Keys    ${champ_mdp_amazon}    ${appui_entree}