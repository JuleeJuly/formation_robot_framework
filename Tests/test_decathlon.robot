*** Settings ***
Documentation    This suite tests adding multiple products to the cart on Decathlon
Resource    ../Ressources/keywords/decathlon_keywords.robot


*** Test Cases ***
Scenario: Add multiple products to the cart
    [Documentation]    Add multiple products to the cart
    Given I Am On The Decathlon Website    "accept"
    When I Add Multiple Products To The Cart
    Then The Products Are In My Cart
