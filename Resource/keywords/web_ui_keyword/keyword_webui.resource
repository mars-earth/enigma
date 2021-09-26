
*** Keyword ***
Select Base Currency
  [Arguments]  ${base_currency}
  Run Keyword If  '${base_currency}'=='USD'  Fill-in base currency  ${locate_USD}
  ...  ELSE IF  '${base_currency}'=='SGD'  Fill-in base currency  ${locate_SGD}
  ...  ELSE IF  '${base_currency}'=='USDT'  Fill-in base currency  ${locate_USDT}

Fill-in base currency
  [Arguments]  ${basecurrency_locator}
  Wait Until Element Is Visible  ${basecurrency_locator}  10s
  Click Element  ${basecurrency_locator}

Search for select pair currency (Quote Currency)
  [Arguments]  ${quote_currency}
  Input Text  ${locate_input_quotecurrency}  ${quote_currency}
  Wait Until Element Is Visible  ${locate_list_result}  10s
  Click Element  ${locate_list_result}

Select Best Price by Adjust for Buying and Input Amount
  Wait Until Element Is Visible  ${localte_bestprice_buying}
  ${current_price}  Get Text  ${localte_bestprice_buying}
  log  ${current_price}
  ${current_price}  Convert To Number  ${current_price}
  ${percent}  Evaluate  ${current_price} * 0.001
  log  ${percent}
  ${adjust_price}  Evaluate  ${current_price} + ${percent}
  log  ${adjust_price}
  ${adjust_price}  Convert to String  ${adjust_price}

  #Clear Text and Input Best Price
  Click Element  ${locate_input_limitPrice}
  Execute Javascript  document.getElementsByName("limitPrice")[0].value = "";
  Input Text  ${locate_input_limitPrice}  ${adjust_price}

  #Clear Text and Input Amount
  Click Element  ${locate_input_Amount}
  Execute Javascript  document.getElementsByName("quantity")[0].value = "";
  ${buy_amount}  Set Variable  1
  Input Text  ${locate_input_Amount}  ${buy_amount}

  #Get Total USD Buying
  ${total_USD_buying}  Get Value  ${locate_totalUSD_buying}
  log  ${total_USD_buying}

  #Print Buying Side
  log to console  I Buy ....
  log to console  Trade USDTUSD
  log to console  with price = ${adjust_price}
  log to console  with amount = ${buy_amount}
  log to console  Total (USD) = ${total_USD_buying}


Select Best Price by Adjust for Selling and Input Amount
  Wait Until Element Is Visible  ${localte_bestprice_selling}
  Click Element  ${localte_bestprice_selling}
  ${current_price_selling}  Get Text  ${localte_bestprice_selling}
  log  ${current_price_selling}
  ${current_price_selling}  Convert To Number  ${current_price_selling}
  ${percent}  Evaluate  ${current_price_selling} * 0.001
  log  ${percent}
  ${adjust_price_selling}  Evaluate  ${current_price_selling} - ${percent}
  log  ${adjust_price_selling}
  ${adjust_price_selling}  Convert to String  ${adjust_price_selling}

  #Clear Text and Input Best Price (Selling)
  Click Element  ${locate_input_limitPrice_selling}
  Execute Javascript  document.getElementsByName("limitPrice")[1].value = "";
  Input Text  ${locate_input_limitPrice_selling}  ${adjust_price_selling}

  #Clear Text and Input Amount (Selling)
  Click Element  ${locate_input_Amount_selling}
  Execute Javascript  document.getElementsByName("quantity")[1].value = "";
  ${sell_amount}  Set Variable  1
  Input Text  ${locate_input_Amount_selling}  ${sell_amount}

  #Get Total USD Selling
  ${total_USD_selling}  Get Value  ${locate_totalUSD_selling}
  log  ${total_USD_selling}

  #Print Buying Side
  log to console  I Sell ....
  log to console  Trade USDTUSD
  log to console  with price = ${adjust_price_selling}
  log to console  with amount = ${sell_amount}
  log to console  Total (USD) = ${total_USD_selling}
