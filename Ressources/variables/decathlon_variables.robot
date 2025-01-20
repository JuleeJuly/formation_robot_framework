*** Variables ***
${BROWSER}    chrome
${URL}        https://www.decathlon.fr/
${CLICK_ENTER}    \ue007
&{COOKIE}
...    accept=id=didomi-notice-agree-button
...    refuse=class=didomi-continue-without-agreeing
...    personalize=id=didomi-notice-learn-more-button
${SEARCH_BAR}    //input[@name='Ntt']
@{PRODUCTS}    bonnet    ballon
#${PRODUCT_PAGE_LINK}    //div[contains(@class, "product")]//a
#${PRODUCT_PAGE_LINK}    //div[contains(@class, "product-list")]/div[1]
${PRODUCT_PAGE_LINK}    //*[@id="app"]/main/div[2]/section[2]/div/div[1]/div[4]/div/div/button
${ADD_TO_CART_BUTTON}    class=vtmn-btn_variant--conversion
