*** Settings ***
Resource    ../Ressources/keywords/sauce_lab_keywords.robot


*** Test Cases ***
Se Connecter Avec Un Compte Standard
    [Documentation]    Se connecter avec le compte standard
    Open Sauce
    Connexion    ${USERNAME}[ok]    ${PASSWORD}
    Deconnexion

Se Connecter Avec Un Compte Verrouille
    [Documentation]    Se connecter avec le compte verrouille
    Open Sauce
    Connexion    ${USERNAME}[nok]    ${PASSWORD}
    #Verifier Message D Erreur Connexion

Passer Une Commande
    [Documentation]    Passer une commande
    Open Sauce
    Connexion    ${USERNAME}[ok]    ${PASSWORD}
    Trier Liste    hilo
    FOR    ${produit}    IN    @{PRODUITS}
        Ajouter Produit Au Panier    ${produit}
    END
    Ouvrir Le Panier
    ${COMPTEUR}=    Compter Quantite Panier   ${PRODUITS}
    Should Be Equal    (integer)${COMPTEUR}    (integer)2