*** Settings ***
Documentation    Test suite generated from session d947401c-ecb6-443b-b9aa-6f7a22a262be containing 1 test case for web automation.
Library         SeleniumLibrary
Library         XML
Test Tags       firefox    saucedemo    e-commerce    web    selenium    automated    generated    web

*** Test Cases ***
SauceDemo E-commerce Complete Purchase Test
    [Documentation]    Complete end-to-end test for SauceDemo website covering login, shopping cart functionality, and checkout process using Firefox browser with SeleniumLibrary
    [Tags]    web    e-commerce    selenium    firefox    saucedemo
    Open Browser    https://www.saucedemo.com/    firefox    alias=main    options=add_argument('--disable-blink-features=AutomationControlled')    # Open firefox and navigate to https://www.saucedemo.com/
    Set Selenium Implicit Wait    10 seconds
    Input Text    id=user-name    standard_user    # Enter 'standard_user' into id=user-name
    Input Password    id=password    secret_sauce
    Click Button    id=login-button    # Click on id=login-button
    Wait Until Page Contains Element    css=.inventory_list
    Click Button    id=add-to-cart-sauce-labs-backpack    # Click on id=add-to-cart-sauce-labs-backpack
    Click Button    id=add-to-cart-sauce-labs-bike-light    # Click on id=add-to-cart-sauce-labs-bike-light
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt    # Click on id=add-to-cart-sauce-labs-bolt-t-shirt
    Element Text Should Be    css=.shopping_cart_badge    3
    Click Element    css=.shopping_cart_link    # Click on css=.shopping_cart_link
    Wait Until Page Contains Element    css=.cart_list
    Click Button    id=checkout    # Click on id=checkout
    Input Text    id=first-name    John    # Enter 'John' into id=first-name
    Input Text    id=last-name    Doe    # Enter 'Doe' into id=last-name
    Input Text    id=postal-code    12345    # Enter '12345' into id=postal-code
    Click Button    id=continue    # Click on id=continue
    Wait Until Page Contains Element    css=.summary_info
    Click Button    id=finish    # Click on id=finish
    Wait Until Page Contains Element    css=.complete-header
    Element Text Should Be    css=.complete-header    Thank you for your order!
    Close Browser