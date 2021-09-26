*** Variables ***
${ZIPMEX_URL_TRADE}  https://trade.zipmex.com/global/trade/
${locate_USD}  xpath=//*[@id="root"]/div[1]/div[2]/div[1]/div[1]/div/div[2]/div[1]/div[1]/div[1]
${locate_SGD}  xpath=//*[@id="root"]/div[1]/div[2]/div[1]/div[1]/div/div[2]/div[1]/div[1]/div[2]
${locate_USDT}  xpath=//*[@id="root"]/div[1]/div[2]/div[1]/div[1]/div/div[2]/div[1]/div[1]/div[3]

${locate_input_quotecurrency}  xpath=//*[@id="root"]/div[1]/div[2]/div[1]/div[1]/div/div[2]/div[1]/form/div/div/input
${locate_list_result}  xpath=//*[@id="root"]/div[1]/div[2]/div[1]/div[1]/div/div[2]/div[1]/div[2]/div/div[2]/div[1]/div

${localte_bestprice_buying}  xpath=//*[@id="root"]/div[1]/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div/div/div[2]/div[1]/div/div[7]/div[3]/div[1]
${localte_bestprice_selling}  xpath=//*[@id="root"]/div[1]/div[2]/div[2]/div[1]/div[1]/div/div[2]/div/div/div/div[2]/div[3]/div[1]/div[3]/div[1]

${locate_input_limitPrice}  xpath=//*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[1]/div[1]/div[1]/div/div/div[2]/input
${locate_input_Amount}  xpath=//*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[1]/div[1]/div[2]/div/div/div[2]/input
${locate_input_limitPrice_selling}  //*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[2]/div[1]/div[1]/div/div/div[2]/input
${locate_input_Amount_selling}  xpath=//*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[2]/div[1]/div[2]/div/div/div[2]/input

${locate_totalUSD_buying}  xpath=//*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[1]/div[1]/div[4]/div/div/div[2]/input
${locate_totalUSD_selling}  xpath=//*[@id="root"]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/form[2]/div[1]/div[4]/div/div/div[2]/input