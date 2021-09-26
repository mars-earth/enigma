*** Settings ***
Resource  ../../../Resource/common_lib/common_lib.resource
Resource  ../../../Resource/common_keyword/common_keyword.resource
Resource  ../../../Resource/variables/web_ui_variable/variable_webui.resource
Resource  ../../../Resource/variables/backend_variable/variable_backend.resource
Suite Setup  Begin ZipMex Test
Force Tags  getprices  regression  !stat_ui  !stat_ui_zipmex

*** Test Cases ***
1 - Get Best price for Buy and Sell
  [Documentation]   ...
  ...  Test Case#1 Web UI
  ...  1. Select a Instrument USDTUSD
  ...  2. Get the best price to buy. Then adjust the price a bit
  ...       new price = price + 0.1%
  ...  3. Input amount = 1.00
  ...  4. Get the Total (USD) value
  ...  5. Then save the value into a variable and print into the console

  Select Base Currency  USD
  Search for select pair currency (Quote Currency)  USDT
  Select Best Price by Adjust for Buying and Input Amount
  Select Best Price by Adjust for Selling and Input Amount

2 - RESTful API (Get Price)
  [Documentation]  ...
  ...  Test Case#2 RESTful API
  ...  Create a automation test scripts to get the value from this API endpoint:
  ...  https://public-api.zipmex.net/api/v1.0/summary
  ...  Then write the value to log file or log to console as markdown format.

  &{headers} =  create dictionary  requestid=try_request
  Create Session and Prepare Header  getPrice  ${ZIPMEX_END_POINT}  ${headers}
  ${res}  get request  getPrice  summary
  log  ${res}
  Verify Status Code Should be 200 OK  ${res}
  Verify Response Body Should Success with Code : True  ${res}

  ${json} =  Set Variable  ${res.json()}
  ${data} =  Get From Dictionary  ${json}  data
  log to console  ...
  log to console  Zipmex market cap
  log to console  | instrument | last_price | lowest_24hr | highest_24hr |
  log to console  |:----------------------------------------------------:|
  FOR  ${i}  IN  &{data}
    log to console  ${SPACE}
    log to console  |${SPACE}${SPACE}${SPACE}${SPACE}${i}[0]${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${i}[1][last_price]${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${i}[1][lowest_24hr]${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${i}[1][highest_24hr]
  END