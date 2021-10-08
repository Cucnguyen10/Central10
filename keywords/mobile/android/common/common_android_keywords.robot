
*** Variables ***
&{commonPageLocator}
...    btn_english_language=android=UiSelector().resourceIdMatches(".*id/splash_item_name$").text("ENGLISH")
...    btn_thai_language=android=UiSelector().resourceIdMatches(".*id/splash_item_name$").text("ภาษาไทย")

*** Keywords ***
Open SuperSport Application
    [Arguments]    ${device_data}    
    ${device_data_dict}    Create Dictionary
    ...    deviceName    ${device_data.deviceName}
    ...    platformName    ${device_data.platformName}
    ...    platformVersion    ${device_data.platformVersion}
    ...    app  ${device_data.app}
    ...    newCommandTimeout    ${device_data.newCommandTimeout}
    ...    noReset    ${device_data.noReset}
    ...    autoGrantPermissions    ${device_data.autoGrantPermissions}          
    AppiumLibrary.Open Application   http://localhost:4723/wd/hub    &{device_data_dict}

Launch SuperSport Application
    [Documentation]    Launch application while Appium session running
    AppiumLibrary.Launch Application

Close SuperSport Application
    [Documentation]    Close current application while Appium session running
    Run Keyword And Ignore Error    AppiumLibrary.Close Application

Select english language
    [Documentation]    Select english language at welcome page
    common_android_keywords.Click Element    ${commonPageLocator}[btn_english_language]

Select thai language
    [Documentation]    Select english language at welcome page
    common_android_keywords.Click Element    ${commonPageLocator}[btn_thai_language]    

Get Elements
    [Documentation]    This keyword for getting elements after verify these elements is visible
    ...                ${elems}    - Varargs of locators or elements
    [Arguments]    @{elems}
    Verify Elements Are Visible    @{elems}
    @{elements}    AppiumLibrary.Get Webelements    @{elems}
    [Return]    @{elements}
    
Get Text
    [Documentation]    Get text of target element
    ...                ${locator}    - Locator of target element
    [Arguments]    ${locator}
    common_android_keywords.Wait Element Is Visible    ${locator}
    ${text}    AppiumLibrary.Get Text    ${locator}
    [Return]    ${text}

Input Text
    [Documentation]    Input text into target element
    ...                ${locator}    - Locator of target element
    [Arguments]    ${locator}    ${text}    ${timeout}=${GLOBALTIMEOUT}
    common_android_keywords.Wait Element Is Visible    ${locator}    ${timeout}
    AppiumLibrary.Input Text    ${locator}    ${text}

Click Element
    [Documentation]    Click to target element
    ...                ${locator}    - Locator of target element
    ...                ${timeout}    - Waiting time for target element visible
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    AppiumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    AppiumLibrary.Click Element    ${locator}

Verify Elements Are Visible
    [Documentation]    This keyword verify that page contains elements specified in arguments and verify each element is visible
    ...    ${elems}    - Varargs of locators or elements
    [Arguments]    @{elems}
    FOR    ${elem}    IN    @{elems}
        AppiumLibrary.Wait Until Page Contains Element    ${elem}    timeout=${GLOBALTIMEOUT}
    END    

Wait Element Is Visible
    [Documentation]    Wait element is visible
    ...                ${locator}    - Locator of target element
    ...                ${timeout}    - Waiting time for target element visible
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    AppiumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}

Wait Until Element Is Not Visible
    [Documentation]    Wait element is not visible
    ...                ${locator}    - Locator of target element
    ...                ${timeout}    - Waiting time for current page does not contain target element
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    AppiumLibrary.Wait Until Page Does Not Contain Element    ${locator}    timeout=${timeout}

Click seach button in virtual keyboard
    AppiumLibrary.Press Keycode    66

Get Elements Text
    [Arguments]    ${locator}   
    @{elems}    Get Elements    ${locator}
    ${elem_txt_list}    Create List
    FOR    ${elem}    IN    @{elems}
        ${elem_text}    Get Text    ${elem}    
        Append To List    ${elem_txt_list}    ${elem_text}
    END
    [Return]    ${elem_txt_list}

Scroll Down To Find Element
    [Arguments]    ${scroallable_elem}    ${target_elem}    ${scroll_times}=10    ${scale_min}=0.2    ${scale_max}=0.8
    ${elem_locator}=    AppiumLibrary.Get Webelement    ${scroallable_elem}
    ${elem_size}=    AppiumLibrary.Get Element Size    ${elem_locator}
    ${elem_x_start}=    Evaluate    ${elem_size}[width] / 2
    ${elem_y_start}=      Evaluate    ${elem_size}[width] * ${scale_max}
    ${elem_y_end}=      Evaluate    ${elem_size}[width] * ${scale_min}
    ${ele_location}=    AppiumLibrary.Get Element Location     ${elem_locator}
    FOR   ${index}    IN RANGE    ${scroll_times}
        ${status}=    Run Keyword And Return Status    AppiumLibrary.Element Should Be Visible   ${target_elem}
        Run Keyword if    '${status}'=='${TRUE}'   Exit For Loop
        Swipe      ${elem_x_start}    ${elem_y_start}    ${elem_x_start}    ${elem_y_end}    1000
    END