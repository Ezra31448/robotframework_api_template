*** Settings ***
Documentation     A test suite for a complete purchase flow on SauceDemo.
...               This test logs in, adds an item to the cart, and checks out.
Library           SeleniumLibrary
Library           ${CURDIR}/../../scripts/browser_options.py

*** Keywords ***
Go To Shopping Cart
    Click Element    id=shopping_cart_container
    Wait Until Page Contains    Your Cart

Verify Product In Cart
    [Arguments]    ${product}
    Page Should Contain    ${product}