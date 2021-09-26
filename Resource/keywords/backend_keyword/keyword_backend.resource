*** Keywords ***
Verify Response Body Should Success with Code : True
  [Arguments]  ${res}
  run keyword and continue on failure  log  ${res.content}
  ${success} =  Set Variable  ${res.json()}
  ${success} =  Get From Dictionary  ${success}  success
  log  ${success}
  Should be equal as strings  ${success}  True