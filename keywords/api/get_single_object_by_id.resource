*** Settings ***
Resource    ${CURDIR}/../../resources/imports.resource
Resource    ${CURDIR}/../common/common_keywords.resource

*** Keywords ***
Call Get Single Object By Id
    [Arguments]    ${object_id}
    ${param}=    Create Dictionary    id=${object_id}
    ${response}=    Call And Get API Response    Get    ${single_object_path}    data=${param}    type=params
    Log    ${response}
    Set Test Variable    ${response}

Verify Get Single Objects By Id Response
    [Arguments]    ${expected_result}
    Should Be Equal    ${expected_result}    ${response.json()}
    
