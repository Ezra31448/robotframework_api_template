*** Settings ***
Library           SeleniumLibrary
Library           String
Test Setup        Open Browser To Login Page
Test Teardown     Close Browser

*** Variables ***
${URL}            https://web-demo.qahive.com/e-commerce/register
${USERNAME}       rewof77142@fergetic.com
${PASSWORD}       Q1w2e3r4
${BROWSER}        chrome
${EXPECTED_ITEMS}  2

*** Test Cases ***
Add 2 Products To Cart And Verify
    [Documentation]    ทดสอบการเพิ่มสินค้า 2 ชิ้นลงตะกร้าและตรวจสอบความถูกต้อง
    [Tags]    Cart    Smoke
    Login With Valid Account
    Select Products And Add To Cart
    Click Basket For Checkout
    Verify Cart Details

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    browser=${BROWSER}
    Maximize Browser Window

Login With Valid Account
    Wait Until Element Is Visible    name=email    timeout=10s
    Input Text    name=email    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[contains(text(), 'submit')]
    Wait Until Element Is Visible    class=logo-text    timeout=10s

Select Products And Add To Cart
    Wait Until Element Is Visible    xpath=(//div[@class='card-body']/button)[1]    timeout=10s
    Click Element    xpath=(//div[@class='card-body']/button)[1]

    Wait Until Element Is Visible    xpath=(//div[@class='card-body']/button)[2]    timeout=10s
    Click Element    xpath=(//div[@class='card-body']/button)[2]

Click Basket For Checkout
    Wait Until Element Is Visible    xpath=//a[@href='/e-commerce/checkout']    timeout=10s
    Click Element    xpath=//a[@href='/e-commerce/checkout']

    Wait Until Page Contains    Shopping cart    timeout=10s
Verify Cart Details
    ${full_text}=    Get Text    xpath=//p[@class='mb-0']
    
    ${matches}=    Get Regexp Matches    ${full_text}    \\d+
    ${actual_items}=    Set Variable    ${matches}[0]
    
    Should Be Equal As Strings    ${actual_items}    ${EXPECTED_ITEMS}    msg=incorrect total item.