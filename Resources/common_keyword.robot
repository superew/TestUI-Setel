*** Setting ***
Library  OperatingSystem
Library  SeleniumLibrary
Library  String
Resource 	./Locator/HomePageUI.robot
Library 	../lib/cusLib.py

*** Keywords ***
#Setup chromedriver
#    Create Webdriver  Chrome  executable_path=${EXECDIR}/Resources/chromedriver
Open Browser Before Test
  [Arguments]  ${URL}  ${Browser}
  open browser  ${URL}  ${Browser}  executable_path=${EXECDIR}/Resources/chromedriver
  maximize browser window

Quit Browser After Done
  close browser

Turn off Convert prices to VND
  click element  ${EBAY_VIEW_MENU}
  click button  ${EBAY_CUSTOMIZE_SEARCH}
  wait until page contains element  //div[@class='s-customize-dialog']/div[@aria-hidden='false']
  ${ele}    Get WebElement    ${EBAY_CONVERT_VND}
  Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele}
  click button  ${EBAY_APPLY_BTN}

Get Amazon Product List
  @{locator}  get webelements  ${AMAZON_SEARCH_RESULTS_BLOCK}
  ${length}  get length   ${locator}
  ${amazon_results}=    Create List
  FOR    ${INDEX}    IN RANGE     1  ${length}+1
    set selenium implicit wait  2
    ${name}=    Get Text    //div[@data-component-type='s-search-result'][${INDEX}]/div[@class='sg-col-inner']//h2//span
    ${product_link}=    get element attribute    //div[@data-component-type='s-search-result'][${INDEX}]/div[@class='sg-col-inner']//h2/a  href

    ${present}=  Run Keyword And Return Status    get webelement   //div[@data-component-type='s-search-result'][${INDEX}]//span[@class='a-price']//span[@class='a-offscreen']
    ${AMAZON_PRICE}=  run keyword if  ${present}  Get Text  //div[@data-component-type='s-search-result'][${INDEX}]//span[@class='a-price']//span[@class='a-offscreen']
    ${items}  Create List  AMAZON  ${name}  ${AMAZON_PRICE}  ${product_link}
    Append To List    ${amazon_results}    ${items}
  END
  ${amazon_results}  Set Suite Variable  ${amazon_results}

Get Ebay Product List
  @{locator}  get webelements  ${EBAY_SEARCH_RESULTS_BLOCK}
  ${length}  get length   ${locator}
  ${ebay_results}=    Create List
  FOR    ${INDEX}    IN RANGE     1  ${length}+1
    ${present}=  Run Keyword And Return Status    get webelement   //*[@id="srp-river-results"]/ul/li[${INDEX}]//h3/span[@class='BOLD']
    ${name}=    run keyword if  ${present}  Get Text    //*[@id="srp-river-results"]/ul/li[${INDEX}]//h3/span[@class='BOLD']
    ...            ELSE  Get Text  //*[@id="srp-river-results"]/ul/li[${INDEX}]//h3
    ${product_link}=    get element attribute    //*[@id="srp-river-results"]/ul/li[${INDEX}]//a  href
    ${price}=  Get Text  //*[@id="srp-river-results"]/ul/li[${INDEX}]//*[@class='s-item__price']
    ${price}  Split String  ${price}  ${SPACE}to${SPACE}
    ${items}  Create List  EBAY  ${name}  ${price[0]}  ${product_link}
    Append To List    ${ebay_results}    ${items}
  END
  ${ebay_results}  Set Suite Variable  ${ebay_results}

Search on Amazon With Keyword
  [Arguments]  ${keyword_search}
  input text  ${AMAZON_SEARCH_TXT}  ${keyword_search}

Search on Ebay With Keyword
  [Arguments]  ${keyword_search}
  input text  ${EBAY_SEARCH_TXT}  ${keyword_search}

*** Variables ***
${AMAZON_PRICE}  ${EMPTY}