*** Settings ***
Documentation    This test suite contains test cases for the demoqa website.
Resource    ../Ressources/keywords/demoqa_keywords.robot


*** Variables ***
@{INTERACTIONS}    Morbi leo risus    Cras justo odio
@{NUMBER_GRILLE}    Five    Nine    One
@{LIST_ARGUMENTS}    ${INTERACTIONS}    ${NUMBER_GRILLE}


*** Test Cases ***
Scenario: Verify book search
    [Documentation]    Verify book search
    Given I Am On The Website
    When I Search For A Book      Designing Evolvable
    Then The Search Result Is Relevant    Glenn Block et al.

Scenario: Create an account and log in
    [Documentation]    Create an account and log in
    Given I Am On The Login Page
    When I Create An Account    Toto    Toto    Toto    Toto123456!
    Then I Can Log In With This Account     Einstein    123456!Albert

Scenario: Verify interactions
    [Documentation]    Verify interactions
    Given I Am On The Interactions Page
    When I Select Different Elements    @{LIST_ARGUMENTS}
    Then The Selection Of Elements Is Consistent    @{LIST_ARGUMENTS}

Scenario: Verify the functionality of the date-picker
    [Documentation]    Verify the functionality of the date-picker
    Given I Am On The Date Picker Page
    When I Choose A Slot    5    November    2035    23:45
    Then The Selection Is Displayed    5    November    2035    23:45

Scenario: Verify the alerts
    [Documentation]    Verify the alerts
    Given I Am On The Alert Page
    When I Choose Different Options    JuLee
    Then The Different Alerts Are Displayed

Scenario: Check the checkboxes
    [Documentation]    Verify the functionality of the checkboxes
    Given I Am On The Checkbox Page
    When I Select Some Elements
    Then The Elements Are Selected
