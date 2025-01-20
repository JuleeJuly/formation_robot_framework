*** Settings ***
Resource    ../../Ressources/library.resource
Resource    ../../Ressources/variables/demoqa_variables.robot


*** Keywords ***
I Am On The Website
    [Documentation]    Open the website
    Open The Site

I Search For A Book
    [Documentation]    Redirect to the book page and search for a book in the search field
    [Arguments]    ${BOOK}
    Go To    ${BOOK_STORE_LINK}
    Location Should Contain    ${BOOK_STORE_LINK}
    Wait Until Element Is Visible    ${BOOK_SEARCH_BOX}
    Input Text    ${BOOK_SEARCH_BOX}    ${BOOK}
    Sleep    1s

The Search Result Is Relevant
    [Documentation]    Verify that the displayed author is correct
    [Arguments]    ${AUTHOR}
    Wait Until Element Contains    ${BOOK_AUTHOR}    ${AUTHOR}
    Close The Site

I Am On The Login Page
    [Documentation]    Navigate to the login page
    Open The Site
    Go To    ${LOGIN_LINK}
    Location Should Contain    ${LOGIN_LINK}
    Sleep    1s

I Create An Account
    [Documentation]    Fill in the fields and validate the captcha to add the user
    [Arguments]    ${FIRSTNAME}    ${LASTNAME}    ${USERNAME}    ${PASSWORD}
    Go To    ${LOGIN_NEW_USER_LINK}
    Location Should Contain    ${LOGIN_NEW_USER_LINK}
    Sleep    1s
    Create Account    ${FIRSTNAME}    ${LASTNAME}    ${USERNAME}    ${PASSWORD}
    Execute JavaScript    window.scrollBy(0, 500)
    Validate Captcha
    Click Button    ${NEW_USER_SUBMIT}
    Sleep    1s

I Can Log In With This Account
    [Documentation]    Log in and verify the connected account
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Log In    ${USERNAME}    ${PASSWORD}
    Verify Login    ${USERNAME}
    Close The Site

I Am On The Interactions Page
    [Documentation]    Navigate to the interactions page
    Open The Site
    Go To    ${INTERACTIONS_SELECTABLE_LINK}
    Location Should Contain    ${INTERACTIONS_SELECTABLE_LINK}

I Select Different Elements
    [Documentation]    Select different elements
    [Arguments]    @{LIST_ARGUMENTS}
    @{LIST_INTERACTION}=    Set Variable    @{LIST_ARGUMENTS}[0]
    @{LIST_GRID}=    Set Variable    @{LIST_ARGUMENTS}[1]
    Interactions Selectable    @{LIST_INTERACTION}
    Interactions Grid    @{LIST_GRID}

The Selection Of Elements Is Consistent
    [Documentation]    Verify the selected elements
    [Arguments]    @{LIST_ARGUMENTS}
    Verify Interactions List    @{LIST_ARGUMENTS}[0]
    Close The Site

I Am On The Date Picker Page
    [Documentation]    Navigate to the date picker page
    Open The Site
    Go To    ${DATE_PICKER_LINK}
    Location Should Contain    ${DATE_PICKER_LINK}

I Choose A Slot
    [Documentation]    Selects the year, month, day and time in the field
    [Arguments]    ${DAY}    ${MONTH}    ${YEAR}    ${TIME}
    Wait Until Element Is Enabled    ${DATE_TIME_INPUT}
    Click Element    ${DATE_TIME_INPUT}
    Execute JavaScript    window.scrollBy(0, 300)
    Click To Year    ${YEAR}
    Click Element    //div[.='${YEAR}']
    Click Element    ${MONTH_DATE_TIME_INPUT}
    Click Element    //div[.='${MONTH}']
    Click Element    //div[@class='react-datepicker__month']//div[@class='react-datepicker__week']//div[contains(text(), '${DAY}')]
    Click To Time    ${TIME}

