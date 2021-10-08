*** Settings ***
Resource    ${CURDIR}/../locator/page/login_page_locator.robot

*** Keywords ***
Input customer email
    [Documentation]    Input email to customer email input
    ...                *Arguments:*  
    ...                - _*email*_         : Email of SuperSport user
    [Arguments]    ${email}
    common_android_keywords.Input Text    ${loginPageLocator}[txt_email]    ${email}

Input customer password
    [Documentation]    Input password to customer password input
    ...                *Arguments:*
    ...                - _*password*_      : Password of SuperSport user
    [Arguments]    ${password}
    common_android_keywords.Input Text    ${loginPageLocator}[txt_password]    ${password}

Click login button
    [Documentation]    Click log in button
    common_android_keywords.Click Element    ${loginPageLocator}[btn_login]

Click skip button
    [Documentation]    Click skip button
    common_android_keywords.Click Element    ${loginPageLocator}[btn_skip]      