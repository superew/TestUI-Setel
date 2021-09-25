*** Variables ***
${AMAZON_SEARCH_TXT}                //input[@id='twotabsearchtextbox']
${AMAZON_SEARCH_BTN}                //input[@value='Go']
${AMAZON_SEARCH_RESULTS_BLOCK}      //div[@data-component-type="s-search-result"]
${AMAZON_SEARCH_RESULTS_LABEL}      //h2/a/span
${AMAZON_SEARCH_RESULTS_PRICE}      //div[@data-component-type='s-search-result']//span[@class='a-price']/span[@class='a-offscreen']

${EBAY_SEARCH_TXT}                  //input[@id='gh-ac']
${EBAY_SEARCH_BTN}                  //input[@value='Search']
${EBAY_SEARCH_RESULTS_BLOCK}        //*[@id="srp-river-results"]/ul/li
${EBAY_SEARCH_RESULTS_LABEL}        //h3[@class='s-item__title']/*[@class='BOLD']
${EBAY_SEARCH_RESULTS_PRICE}
${EBAY_VIEW_MENU}                   //*[@class='expand-btn__cell']/*[@class='btn__icon']
${EBAY_CUSTOMIZE_SEARCH}            //*[contains(@class,'srp-view-options__customize')]
${EBAY_CUSTOMIZE_SEARCH_DIALOG}     //form//*[@class='lightbox-dialog__header']/h2[contains(text(),'Customize your search')]
${EBAY_CONVERT_VND}                 //form[@name='customizationForm']//*[contains(text(),'Convert prices to VND')]/input
${EBAY_APPLY_BTN}                   //form[@name='customizationForm']//input[@type='submit']