The Selection Is Displayed
    [Documentation]    Verify the data
    [Arguments]    ${DAY}    ${MONTH}    ${YEAR}    ${TIME}
    ${VALUE}=    Get Value    ${DATE_TIME_INPUT}
    ${MINUTES}=    Evaluate    '${TIME}[2:]'
    ${HOUR}=    Evaluate    ${TIME}[:2]
    ${MOMENT}=    Set Variable    AM
    ${HOUR}=    Convert To Number    ${HOUR}
    IF    ${HOUR} < 1
        ${HOUR}=    Evaluate    ${HOUR} + 12
    ELSE IF    ${HOUR} == 12
        ${MOMENT}=    Set Variable    PM
    ELSE IF    ${HOUR} > 12
        ${HOUR}=    Evaluate    ${HOUR} - 12
        ${MOMENT}=    Set Variable    PM
    END
    ${HOUR}=    Evaluate    round(${HOUR})
    ${result}=    Set Variable    ${MONTH} ${DAY}, ${YEAR} ${HOUR}${MINUTES} ${MOMENT}
    Should Be Equal    ${VALUE}    ${result}
    Close The Site

I Am On The Checkbox Page
    [Documentation]    Navigate to the checkbox page
    Open The Site
    Go To    ${CHECKBOX_LINK}
    Location Should Contain    ${CHECKBOX_LINK}

I Select Some Elements
    [Documentation]    Select all boxes except excel file and office
    Click Element    ${CHECKBOX_HOME}
    Click Element    ${CHECKBOX_ALL_OPEN}
    Execute JavaScript    window.scrollBy(0, 300)
    Click Element    ${CHECKBOX_OFFICE}
    Click Element    ${CHECKBOX_EXCEL}

The Elements Are Selected
    [Documentation]    Check the selection of elements
    Wait Until Element Is Visible    ${CHECKBOX_TEXT_DESKTOP}
    Wait Until Element Is Visible    ${CHECKBOX_TEXT_NOTES}
    Wait Until Element Is Visible    ${CHECKBOX_TEXT_COMMANDS}
    Wait Until Element Is Visible    ${CHECKBOX_TEXT_WORKSPACE}
    Wait Until Element Is Visible    ${CHECKBOX_TEXT_REACT}
    Wait Until Element Is Visible    ${CHECKBOX_TEXT_ANGULAR}
    Wait Until Element Is Visible    ${CHECKBOX_TEXT_VEU}
    Wait Until Element Is Visible    ${CHECKBOX_TEXT_WORDFILE}
    Close The Site

I Am On The Alert Page
    [Documentation]    Navigate to the alert page
    Open The Site
    Go To    ${ALERT_LINK}
    Location Should Contain    ${ALERT_LINK}

I Choose Different Options
    [Documentation]    Click on the different possible alerts
    [Arguments]    ${FIRSTNAME}
    Accept Alert    ${ALERT_BUTTON}    1s
    Accept Alert    ${TIMER_ALERT_BUTTON}    6s
    Accept Alert    ${CONFIRM_ALERT_BUTTON}    1s
    Click Button    ${PROMPT_ALERT_BUTTON}
    Sleep    1s
    Input Text Into Alert    ${FIRSTNAME}    action=ACCEPT
    Sleep    1s

The Different Alerts Are Displayed
    [Documentation]    Verify the different alerts
    Wait Until Element Is Visible    ${CONFIRM_RESULT}
    ${confirm_color}=    Execute JavaScript    return window.getComputedStyle(document.getElementById('confirmResult')).color.trim().replace(/\s+/g, '');
    Should Be Equal    ${confirm_color}     ${ALERT_COLOR}
    Wait Until Element Is Visible    ${PROMPT_RESULT}
    ${prompt_color}=    Execute JavaScript    return window.getComputedStyle(document.getElementById('promptResult')).color.trim().replace(/\s+/g, '');
    Should Be Equal    ${prompt_color}     ${ALERT_COLOR}
    Close The Site

Accept Alert
    [Documentation]    Accepts alerts with a chosen delay
    [Arguments]    ${ALERT_ID}    ${TIME}
    Wait Until Element Is Visible    ${ALERT_ID}
    Click Button    ${ALERT_ID}
    Sleep    ${TIME}
    Handle Alert    action=ACCEPT

Click To Year
    [Documentation]    Choose the year in the date field
    [Arguments]    ${YEAR}
    Wait Until Element Is Visible    ${YEAR_DATE_TIME_INPUT}
    Click Element    ${YEAR_DATE_TIME_INPUT}
    ${element_present}=    Set Variable    False
    WHILE    not ${element_present}
        Click Element    ${YEAR_OPTION_BUTTON_DATE_TIME_INPUT}
        ${element_present}=    Run Keyword And Return Status    Element Should Be Visible    //div[.='${YEAR}']
    END

