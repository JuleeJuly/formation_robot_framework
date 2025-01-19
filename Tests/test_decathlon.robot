*** Settings ***
Resource    ../Ressources/keywords/decathlon_keywords.robot


*** Test Cases ***
Ajouter Plusieurs Produits Au Panier
    [Documentation]    Ajouter plusieurs produits au panier
    Open Decathlon
    Accepter Les Cookies    "accept"
    FOR    ${index}    IN RANGE    0    2
        Rechercher Un Produit
        Acceder Page Produit
        Ajouter Au Panier
    END
