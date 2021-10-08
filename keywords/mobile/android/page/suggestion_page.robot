*** Settings ***
Resource    ${CURDIR}/../locator/page/suggestion_page_locator.robot

*** Keywords ***
Get search hint
    [Documentation]    Get search hint
    ${search_hint}    common_android_keywords.Get Text    ${suggestionPageLocator}[txt_search_hint]
    [Return]    ${search_hint}

Verify suggestion part is displayed
    [Documentation]    Verify suggestion part is displayed
    common_android_keywords.Wait Element Is Visible    ${suggestionPageLocator}[container_suggestion_view]

Verify brand label is visible
    [Documentation]    Verify brand label is visible
    common_android_keywords.Wait Element Is Visible    ${suggestionPageLocator}[label_brands]

Verify category label is visible
    [Documentation]    Verify category label is visible
    common_android_keywords.Wait Element Is Visible    ${suggestionPageLocator}[label_categories]

Verify product label is visible
    [Documentation]    Verify product label is visible
    common_android_keywords.Wait Element Is Visible    ${suggestionPageLocator}[label_products]

Get brand name in brand section
    common_android_keywords.Get Elements Text    ${suggestionPageLocator}[txt_brand_name]

Get category name in category section
    ${categories_name_list}    common_android_keywords.Get Elements Text    ${suggestionPageLocator}[txt_category_name]
    [Return]    ${categories_name_list}    

Get category score in category section
    ${categories_score_list}    common_android_keywords.Get Elements Text    ${suggestionPageLocator}[txt_category_score]
    [Return]    ${categories_score_list} 

Scroll to the target product in list
    [Arguments]    ${product_name}
    ${locator}    String.Format String    ${suggestionPageLocator}[txt_product_name]    product_name=${product_name}
    common_android_keywords.Scroll Down To Find Element    ${suggestionPageLocator}[container_suggestion_view]    ${locator}

Get products name
    ${products_name_list}    common_android_keywords.Get Elements Text    ${suggestionPageLocator}[txt_products_name]
    [Return]    ${products_name_list}

Get products price
    ${products_price_list}    common_android_keywords.Get Elements Text    ${suggestionPageLocator}[txt_products_price]
    [Return]    ${products_price_list}

Get products brand name
    [Arguments]    ${brand_name}
    ${locator}    String.Format String    ${suggestionPageLocator}[txt_brands_name]    brand_name=${brand_name}
    ${products_brand_name_list}    common_android_keywords.Get Elements Text    ${locator}
    [Return]    ${products_brand_name_list}

Get products brand score
    [Arguments]    ${brand_name}
    ${locator}    String.Format String    ${suggestionPageLocator}[txt_brands_score]    brand_name=${brand_name}
    ${products_brand_score_list}    common_android_keywords.Get Elements Text    ${locator}    
    [Return]    ${products_brand_score_list}