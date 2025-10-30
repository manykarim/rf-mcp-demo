*** Settings ***
Documentation    Refactored keyword-driven test suite for SauceDemo e-commerce website
Resource         saucedemo_keywords.robot
Test Setup       Setup Browser
Test Teardown    Teardown Browser
Test Tags        selenium    e2e    saucedemo    firefox    automated    keyword-driven

*** Test Cases ***
SauceDemo Complete Shopping Flow Test
    [Documentation]    Complete end-to-end test using keyword-driven approach for SauceDemo website
    [Tags]    e2e    saucedemo    selenium    firefox
    Login To SauceDemo
    Add Products To Cart    id=add-to-cart-sauce-labs-backpack    id=add-to-cart-sauce-labs-bike-light    id=add-to-cart-sauce-labs-bolt-t-shirt
    Verify Cart Badge Count    3
    Navigate To Cart
    Complete Checkout Process    John    Doe    12345
