*** Settings ***
Resource    ../../Ressources/library.resource
Resource    ../../Ressources/variables/demoqa_variables.robot


*** Keywords ***
Given Je Suis Sur Le Site
    [Documentation]    Se rendre sur le site
    Ouvrir Le Site

When Je Recherche Un Livre
    [Documentation]    Chercher un livre
    [Arguments]    ${LIVRE}
    Go To    ${LIEN_BOOK_STORE}
    Input Text    ${BOOK_SEARCH_BOX}    ${LIVRE}
    Sleep    1s

Then Le Resultat De La Recherche Est Coherent
    [Documentation]    verifier l'auteur du livre
    [Arguments]    ${AUTEUR}
    Wait Until Element Contains    ${BOOK_AUTEUR}    ${AUTEUR}
    Fermer Le Site

Given Je Suis Sur La Page Login
    [Documentation]    Se rendre sur la page login
    Ouvrir Le Site
    Go To    ${LIEN_LOGIN}
    Sleep    1s

When Je Creer Un Compte
    [Documentation]    Création de compte
    [Arguments]    ${FIRSTNAME}    ${LASTNAME}    ${USERNAME}    ${PASSWORD}
    Go To    ${LIEN_LOGIN_NEW_USER}
    Sleep    1s
    Creer Un Compte    ${FIRSTNAME}    ${LASTNAME}    ${USERNAME}    ${PASSWORD}

Then Je Peux Me Connecter Avec Ce Compte
    [Documentation]    Connexion et verification du compte connecté
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Se Logger    ${USERNAME}    ${PASSWORD}
    Verify Login    ${USERNAME}
    Fermer Le Site

Given Je Suis Sur La Page Interactions
    [Documentation]    Se rendre sur la page interaction
    Ouvrir Le Site
    Go To    ${LIEN_INTERACTIONS_SELECTABLE}

When Je Selectionne Differents Elements
    [Documentation]    Selection des différents elements
    [Arguments]    @{LIST_ARGUMENTS}
    @{LISTE_INTERACTION}=    Set Variable    @{LIST_ARGUMENTS}[0]
    @{LISTE_GRILLE}=    Set Variable    @{LIST_ARGUMENTS}[1]
    Interactions Selectable    @{LISTE_INTERACTION}
    Grille    @{LISTE_GRILLE}

Then La Selection Des Elements Est Coherente
    [Documentation]    Verification des elements selectionnees
    [Arguments]    @{LIST_ARGUMENTS}
    Verify Interactions Liste    @{LIST_ARGUMENTS}[0]

Given Je Suis Sur La Page Date Picker
    [Documentation]    Se rendre sur la page date picker
    Ouvrir Le Site
    Go To    ${LIEN_DATE_PICKER}

When Je Choisis Un Creneau
    [Documentation]    Choisir un créneau dans le champ
    [Arguments]    ${JOUR}    ${MOIS}    ${ANNEE}    ${HEURE}
    Click Element    ${DATE_TIME_INPUT}
    Execute JavaScript    window.scrollBy(0, 300)
    Click To Year    ${ANNEE}
    Click Element    //div[.='${ANNEE}']
    Click Element    ${MONTH_DATE_TIME_INPUT}
    Click Element    //div[.='${MOIS}']
    Click Element    //div[@class='react-datepicker__month']//div[@class='react-datepicker__week']//div[contains(text(), '${JOUR}')]
    Click To Time    ${HEURE}

Then La Selection S Affiche
    [Documentation]    Vérification des données
    [Arguments]    ${JOUR}    ${MOIS}    ${ANNEE}    ${HEURE}
    #Wait Until Element Contains    id=dateAndTimePickerInput    "${MOIS} ${JOUR}, ${ANNEE} 11:45 PM"
    Fermer Le Site

Given Je Suis Sur La Page Checkbox
    [Documentation]    Se rendre sur la page checkbox
    Ouvrir Le Site
    Go To    ${LIEN_CHECKBOX}

