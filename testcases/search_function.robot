*** Setting ***
Resource    ${CURDIR}/../resources/imports/mobile_import.robot

Test Setup    common_android_keywords.Open SuperSport Application    ${device_info.cuc_device}
Test Teardown    Run Keywords    common_android_keywords.Close SuperSport Application

Test Template    Template - Member verify suggestion list show correctly on UI
Library    DataDriver    file=../resources/data_driven_data/DataDriven.xlsx    sheet_name=search_function    encoding=UTF-8

Force Tags    search_function

*** Keywords ***
Template - Member verify suggestion list show correctly on UI
    [Arguments]    ${customer_email}    ${customer_password}    ${user_type}    ${search_keyword}    ${is_valid_data}
    Run Keyword If    '${user_type.lower()}'=='member'    common_android_functions.Launch SuperSport application, select language and log in    ${customer_email}    ${customer_password}
    ...    ELSE    common_android_functions.Launch SuperSport application, select language and click skip button    
    search_api.Get suggestion data with search by keyword    ${search_keyword}
    header_fragment_functions.Search product with keyword    ${search_keyword}
    Run Keyword If    '${is_valid_data.lower()}'=='true'    Verify suggestion list show correctly on UI with valid data    ${search_keyword}
    ...    ELSE    suggestion_page_functions.Verify search hint is displayed correctly      

Verify suggestion list show correctly on UI with valid data
    [Arguments]    ${search_keyword}
    suggestion_page_functions.Verify suggestion page is displayed correctly with 3 sections
    suggestion_page_functions.Verify brand data is displayed correctly on UI    ${api_brands_dict}    ${search_keyword.upper()}
    suggestion_page_functions.Verify category data is displayed correctly on UI    ${api_categories_dict}
    Scroll to last product in suggestion list
    suggestion_page_functions.Verify product data is displayed correctly on UI    ${api_products_name_list}    ${api_products_price_list}

Scroll to last product in suggestion list
    ${last_idx}    Evaluate    len(${api_products_name_list})-1
    suggestion_page.Scroll to the target product in list    ${api_products_name_list}[${last_idx}]

*** Test Cases ***
Verify suggestion list show correctly on UI
    [Tags]    TC1
    User search with '${search_keyword}'    ${customer_email}    ${customer_password}    ${user_type}    ${search_keyword}    ${is_valid_data}