Click To Time
    [Documentation]    Choose the time in the date field
    [Arguments]    ${TIME}
    ${element_present}=    Set Variable    False
    Sleep    1s
    WHILE    not ${element_present}
        Execute JavaScript    document.getElementsByClassName('react-datepicker__time-list')[0].scrollBy(0, 1000);
        ${element_present}=    Run Keyword And Return Status    Element Should Be Visible    //li[.='${TIME}']
    END
    Click Element    //li[.='${TIME}']

Create Account
    [Documentation]    Complete the fields for creating the user account
    [Arguments]    ${FIRSTNAME}    ${LASTNAME}    ${USERNAME}    ${PASSWORD}
    Wait Until Element Is Enabled    ${NEW_USER_FIRST_NAME}
    Input Text    ${NEW_USER_FIRST_NAME}    ${FIRSTNAME}
    Wait Until Element Is Enabled    ${NEW_USER_LAST_NAME}
    Input Text    ${NEW_USER_LAST_NAME}     ${LASTNAME}
    Wait Until Element Is Enabled    ${NEW_USER_USERNAME}
    Input Text    ${NEW_USER_USERNAME}    ${USERNAME}
    Wait Until Element Is Enabled    ${NEW_USER_PASSWORD}
    Input Password    ${NEW_USER_PASSWORD}    ${PASSWORD}

Validate Captcha
    [Documentation]    Validate Captcha
    Sleep    1s
    Wait Until Element Is Enabled    ${CAPTCHA}
    Click Element    ${CAPTCHA}
    Select Frame    ${CAPTCHA}
    Wait Until Element Is Enabled    ${CAPTCHA_ID}
    Click Element    ${CAPTCHA_ID}
    Unselect Frame
    Execute JavaScript    ('document.getElementById("g-recaptcha-response").value = "fake_token";')

Log In
    [Documentation]    Log in
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Go To    ${LOGIN_LINK}
    Location Should Contain    ${LOGIN_LINK}
    Wait Until Element Is Enabled    ${NEW_USER_USERNAME}
    Input Text    ${NEW_USER_USERNAME}    ${USERNAME}
    Wait Until Element Is Enabled    ${NEW_USER_PASSWORD}
    Input Password    ${NEW_USER_PASSWORD}    ${PASSWORD}
    Execute JavaScript    window.scrollBy(0, 500)
    Wait Until Element Is Enabled    ${LOGIN_BUTTON}
    Click Button    ${LOGIN_BUTTON}
    Sleep    2s

Verify Login
    [Documentation]    Verify the username
    [Arguments]    ${USERNAME}
    Wait Until Element Contains    ${USERNAME_CONTAINER}    ${USERNAME}    10s

Interactions Selectable
    [Documentation]    Select the elements chosen from the list
    [Arguments]    @{LIST_SELECTABLE}
    Wait Until Element Is Visible    ${SELECTABLE_SPAN}    10s
    Click Element    ${SELECTABLE_SPAN}
    FOR    ${SELECTABLE}    IN    @{LIST_SELECTABLE}
        Click Element    //li[.='${SELECTABLE}']
    END

Interactions Grid
    [Documentation]    Fill in the grid with the elements chosen from the list
    [Arguments]    @{NUMBER_GRID}
    Wait Until Element Is Visible    ${GRID}    10s
    Click Element    ${GRID}
    FOR    ${NUMBER}    IN    @{NUMBER_GRID}
        Execute JavaScript    window.scrollBy(0, 300)
        Click Element    //li[.='${NUMBER}']
    END
    Sleep    2s

Verify Interactions List
    [Documentation]    Checks that the items in the list are selected
    [Arguments]    @{LIST_SELECTABLE}
    Wait Until Element Is Visible    ${LIST_BUTTON}    10s
    Click Element    ${LIST_BUTTON}
    Sleep    1s
    FOR    ${SELECTABLE}    IN    @{LIST_SELECTABLE}
        ${ELEM}=    Set Variable    //li[.='${SELECTABLE}']
        ${classes}=    Get Element Attribute    ${ELEM}    class
        Should Contain    ${classes}    active
    END

Open The Site
    [Documentation]    Open the site in the browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Close The Site
    [Documentation]    Close the site
    Close Browser
