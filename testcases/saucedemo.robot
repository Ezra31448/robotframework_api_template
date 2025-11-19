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
*** Test Cases ***
TC_0001 Complete A Purchase Flow For A Standard User
    [Documentation]    Verifies that a standard user can successfully complete a purchase.
    [Tags]    Smoke    Purchase
    Open Browser And Navigate To Login Page    ${TC_0001.url}    ${TC_0001.browser}
    Login With Credentials    ${TC_0001.valid_user}    ${TC_0001.valid_password}
    Add Product To Cart    ${TC_0001.product_name}
    Go To Shopping Cart
    Verify Product In Cart    ${TC_0001.product_name}
    Proceed To Checkout
    Fill Out Checkout Information    ${TC_0001.first_name}    ${TC_0001.last_name}    ${TC_0001.postal_code}
    Finish Purchase
    Verify Purchase Confirmation
    Logout

