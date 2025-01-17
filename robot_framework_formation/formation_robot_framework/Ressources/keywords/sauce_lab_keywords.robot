*** Settings ***
Resource    ../../Ressources/library.resource
Resource    ../../Ressources/variables/sauce_lab_variables.robot


*** Keywords ***
Open Sauce
    [Documentation]    Open the browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Connexion
    [Documentation]    Se connecter
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Input Text    ${CHAMP_USER}    ${USERNAME}
    Input Text    ${CHAMP_PASSWORD}    ${PASSWORD}
    Click Button    ${BOUTON_LOGIN}

Deconnexion
    [Documentation]    Se deconnecter
    Click Button    ${BURGER_MENU}
    Sleep    1s
    Click Element    ${BOUTON_DECONNEXION}
    Wait Until Element Is Visible    ${BOUTON_LOGIN}    10s

Verifier Message D Erreur Connexion
    [Documentation]    Verifier le message d erreur de connexion
    Sleep    1s
    Element Should Be Visible    ${ERROR_CONNEXION}

Trier Liste
    [Documentation]    Trier la liste
    [Arguments]    ${VALUE}
    Select From List By Value    ${BOUTON_TRIER}    ${VALUE}

Ajouter Produit Au Panier
    [Documentation]    Ajouter un produit au panier
    [Arguments]    ${produit}
    ${BOUTON_AJOUTER}=    Set Variable    //div[@class='inventory_list']/div[${produit}]//button[@class='btn_primary btn_inventory']
    Wait Until Element Is Visible    ${BOUTON_AJOUTER}    10s
    Click Element    ${BOUTON_AJOUTER}
    Sleep    1s

Ouvrir Le Panier
    [Documentation]    Ouvrir le panier
    Click Element    ${BOUTON_PANIER}

Compter Quantite Panier
    [Documentation]    Compter la quantite de produit dans le panier
    [Arguments]    ${PRODUITS}
    ${COMPTEUR}=    Set Variable    0
    FOR    ${produit}    IN    @{PRODUITS}
        ${QUANTITE}=    Set Variable    //div[@class='cart_list']/div[@class='cart_item'][${produit}]//div[@class='cart_quantity']
        Element Should Be Visible    ${QUANTITE}
        ${qt}=    Get Text    ${QUANTITE}
        ${COMPTEUR}=    Evaluate    ${COMPTEUR}+${qt}
    END
    RETURN    ${COMPTEUR}

Passer La Commande
    [Documentation]    Passer la commande
    [Arguments]    ${FIRSTNAME}    ${LASTNAME}    ${POSTALCODE}
    Click Element    ${BOUTON_CHECKOUT}
    Sleep    1s
    Input Text    ${CHAMP_FIRSTNAME}    ${FIRSTNAME}
    Input Text    ${CHAMP_LASTNAME}   ${LASTNAME}
    Input Text    ${CHAMP_POSTALCODE}    ${POSTALCODE}
    Click Button    ${BOUTON_CONTINUE}
    ${TOTAL}=    Set Variable    0
    ${TOT}=    Get Text    ${SOUSTOTAL_CHECKOUT}
    ${TOT2}=    Evaluate    ${TOT}[13:]
    #verifier les totaux et sous totaux
    FOR    ${produit}    IN    @{PRODUITS}
        ${PRIX}=    Set Variable    //div[@class='cart_list']/div[@class='cart_item'][${produit}]//div[@class='cart_item_label']//div[@class='inventory_item_price']
        ${px}=    Get Text    ${PRIX}
        Element Should Be Visible    ${PRIX}
        ${px_modifiee}=    Evaluate    ${px}[1:]
        ${TOTAL}=    Evaluate    ${TOTAL}+${px_modifiee}
    END
    Should Be Equal    (integer)${TOT2}    (integer)${TOTAL}
    ${FRAIS}=    Evaluate    round((${TOT2}/12.5),2)
    ${FRAIS1}=    Get Text    ${FRAIS_CHECKOUT}
    ${FRAIS2}=    Evaluate    ${FRAIS1}[6:]
    Should Be Equal    round(${FRAIS},2)    round(${FRAIS2},2)
    ${TOTAL_TOTAL}=    Evaluate    round(${TOTAL}+${FRAIS},2)
    ${TOTAL_TOTAL1}=    Get Text    ${TOTAL_CHECKOUT}
    ${TOTAL_TOTAL2}=    Evaluate    round(${TOTAL_TOTAL1}[8:],2)
    Should Be Equal    ${TOTAL_TOTAL}    ${TOTAL_TOTAL2}
    Sleep    1s
    Click Element    ${BOUTON_FINISH}
    Wait Until Element Is Visible    ${TITLE_VALIDE}    10s
    Wait Until Element Contains    ${TITLE_VALIDE}    ${MESSAGE_TILE_VALIDE}    10s

Fermer Le Site
    [Documentation]    Ferme le site
    Close Browser
