*** Setting ***
# Setting
Resource    ${CURDIR}/base_import.robot

# API
Resource    ${CURDIR}/../../keywords/api/search_api.robot

# Common
Resource    ${CURDIR}/../../keywords/mobile/android/common/common_android_keywords.robot

# Page
Resource    ${CURDIR}/../../keywords/mobile/android/page/login_page.robot
Resource    ${CURDIR}/../../keywords/mobile/android/page/suggestion_page.robot

#Section
Resource    ${CURDIR}/../../keywords/mobile/android/fragment/header_fragment.robot

# Common Function
Resource    ${CURDIR}/../../keywords/mobile/android/function/common/common_android_functions.robot

# Page Function
Resource    ${CURDIR}/../../keywords/mobile/android/function/page/log_in_page_functions.robot
Resource    ${CURDIR}/../../keywords/mobile/android/function/page/suggestion_page_functions.robot
# Fragment Function
Resource    ${CURDIR}/../../keywords/mobile/android/function/fragment/header_fragment_functions.robot