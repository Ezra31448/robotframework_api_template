*** Settings ***
Resource    ${CURDIR}/../../resources/imports.resource

Variables    ${CURDIR}/../../resources/testdata/common/common.yaml

*** Keywords ***
Call And Get API Response
    [Arguments]    ${method}    ${path}    ${data}=${None}    ${type}=json    ${header}=${None}    ${url}=${rest_api_url}
    ${header}=    Run Keyword If    $header is None    Get Header With Correlation Id
    ...    ELSE    Set Variable    ${header}

    ${is_https}=    Evaluate    "https://" in "${url}"
    Create Session    session    ${url}    headers=${header}    verify=${is_https}

    ${response}=    Run Keyword If    ${data} is not ${NONE}    ${method} On Session    session    ${path}    ${type}=${data}    expected_status=anything
    ...    ELSE    ${method} On Session    session    ${path}    expected_status=anything
    Log    ${response.text}
    RETURN    ${response}

Get Test Case Number
    ${test_case_name}=    Get Variable Value    ${TEST_NAME}    ${SUITE_NAME}
    @{splitted_test_case_name}=    Split String    ${test_case_name}    ${SPACE}
    RETURN    ${splitted_test_case_name}[0]

Get Header With Correlation Id
    ${test_case_number}=    Get Test Case Number

    ${header}=    Copy Dictionary    ${rest_header}
    Set To Dictionary    ${header}    X-CORRELATION-ID=AUTOMATE_ROBOT_${test_case_number}
    RETURN    ${header}