*** Settings ***
Resource    ${CURDIR}/../locator/fragment/header_fragment.robot

*** Keywords ***
Click search button
    [Documentation]    Click search button in header fragment
    common_android_keywords.Click Element    ${headerFragmentLocator}[btn_search]

Input search keyword in search box
    [Arguments]    ${keyword}
    [Documentation]    Input search keyword in search box
    common_android_keywords.Input Text    ${headerFragmentLocator}[input_search]    ${keyword}   
