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
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button

Deconnexion
    [Documentation]    Se deconnecter
    Click Button    id=react-burger-menu-btn
    Sleep    2s
    Click Element    id=logout_sidebar_link
    Wait Until Element Is Visible    id=login-button    10s

Verifier Message D Erreur Connexion
    [Documentation]    Verifier le message d erreur de connexion
    Sleep    2s
    Element Should Be Visible    class=error-message-container error

Trier Liste
    [Documentation]    Trier la liste
    [Arguments]    ${VALUE}
    Select From List By Value    class=product_sort_container    ${VALUE}

Ajouter Produit Au Panier
    [Documentation]    Ajouter un produit au panier
    [Arguments]    ${INDEX}
    Click Element    //div/div/div[2]/div[2]/button
    Sleep    2s