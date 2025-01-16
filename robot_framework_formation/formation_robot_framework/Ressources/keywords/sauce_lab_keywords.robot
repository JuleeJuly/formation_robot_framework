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
    Sleep    2s
    Click Element    ${BOUTON_DECONNEXION}
    Wait Until Element Is Visible    ${BOUTON_LOGIN}    10s

Verifier Message D Erreur Connexion
    [Documentation]    Verifier le message d erreur de connexion
    Sleep    2s
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
    Sleep    2s

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
        ${COMPTEUR}=    Evaluate    ${COMPTEUR}+1
    END
    RETURN    ${COMPTEUR}