*** Keywords ***
Verify search hint is displayed correctly
    ${search_hint}    suggestion_page.Get search hint
    Should Contain    ${search_hint}    ${suggestion_page.label_search_hint}

Verify suggestion page is displayed correctly with 3 sections
    suggestion_page.Verify brand label is visible
    suggestion_page.Verify category label is visible
    suggestion_page.Verify product label is visible

Verify brand data is displayed correctly on UI
    [Arguments]    ${dict_brand_data}    ${brand_name}
    ${products_brand_name_list}    suggestion_page.Get products brand name    ${brand_name}
    ${products_brand_score_list}    suggestion_page.Get products brand score    ${brand_name}
    FOR    ${i}    IN RANGE    len(${products_brand_name_list})
        ${idx_brand_score}    Get From Dictionary    ${dict_brand_data}    ${products_brand_name_list}[${i}]
        ${UI_brand_score}    Convert To Integer    ${products_brand_score_list}[${i}]    
        Should Be Equal    ${idx_brand_score}    ${UI_brand_score}
    END

Verify category data is displayed correctly on UI
    [Arguments]    ${dict_categories_data}
    ${categories_name_list}    suggestion_page.Get category name in category section
    ${categories_score_list}    suggestion_page.Get category score in category section
    FOR    ${i}    IN RANGE    len(${categories_name_list})
        ${UI_category_score}    Convert To Integer    ${categories_score_list}[${i}]    
        Dictionary Should Contain Value    ${dict_categories_data}    ${UI_category_score}
    END

Verify product data is displayed correctly on UI
    [Arguments]    ${list_products_name}    ${list_products_price}
    ${products_name_UI_list}    suggestion_page.Get products name
    ${products_price_UI_list}    suggestion_page.Get products price
    Lists Should Be Equal    ${products_name_UI_list}    ${list_products_name}
    Lists Should Be Equal    ${products_price_UI_list}    ${list_products_price}