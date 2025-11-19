*** Settings ***
Resource    ${CURDIR}/../../resources/imports.resource
Resource    ${CURDIR}/../common/common_keywords.resource

*** Keywords ***
Call Get List Of All Objects
    ${response}=    Call And Get API Response    Get    ${list_of_all_objects_path}
    Log    ${response}
    Set Test Variable    ${response}

Verify Get List Of All Objects
    [Arguments]    ${expected_result}
    FOR    ${index}    ${item}    IN ENUMERATE    @{response.json()}
        &{actual}=    Set Variable    ${response.json()}[${index}]
        &{expected}=    Set Variable    ${expected_result}[${index}]
        Dictionaries Should Be Equal    ${actual}    ${expected}
    END