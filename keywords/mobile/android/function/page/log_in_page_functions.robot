*** Keywords ***
Log in to SuperSport application
    [Documentation]    Log in to application by input datas and click log in button
    ...                *Arguments:*  
    ...                - _*email*_         : Email of SuperSport user
    ...                - _*password*_         : Password of SuperSport user
    [Arguments]    ${email}    ${password}
    login_page.Input customer email    ${email}
    login_page.Input customer password    ${password}
    login_page.Click login button