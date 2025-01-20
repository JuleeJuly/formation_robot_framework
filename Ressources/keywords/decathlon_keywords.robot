*** Settings ***
Documentation    This suite contains keywords for interacting with the Decathlon website.
Resource    ../../Ressources/library.resource
Resource    ../../Ressources/variables/decathlon_variables.robot


*** Keywords ***
I Am On The Decathlon Website
    [Documentation]    I Am On The Decathlon Website
    [Arguments]    ${ACTION}
    Open Decathlon
    Accept Cookies    ${ACTION}

I Add Multiple Products To The Cart
    [Documentation]    Add multiple products to cart
    FOR    ${PRODUCT}    IN    @{PRODUCTS}
        Search For A Product    ${PRODUCT}
        Access Product Page
        Add To Cart
    END

The Products Are In My Cart
    [Documentation]    Check that the products are in the cart
    Close Browser

Open Decathlon
    [Documentation]    Open the browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Accept Cookies
    [Documentation]    Accept cookies
    [Arguments]    ${ACTION}
    IF    ${ACTION} == "accept"
        Click Button    ${COOKIE}[accept]
    ELSE IF    ${ACTION} == "refuse"
        Click Button    ${COOKIE}[refuse]
    ELSE
        Click Button    ${COOKIE}[personalize]
    END

Search For A Product
    [Documentation]    Search a product
    [Arguments]    ${PRODUCT}
    Wait Until Element Is Visible    ${SEARCH_BAR}    10s
    Input Text    ${SEARCH_BAR}    ${PRODUCT}
    Sleep    1s
    Press Keys    ${SEARCH_BAR}    ${CLICK_ENTER}
    Sleep    1s

Access Product Page
    [Documentation]    Access product page
    #Wait Until Element Is Visible    ${PRODUCT_PAGE_LINK}    10s
    Click Element    ${PRODUCT_PAGE_LINK}
    Sleep    1s

Add To Cart
    [Documentation]    Add to cart
    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTON}    10s
    Click Button    ${ADD_TO_CART_BUTTON}
