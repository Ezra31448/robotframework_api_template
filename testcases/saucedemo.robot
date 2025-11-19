*** Settings ***
Documentation     A test suite for a complete purchase flow on SauceDemo.
...               This test logs in, adds an item to the cart, and checks out.
Test Teardown     Close Browser

Resource         ${CURDIR}/../keywords/saucedemo.com/login_page_keyword.resource
Resource         ${CURDIR}/../keywords/saucedemo.com/product_page_keyword.resource
Resource         ${CURDIR}/../keywords/saucedemo.com/cart_list_page_keyword.resource
Resource         ${CURDIR}/../keywords/saucedemo.com/checkout_page_keyword.resource

Variables        ${CURDIR}/../resources/testdata/saucedemo.yaml

Default Tags     Regression

*** Variables ***
${url}                ${TC_0001_Complete_A_Purchase_Flow_For_A_Standard User['url']}
${browser}            ${TC_0001_Complete_A_Purchase_Flow_For_A_Standard User['browser']}
${valid_user}         ${TC_0001_Complete_A_Purchase_Flow_For_A_Standard User['valid_user']}
${valid_password}     ${TC_0001_Complete_A_Purchase_Flow_For_A_Standard User['valid_password']}
${product_name}       ${TC_0001_Complete_A_Purchase_Flow_For_A_Standard User['product_name']}
${first_name}         ${TC_0001_Complete_A_Purchase_Flow_For_A_Standard User['first_name']}
${last_name}          ${TC_0001_Complete_A_Purchase_Flow_For_A_Standard User['last_name']}
${postal_code}        ${TC_0001_Complete_A_Purchase_Flow_For_A_Standard User['postal_code']}


*** Test Cases ***
TC_0001 Complete A Purchase Flow For A Standard User
    [Documentation]    Verifies that a standard user can successfully complete a purchase.
    [Tags]    Smoke    Purchase
    Open Browser And Navigate To Login Page    ${url}    ${browser}
    Login With Credentials    ${valid_user}    ${valid_password}
    Add Product To Cart    ${product_name}
    Go To Shopping Cart
    Verify Product In Cart    ${product_name}
    Proceed To Checkout
    Fill Out Checkout Information    ${first_name}    ${last_name}    ${postal_code}
    Finish Purchase
    Verify Purchase Confirmation
    Logout

