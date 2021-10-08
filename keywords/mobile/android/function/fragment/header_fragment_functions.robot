*** Keywords ***
Search product with keyword
    [Arguments]    ${keyword}
    header_fragment.Click search button
    header_fragment.Input search keyword in search box    ${keyword}
    common_android_keywords.Click seach button in virtual keyboard