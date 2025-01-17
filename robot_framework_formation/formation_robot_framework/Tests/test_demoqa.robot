*** Settings ***
Resource    ../Ressources/keywords/demoqa_keywords.robot


*** Variables ***
@{INTERACTIONS}    Morbi leo risus    Cras justo odio
@{NUMBER_GRILLE}    Five    Nine    One
@{LIST_ARGUMENTS}    ${INTERACTIONS}    ${NUMBER_GRILLE}


*** Test Cases ***
Scenario: Verifier la recherche de livre
    [Documentation]    Verifier la recherche de livre
    Given Je Suis Sur Le Site
    When Je Recherche Un Livre     Designing Evolvable
    Then Le Resultat De La Recherche Est Coherent    Glenn Block et al.

Scenario: Créer un compte et se connecter
    [Documentation]    Créer un compte et se connecter
    Given Je Suis Sur La Page Login
    When Je Creer Un Compte    Toto    Toto    Toto    Toto123456!
    Then Je Peux Me Connecter Avec Ce Compte     Einstein    123456!Albert

Scenario: Vérifier les intéractions
    [Documentation]    Vérifier les intéractions
    Given Je Suis Sur La Page Interactions
    When Je Selectionne Differents Elements    @{LIST_ARGUMENTS}
    Then La Selection Des Elements Est Coherente    @{LIST_ARGUMENTS}

Scenario: Vérifier le fonctionnement du date-picker
    [Documentation]    Vérifier le fonctionnement du date-picker
    Given Je Suis Sur La Page Date Picker
    When Je Choisis Un Creneau    5    November    2035    23:45
    Then La Selection S Affiche    5    November    2035    23:45

Scenario: Cocher les checkbox
    [Documentation]    Vérifier le fonctionnement des checkbox
    Given Je suis sur la page checkbox
    When Je selectionne des elements
    Then les elements sont selectionnes