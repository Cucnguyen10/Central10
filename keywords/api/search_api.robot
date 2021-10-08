*** Variables ***
${api_end_point}    https://en.supersports.co.th

*** Keywords ***
Get suggestion data with search by keyword
    [Arguments]    ${keyword}    ${catalog_type}=Main    ${shop_type}=1
    ${response}    Get response for suggestion data with search by keyword    ${keyword}    ${catalog_type}    ${shop_type}
    ${brands_data_dict}    Get brand data from suggestion with search by keyword    ${response}
    ${categories_data_dict}    Get category data from suggestion with search by keyword    ${response}
    ${products_name_list}    ${products_price_list}    Get product data from suggestion with search by keyword    ${response}
    Set Test Variable    ${api_brands_dict}    ${brands_data_dict}
    Set Test Variable    ${api_categories_dict}    ${categories_data_dict}
    Set Test Variable    ${api_products_name_list}    ${products_name_list}
    Set Test Variable    ${api_products_price_list}    ${products_price_list}

Get response for suggestion data with search by keyword
    [Arguments]    ${keyword}    ${catalogtype}=Main    ${shoptype}=1
    &{header}=    Create Dictionary    Accept=application/json    Content-Type=application/json
    &{query}=    Create Dictionary    q=${keyword}    catalogtype=${catalogtype}    shoptype=${shoptype}
    ${seach_end_point}=   Set Variable    ${api_end_point}/_c/search/suggest_with_product?
    ${response}=    REST.Get    endpoint=${seach_end_point}    query=&{query}    headers=&{header}
    REST.Integer    response status    200
    ${response}=    REST.Output    response body
    [Return]    ${response}

Get brand data from suggestion with search by keyword
    [Arguments]    ${response}
    ${brands_name}    JSONLibrary.Get Value From Json    ${response}    $..brands[*].name
    ${brands_score}    JSONLibrary.Get Value From Json    ${response}    $..brands[*].scored
    ${brands_data_dict}    Create Dictionary
    FOR    ${i}    IN RANGE    len(${brands_name})
        Collections.Set To Dictionary    ${brands_data_dict}    ${brands_name}[${i}]    ${brands_score}[${i}]
    END
    [Return]    ${brands_data_dict}

Get category data from suggestion with search by keyword
    [Arguments]    ${response}
    ${categories_url}    JSONLibrary.Get Value From Json    ${response}    $..categories[*].categoryUrl
    ${categories_score}    JSONLibrary.Get Value From Json    ${response}    $..categories[*].scored
    ${categories_data_dict}    Create Dictionary
    FOR    ${i}    IN RANGE    len(${categories_url})
        Collections.Set To Dictionary    ${categories_data_dict}     ${categories_url}[${i}]    ${categories_score}[${i}]
    END
    [Return]    ${categories_data_dict}

Get product data from suggestion with search by keyword
    [Arguments]    ${response}
    ${products_sku}    JSONLibrary.Get Value From Json    ${response}    $..products[*].meta.sku
    ${products_name}    JSONLibrary.Get Value From Json    ${response}    $..products[*].meta.name
    ${products_price}    JSONLibrary.Get Value From Json    ${response}    $..products[*].meta.price
    ${products_special_price}    JSONLibrary.Get Value From Json    ${response}    $..products[*].meta.special_price
    ${products_name_list}    Create List
    ${products_price_list}    Create List
    FOR    ${i}    IN RANGE    len(${products_sku})
        Append To List    ${products_name_list}    ${products_name}[${i}]
        ${product_price_str}    Catenate    SEPARATOR=${SPACE}    ${products_price}[${i}]    ${common_data.baht_text}
        Append To List    ${products_price_list}    ${product_price_str}
    END
    [Return]    ${products_name_list}    ${products_price_list}