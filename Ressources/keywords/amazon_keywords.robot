*** Settings ***

Resource    ../../Ressources/library.resource
Resource    ../../Ressources/variables/amazon_variables.robot

*** Keywords ***
I Am On The Site
    [Documentation]    Open The site
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Accept Cookie

Accept Cookie
    [Documentation]    Accept cookie
    Wait Until Element Is Visible    ${COOKIE}
    Click Button    ${COOKIE}

I Log In
    [Documentation]    Log in to the site
    Identification

I Am Connected
    [Documentation]    Checking the connection
    Close Browser

Identification
    [Documentation]    Log in
    Sleep    2s
    Click Element    ${LOGIN_BUTTON}
    Input Text    ${LOGIN_INPUT}    ${LOGIN}
    Click Element    ${CONTINUE}
    Sleep    2s
    Input Password    ${PASSWORD_INPUT}    ${PASSWORD}
    Press Keys    ${PASSWORD_INPUT}    ${CLICK_ENTER}
