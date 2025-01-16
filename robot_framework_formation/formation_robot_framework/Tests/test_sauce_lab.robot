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
    FOR    ${$index}    IN    0 1
        Ajouter Produit Au Panier ${$index}
    END
