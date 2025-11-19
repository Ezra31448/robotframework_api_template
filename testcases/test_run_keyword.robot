*** Settings ***
# Suite Setup       Run Keywords    Connect To Database Keyword
# ...                               AND    Insert Prerequisite To Database    ${insert_data}
# Suite Teardown    Run Keywords    Remove Prerequisite from Database    ${insert_data['id']}
# ...                               AND    Disconnect From Database
# ...                               AND    Delete All Sessions

Default Tags    regression
Resource        ${CURDIR}/../keywords/common/common_keywords.resource
Resource        ${CURDIR}/../keywords/api/get_single_object_by_id.resource
Resource        ${CURDIR}/../keywords/api/get_list_of_all_objects.resource
# Resource        ${CURDIR}/../keywords/api/api_keyword.resource

Variables       ${CURDIR}/../resources/testdata/get_single_object_by_id/get_single_object_by_id.yaml
Variables       ${CURDIR}/../resources/testdata/get_list_of_all_objects_by_ids/get_list_of_all_objects_by_ids.yaml
# Variables       ${CURDIR}/../resources/testdata/test_data_file.yaml

*** Test Cases ***
TC_REST_0001 Get Single Objects By Id
    [Documentation]    Test Get Single Objects By Id
    [Tags]    test-1
    # Given Insert Prepare Data To The Database
    When Call Get Single Object By Id    7
    Then Verify Get Single Objects By Id Response    ${TC_REST_0001_expected_result['response']}

    # [Teardown]    Run Keywords    Remove Data From The Database1
    # ...                    AND    Remove Data From The Database2

TC_REST_0002 Get List Of All Objects
    [Documentation]    Test Get Lost Of All Objects
    [Tags]    test-2
    When Call Get List Of All Objects
    Then Verify Get List Of All Objects    ${TC_REST_0002_expected_result['response']}

    # [Teardown]    Run Keywords    Remove Data From The Database1
    # ...                    AND    Remove Data From The Database2
