*** Settings ***
Documentation     A test suite for a complete purchase flow on SauceDemo.
...               This test logs in, adds an item to the cart, and checks out.
Library           SeleniumLibrary
Library           ${CURDIR}/../../scripts/browser_options.py

*** Keywords ***
Proceed To Checkout
    Click Button    id=checkout
    Wait Until Page Contains    Checkout: Your Information

Fill Out Checkout Information
    [Arguments]    ${first_name}    ${last_name}=robot    ${postal_code}=10270
    Input Text    id=first-name    ${first_name}
    Input Text    id=last-name    ${last_name}
    Input Text    id=postal-code    ${postal_code}
    Click Button    id=continue

Finish Purchase
    Wait Until Page Contains    Checkout: Overview
    Click Button    id=finish

Verify Purchase Confirmation
    Wait Until Page Contains Element    class=complete-header
    Element Text Should Be    class=complete-header    Thank you for your order!