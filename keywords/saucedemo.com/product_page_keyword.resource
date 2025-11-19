*** Settings ***
Documentation     A test suite for a complete purchase flow on SauceDemo.
...               This test logs in, adds an item to the cart, and checks out.
Library           SeleniumLibrary
Library           ${CURDIR}/../../scripts/browser_options.py

*** Keywords ***
Add Product To Cart
    [Arguments]    ${product}
    ${add_to_cart_button_locator}=    Set Variable    //div[text()='${product}']/ancestor::div[@class='inventory_item']//button
    Click Element    ${add_to_cart_button_locator}
    Wait Until Element Contains    ${add_to_cart_button_locator}    Remove