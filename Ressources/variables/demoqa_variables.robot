*** Variables ***
${BROWSER}    chrome
${URL}        https://demoqa.com/
${BOOK_STORE_LINK}    https://demoqa.com/books
${LOGIN_LINK}    https://demoqa.com/login
${LOGIN_NEW_USER_LINK}    https://demoqa.com/register
${INTERACTIONS_SELECTABLE_LINK}    https://demoqa.com/selectable
${DATE_PICKER_LINK}    https://demoqa.com/date-picker
${CHECKBOX_LINK}    https://demoqa.com/checkbox
${ALERT_LINK}    https://demoqa.com/alerts
${NEW_USER_LOGIN}    id=newUser
${BOOK_SEARCH_BOX}    id=searchBox
${NEW_USER_FIRST_NAME}    id=firstname
${NEW_USER_LAST_NAME}    id=lastname
${NEW_USER_USERNAME}    id=userName
${NEW_USER_PASSWORD}    id=password
${NEW_USER_SUBMIT}    id=register
${LOGIN_BUTTON}    id=login
${USERNAME_CONTAINER}    id=userName-value
${GRID}    id=demo-tab-grid
${LIST_BUTTON}    id=demo-tab-list
${DATE_TIME_INPUT}    id=dateAndTimePickerInput
${YEAR_DATE_TIME_INPUT}    class=react-datepicker__year-read-view--selected-year
${YEAR_OPTION_BUTTON_DATE_TIME_INPUT}    class=react-datepicker__year-option
${MONTH_DATE_TIME_INPUT}    class=react-datepicker__month-read-view
${NEW_USER_CAPTCHA}    class=recaptcha-checkbox-border
${SELECTABLE_SPAN}    //span[.='Selectable']
${BOOK_AUTHOR}    css=.rt-tbody > div:nth-of-type(1) div:nth-of-type(3)
${CAPTCHA}    //iframe[contains(@src, 'recaptcha')]
${CAPTCHA_ID}    id=recaptcha-anchor
${CHECKBOX_HOME}    //span[text()="Home"]
${CHECKBOX_OFFICE}    //span[text()="Office"]
${CHECKBOX_EXCEL}    //span[text()="Excel File.doc"]
${CHECKBOX_ALL_OPEN}    //button[@class="rct-option rct-option-expand-all"]
${CHECKBOX_TEXT_DESKTOP}    //span[text()="desktop"]
${CHECKBOX_TEXT_NOTES}    //span[text()="notes"]
${CHECKBOX_TEXT_COMMANDS}    //span[text()="commands"]
${CHECKBOX_TEXT_WORKSPACE}    //span[text()="workspace"]
${CHECKBOX_TEXT_REACT}    //span[text()="react"]
${CHECKBOX_TEXT_ANGULAR}    //span[text()="angular"]
${CHECKBOX_TEXT_VEU}    //span[text()="veu"]
${CHECKBOX_TEXT_WORDFILE}    //span[text()="wordFile"]
${ALERT_BUTTON}    id=alertButton
${TIMER_ALERT_BUTTON}    id=timerAlertButton
${CONFIRM_ALERT_BUTTON}    id=confirmButton
${CONFIRM_RESULT}    id=confirmResult
${PROMPT_ALERT_BUTTON}    id=promtButton
${PROMPT_RESULT}    id=promptResult
${ALERT_COLOR}    rgb(40, 167, 69)
