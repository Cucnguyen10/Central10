*** Keywords ***
Launch SuperSport application, select language and log in
    [Documentation]    Launch application,select english language and log in
    ...                *Arguments:*  
    ...                - _*email*_         : Email of SuperSport user
    ...                - _*password*_         : Password of SuperSport user
    [Arguments]    ${user_name}    ${password}
    common_android_keywords.Launch SuperSport Application
    common_android_keywords.Select english language
    log_in_page_functions.Log in to SuperSport application    ${user_name}    ${password}

Launch SuperSport application, select language and click skip button
    [Documentation]    Launch application,select english language and click skip button
    common_android_keywords.Launch SuperSport Application
    common_android_keywords.Select english language
    login_page.Click skip button