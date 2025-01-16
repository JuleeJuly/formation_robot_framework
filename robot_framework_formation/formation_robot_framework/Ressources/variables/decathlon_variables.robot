*** Variables ***
${BROWSER}    chrome
${URL}        https://www.decathlon.fr/
${APPUI_ENTREE}    \ue007
&{COOKIE}
...    accept=id=didomi-notice-agree-button
...    refuse=class=didomi-continue-without-agreeing
...    personnaliser=id=didomi-notice-learn-more-button
${BARRE_RECHERCHE}    //input[@name='Ntt']
${BTN_RECHERCHE}    class=vtmx-search-line
${PRODUCT}    bonnet
${LIEN_PAGE_PRODUIT}    //*[@id="app"]/main/div[2]/section[2]/div/div[1]/div[4]/div/div/button
${BTN_AJOUTER_PANIER}    class=vtmn-btn_variant--conversion
