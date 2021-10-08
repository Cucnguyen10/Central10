*** Variables ***
&{suggestionPageLocator}
...    txt_search_hint=android=UiSelector().resourceIdMatches(".*id/search_hint$")
...    container_suggestion_view=android=UiSelector().resourceIdMatches(".*id/recyclerViewSuggestion$")
...    label_brands=android=UiSelector().resourceIdMatches(".*id/textView$").text("${suggestion_page.label_brands}")
...    label_categories=android=UiSelector().resourceIdMatches(".*id/textView$").text("${suggestion_page.label_categories}")
...    label_products=android=UiSelector().resourceIdMatches(".*id/textView$").text("${suggestion_page.label_products}")
...    txt_brands_name=xpath=//*[@resource-id="th.co.supersports:id/textView" and starts-with(@text, "{brand_name}")]
...    txt_brands_score=xpath=//*[@resource-id="th.co.supersports:id/textView" and starts-with(@text, "{brand_name}")]//following-sibling::android.widget.TextView
...    txt_category_name=android=UiSelector().resourceIdMatches(".*id/textViewCategory$")
...    txt_category_score=xpath=//*[@resource-id="th.co.supersports:id/textViewCategory"]//following-sibling::android.widget.TextView
...    txt_products_name=android=UiSelector().resourceIdMatches(".*id/textViewTitle$")
...    txt_products_price=android=UiSelector().resourceIdMatches(".*id/textViewPrice$")
...    txt_products_discount=android=UiSelector().resourceIdMatches(".*id/textViewDiscount$")
...    txt_product_name=android=UiSelector().resourceIdMatches(".*id/textViewTitle$").text("{product_name}")