*** Settings ***
Resource    ../Ressources/keywords/amazon_keywords.robot
Resource    ../Ressources/variables/amazon_variables.robot

*** Test Cases ***
Test
    Open amazon
    Identification
