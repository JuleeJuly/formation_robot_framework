*** Settings ***
Documentation    This suite contains tests for the Sauce Labs demo website.
Resource    ../Ressources/keywords/sauce_lab_keywords.robot


*** Test Cases ***
Scenario: Log In With A Standard Account
    [Documentation]    Log in with the standard account
    Given I Am On The Saucedemo Website
    When I Log In    secret_sauce    standard_user
    Then I Can Log Out

Scenario: Log In With A Locked Account
    [Documentation]    Log in with the locked account
    Given I Am On The Saucedemo Website
    When I Log In    secret_sauce    locked_out_user
    Then I Am Not Logged In

Scenario: Place an Order
    [Documentation]    Place an Order
    Given I Am On The Saucedemo Website
    When I Log In    secret_sauce    standard_user
    And I Add Products To The Cart
    Then I Can Place An Order    Jean    Peuplu    62000
