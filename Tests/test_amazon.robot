*** Settings ***
Documentation    This suite tests Amazon functionalities
Resource    ../Ressources/keywords/amazon_keywords.robot


*** Test Cases ***
Scenario: Test the connection on the Amazon site
    [Documentation]    Connection test
    Given I Am On The Site
    When I Log In
    Then I Am Connected
