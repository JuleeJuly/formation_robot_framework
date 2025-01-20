*** Settings ***
Resource    ../../Ressources/library.resource
Resource    ../../Ressources/variables/sauce_lab_variables.robot


*** Keywords ***
I Am On The Saucedemo Website
    [Documentation]    Open the browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

I Log In
    [Documentation]    Log In
    [Arguments]    ${PASSWORD}    ${USERNAME}
    Input Text    ${FIELD_USERNAME}    ${USERNAME}
    Input Text    ${FIELD_PASSWORD}    ${PASSWORD}
    Click Button    ${BUTTON_LOGIN}

I Can Log Out
    [Documentation]    Log out
    Click Button    ${BURGER_MENU}
    Sleep    1s
    Click Element    ${BUTTON_LOGOUT}
    Wait Until Element Is Visible    ${BUTTON_LOGIN}    10s
    Close The Site

I Am Not Logged In
    [Documentation]    Verify the login error message
    Sleep    1s
    Element Should Be Visible    ${ERROR_MESSAGE}
    Close The Site

I Add Products To The Cart
    [Documentation]    Ajouter les produits dans le panier
    Sort List    hilo
    FOR    ${PRODUCT}    IN    @{PRODUCTS}
        Add Product To Cart    ${PRODUCT}
    END
    Open Cart
    ${COUNTER}=    Count Cart Quantity   ${PRODUCTS}
    Should Be Equal    (integer)${COUNTER}    (integer)2

I Can Place An Order
    [Documentation]    Je peux passer la commande
    [Arguments]    ${FIRSTNAME}    ${LASTNAME}    ${POSTALCODE}
    Place Order   ${FIRSTNAME}    ${LASTNAME}    ${POSTALCODE}
    Close The Site

Sort List
    [Documentation]    Sort the list
    [Arguments]    ${VALUE}
    Select From List By Value    ${BUTTON_SORT}    ${VALUE}

Add Product To Cart
    [Documentation]    Add a product to the cart
    [Arguments]    ${PRODUCT}
    ${ADD_BUTTON}=    Set Variable    //div[@class='inventory_list']/div[${PRODUCT}]//button[@class='btn_primary btn_inventory']
    Wait Until Element Is Visible    ${ADD_BUTTON}    10s
    Click Element    ${ADD_BUTTON}
    Sleep    1s

Open Cart
    [Documentation]    Open the cart
    Click Element    ${BUTTON_CART}

Count Cart Quantity
    [Documentation]    Count the quantity of products in the cart
    [Arguments]    ${PRODUCTS}
    ${COUNTER}=    Set Variable    0
    FOR    ${PRODUCT}    IN    @{PRODUCTS}
        ${QUANTITY}=    Set Variable    //div[@class='cart_list']/div[@class='cart_item'][${PRODUCT}]//div[@class='cart_quantity']
        Element Should Be Visible    ${QUANTITY}
        ${qt}=    Get Text    ${QUANTITY}
        ${COUNTER}=    Evaluate    ${COUNTER}+${qt}
    END
    RETURN    ${COUNTER}

Place Order
    [Documentation]    Place the order and verify the amounts
    [Arguments]    ${FIRSTNAME}    ${LASTNAME}    ${POSTALCODE}
    Fill In Order Fields    ${FIRSTNAME}    ${LASTNAME}    ${POSTALCODE}
    Verify Order Amounts
    Sleep    1s
    Click Element    ${BUTTON_FINISH}
    Verify Order Completion

Fill In Order Fields
    [Documentation]    Place the order and verify the amounts
    [Arguments]    ${FIRSTNAME}    ${LASTNAME}    ${POSTALCODE}
    Click Element    ${BUTTON_CHECKOUT}
    Sleep    1s
    Input Text    ${FIELD_FIRSTNAME}    ${FIRSTNAME}
    Input Text    ${FIELD_LASTNAME}    ${LASTNAME}
    Input Text    ${FIELD_POSTALCODE}    ${POSTALCODE}
    Click Button    ${BUTTON_CONTINUE}

Verify Order Completion
    [Documentation]    Verify order completion
    Wait Until Element Is Visible    ${TITLE_SUCCESS}    10s
    Wait Until Element Contains    ${TITLE_SUCCESS}    ${MESSAGE_TITLE_SUCCESS}    10s

Verify Order Amounts
    [Documentation]    Verify order amounts
    ${TOTAL}=    Set Variable    0
    ${SUBTOTAL}=    Get Text    ${SUBTOTAL_CHECKOUT}
    ${SUBTOTAL_MODIFIED}=    Evaluate    ${SUBTOTAL}[13:]
    FOR    ${PRODUCT}    IN    @{PRODUCTS}
        ${PRICE}=    Set Variable    //div[@class='cart_list']/div[@class='cart_item'][${PRODUCT}]//div[@class='cart_item_label']//div[@class='inventory_item_price']
        ${PRICE_VALUE}=    Get Text    ${PRICE}
        Element Should Be Visible    ${PRICE}
        ${PRICE_MODIFIED}=    Evaluate    ${PRICE_VALUE}[1:]
        ${TOTAL}=    Evaluate    ${TOTAL}+${PRICE_MODIFIED}
    END
    Should Be Equal    (integer)${SUBTOTAL_MODIFIED}    (integer)${TOTAL}
    ${TAX}=    Evaluate    round((${SUBTOTAL_MODIFIED}/12.5),2)
    ${TAX_TEXT}=    Get Text    ${TAX_CHECKOUT}
    ${TAX_MODIFIED}=    Evaluate    ${TAX_TEXT}[6:]
    Should Be Equal    round(${TAX},2)    round(${TAX_MODIFIED},2)
    ${GRAND_TOTAL}=    Evaluate    round(${TOTAL}+${TAX},2)
    ${GRAND_TOTAL_TEXT}=    Get Text    ${TOTAL_CHECKOUT}
    ${GRAND_TOTAL_MODIFIED}=    Evaluate    round(${GRAND_TOTAL_TEXT}[8:],2)
    Should Be Equal    ${GRAND_TOTAL}    ${GRAND_TOTAL_MODIFIED}

Close The Site
    [Documentation]    Close the site
    Close Browser
