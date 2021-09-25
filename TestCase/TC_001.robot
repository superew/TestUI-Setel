*** Settings ***
Documentation    Open Browser and navigate to Amazon
... 			 Run testcase command, store report on Results folder with timestamp: "robot --timestampoutputs -d Results TestCase/"
Library    SeleniumLibrary
Library    Collections
Library    String
Resource	../Resources/common_keyword.robot
Resource	../Resources/Locator/HomePageUI.robot
Library	 	../lib/cusLib.py

*** Variables ***
${BROWSER}  Chrome
${AMAZON_URL}  https://www.amazon.com/
${EBAY_URL}  https://www.ebay.com/

*** Test Cases ***
Step1: Open Browser and Navigate to Page
  Open Browser Before Test  ${AMAZON_URL}  ${BROWSER}
  Search on Amazon With Keyword  iphone 11
  click button  ${AMAZON_SEARCH_BTN}
  Get Amazon Product List
  quit browser after done

Step2: Open Browser and Navigate to Page
  Open Browser Before Test  ${EBAY_URL}  ${BROWSER}
  Search on Ebay With Keyword  iphone 11
  click button  ${EBAY_SEARCH_BTN}
  Turn off Convert prices to VND
  Get Ebay Product List
  quit browser after done

Step3: Combine Output From 2 Sites and Sort With Price
  ${product_list}  combine lists  ${amazon_results}  ${ebay_results}
  Log  ${product_list}
  sort_list_by_price  ${product_list}
  Log  ${product_list}