Click To Year
    [Documentation]    Clique jusqu'a trouver l'annee passé en parametre
    [Arguments]    ${ANNEE}
    Click Element    ${YEAR_DATE_TIME_INPUT}
    ${element_present}=    Set Variable    False
    WHILE    ${element_present}==False
        Click Element    ${BTN_YEAR_DATE_TIME_INPUT}
        ${element_present}=    Run Keyword And Return Status    Element Should Be Visible    //div[.='${ANNEE}']
    END

Click To Time
    [Documentation]    Clique jusqu'a trouver l'heure passé en parametre
    [Arguments]    ${HEURE}
    ${element_present2}=    Set Variable    False
    Sleep    1s
    WHILE    ${element_present2}==False
        Execute JavaScript    document.getElementsByClassName('react-datepicker__time-list')[0].scrollBy(0, 1000);
        ${element_present2}=    Run Keyword And Return Status    Element Should Be Visible    //li[.='${HEURE}']
    END
    Click Element    //li[.='${HEURE}']

Creer Un Compte
    [Documentation]    Creer Un Compte
    [Arguments]    ${FIRSTNAME}    ${LASTNAME}    ${USERNAME}    ${PASSWORD}
    Input Text    ${NEW_USER_FIRSTNAME}    ${FIRSTNAME}
    Input Text    ${NEW_USER_LASTNAME}    ${LASTNAME}
    Input Text    ${NEW_USER_USERNAME}    ${USERNAME}
    Input Password    ${NEW_USER_PASSWORD}    ${PASSWORD}
    Scroll Element Into View    ${NEW_USER_VALIDE}
    Execute JavaScript    window.scrollBy(0, 500)
    Sleep    2s
    #frame 
    Execute JavaScript    document.getElementById('g-recaptcha-response').value = "token_validé"
    Click Button    ${NEW_USER_VALIDE}
    Sleep    3s

Se Logger
    [Documentation]    Se logger
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Go To    ${LIEN_LOGIN}
    Input Text    ${NEW_USER_USERNAME}    ${USERNAME}
    Input Password    ${NEW_USER_PASSWORD}    ${PASSWORD}
    Execute JavaScript    window.scrollBy(0, 500)
    Click Button    ${LOGIN_BOUTON}
    Sleep    10S

Verify Login
    [Documentation]    Verifier le user name
    [Arguments]    ${USERNAME}
    Wait Until Element Contains    ${CONTENEUR_USERNAME}    ${USERNAME}    10s

Interactions Selectable
    [Documentation]    Tester les selectable
    [Arguments]    @{LIST_SELECTABLE}
    Wait Until Element Is Visible    ${SPAN_SELECTABLE}    10s
    Click Element    ${SPAN_SELECTABLE}
    FOR    ${SELECTABLE}    IN    @{LIST_SELECTABLE}
        Click Element    //li[.='${SELECTABLE}']
    END

Grille
    [Documentation]    Remplir grille
    [Arguments]    @{NUMBER_GRILLE}
    Click Element    ${GRID}
    FOR    ${NUMBER}    IN    @{NUMBER_GRILLE}
        Execute JavaScript    window.scrollBy(0, 300)
        Click Element    //li[.='${NUMBER}']
    END
    Sleep    2s

Verify Interactions Liste
    [Documentation]    Verify  Interactions Liste
    [Arguments]    @{LIST_SELECTABLE}
    Click Element    ${BTN_LIST}
    Sleep    1s
    #FOR    ${SELECTABLE}    IN    @{LIST_SELECTABLE}
        #Wait Until Element Contains   //li[@class='active']    ${SELECTABLE}
    #END

Ouvrir Le Site
    [Documentation]    Ouvrir le site sur le navigateur
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fermer Le Site
    [Documentation]    Ferme le site
    Close Browser
