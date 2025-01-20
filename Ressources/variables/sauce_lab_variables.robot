*** Settings ***
Documentation    This suite contains variables for the Sauce Labs demo application.


*** Variables ***
${BROWSER}    chrome
${URL}        https://www.saucedemo.com/v1/index.html
${FIELD_USERNAME}    id=user-name
${FIELD_PASSWORD}    id=password
${BUTTON_LOGIN}    id=login-button
${BUTTON_LOGOUT}    id=logout_sidebar_link
${ERROR_MESSAGE}    //h3
${BUTTON_SORT}    class=product_sort_container
${BURGER_MENU}    //button[.='Open Menu']
@{PRODUCTS}    1    2
${BUTTON_CART}    class=shopping_cart_link
${BUTTON_CHECKOUT}    class=checkout_button
${FIELD_FIRSTNAME}    id=first-name
${FIELD_LASTNAME}    id=last-name
${FIELD_POSTALCODE}    id=postal-code
${BUTTON_CONTINUE}    //input[@type="submit"]
${BUTTON_FINISH}    //a[@href="./checkout-complete.html"]
${SUBTOTAL_CHECKOUT}    class=summary_subtotal_label
${TAX_CHECKOUT}    class=summary_tax_label
${TOTAL_CHECKOUT}    class=summary_total_label
${TITLE_SUCCESS}    //h2
${MESSAGE_TITLE_SUCCESS}    THANK YOU FOR YOUR ORDER
