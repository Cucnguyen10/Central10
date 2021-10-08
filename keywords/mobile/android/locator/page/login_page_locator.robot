*** Variables ***
&{loginPageLocator}
...    btn_login=android=UiSelector().resourceIdMatches(".*id/login_button$")
...    txt_email=android=UiSelector().resourceIdMatches(".*id/editTextFloatLabelTextForm$")
...    txt_password=android=UiSelector().resourceIdMatches(".*id/editTextPasswordForm$")
...    btn_skip=android=UiSelector().resourceIdMatches(".*id/skip_button$")