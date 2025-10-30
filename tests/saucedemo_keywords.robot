*** Settings ***
Documentation    Reusable keywords for SauceDemo e-commerce website automation
Library          SeleniumLibrary

*** Variables ***
${URL}              https://www.saucedemo.com/
${BROWSER}          firefox
${USERNAME}         standard_user
${PASSWORD}         secret_sauce
${IMPLICIT_WAIT}    10 seconds

*** Keywords ***
Setup Browser
    [Documentation]    Open browser and configure implicit wait
    Open Browser    ${URL}    ${BROWSER}    options=add_argument('--start-maximized')
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}

Teardown Browser
    [Documentation]    Close the browser
    Close Browser

Login To SauceDemo
    [Documentation]    Login to SauceDemo with standard user credentials
    [Arguments]    ${username}=${USERNAME}    ${password}=${PASSWORD}
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${password}
    Click Button    id=login-button

Add Product To Cart By Id
    [Documentation]    Add a single product to cart using its button ID
    [Arguments]    ${product_button_id}
    Click Button    ${product_button_id}

Add Products To Cart
    [Documentation]    Add multiple products to the shopping cart
    [Arguments]    @{product_ids}
    FOR    ${product_id}    IN    @{product_ids}
        Add Product To Cart By Id    ${product_id}
    END

Verify Cart Badge Count
    [Documentation]    Verify the shopping cart badge shows expected item count
    [Arguments]    ${expected_count}
    Element Text Should Be    class=shopping_cart_badge    ${expected_count}

Navigate To Cart
    [Documentation]    Click on the shopping cart to view items
    Click Element    class=shopping_cart_link

Start Checkout Process
    [Documentation]    Click the checkout button from the cart page
    Click Button    id=checkout

Fill Checkout Information
    [Documentation]    Enter customer information during checkout
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text    id=first-name    ${first_name}
    Input Text    id=last-name    ${last_name}
    Input Text    id=postal-code    ${postal_code}
    Click Button    id=continue

Complete Order
    [Documentation]    Finalize the order and verify success message
    Click Button    id=finish
    Element Text Should Be    class=complete-header    Thank you for your order!

Complete Checkout Process
    [Documentation]    Complete the entire checkout flow with customer information
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Start Checkout Process
    Fill Checkout Information    ${first_name}    ${last_name}    ${postal_code}
    Complete Order
