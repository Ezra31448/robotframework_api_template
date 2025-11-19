*** Settings ***
Documentation     A test suite for a complete purchase flow on SauceDemo.
...               This test logs in, adds an item to the cart, and checks out.
Library           SeleniumLibrary
Library           ${CURDIR}/../../scripts/browser_options.py

*** Keywords ***
Open Browser And Navigate To Login Page
    [Arguments]    ${url}    ${browser}
    ${options}=    Get Chrome Options
    Open Browser    ${URL}    ${BROWSER}    options=${options}
    Maximize Browser Window
    Wait Until Page Contains Element    id=user-name

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${password}
    Click Button    id=login-button
    Wait Until Page Contains    Products

Logout
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=logout_sidebar_link
    Sleep    1s
    Click Element    id=logout_sidebar_link
    Wait Until Page Contains Element    id=user-name