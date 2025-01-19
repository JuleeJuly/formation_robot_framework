*** Variables ***
${BROWSER}    chrome
${URL}        https://www.saucedemo.com/v1/index.html
${CHAMP_USER}    id=user-name
${CHAMP_PASSWORD}    id=password
${BOUTON_LOGIN}    id=login-button
${BOUTON_DECONNEXION}    id=logout_sidebar_link
${ERROR_CONNEXION}    class=error-message-container error
${BOUTON_TRIER}    class=product_sort_container
${BURGER_MENU}    id=react-burger-menu-btn
&{USERNAME}    ok=standard_user    nok=locked_out_user
${PASSWORD}    secret_sauce
@{PRODUITS}    1    2
${BOUTON_PANIER}    class=shopping_cart_link
${BOUTON_CHECKOUT}    class=checkout_button
${CHAMP_FIRSTNAME}    id=first-name
${CHAMP_LASTNAME}    id=last-name
${CHAMP_POSTALCODE}    id=postal-code
${BOUTON_CONTINUE}    //input[@type="submit"]
${BOUTON_FINISH}    //a[@href="./checkout-complete.html"]
${SOUSTOTAL_CHECKOUT}    class=summary_subtotal_label
${FRAIS_CHECKOUT}    class=summary_tax_label
${TOTAL_CHECKOUT}    class=summary_total_label
${TITLE_VALIDE}    //h2
${MESSAGE_TILE_VALIDE}    THANK YOU FOR YOUR ORDER