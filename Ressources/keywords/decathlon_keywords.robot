*** Settings ***
Resource    ../../Ressources/library.resource
Resource    ../../Ressources/variables/decathlon_variables.robot


*** Keywords ***
Open Decathlon
    [Documentation]    Open the browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Accepter Les Cookies
    [Documentation]    Accept cookies
    [Arguments]    ${ACTIONS}
    IF    ${ACTIONS} == "accept"
        Click Button    ${COOKIE}[accept]
    ELSE IF    ${ACTIONS} == "refuse"
        Click Button    ${COOKIE}[refuse]
    ELSE
        Click Button    ${COOKIE}[personnaliser]
    END

Rechercher Un Produit
    [Documentation]    Search a product
    Input Text    ${BARRE_RECHERCHE}    ${PRODUCT}
    Press Keys    ${BARRE_RECHERCHE}    ${APPUI_ENTREE}
    Sleep    2s

Acceder Page Produit
    [Documentation]    Access product page
    Sleep    2s
    Click Element    ${LIEN_PAGE_PRODUIT}
    Sleep    2s

Ajouter Au Panier
    [Documentation]    Add to cart
    Click Button    ${BTN_AJOUTER_PANIER}
