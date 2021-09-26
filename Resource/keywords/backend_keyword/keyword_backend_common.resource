*** Keywords ***

Create Session and Prepare Header
  [Arguments]  ${session_name}  ${end_point}  ${headers}
  Create Session  ${session_name}  ${end_point}  headers=${headers}

Verify Status Code Should be 200 OK
  [Arguments]  ${res}
  run keyword and continue on failure  log  ${res.content}
  Should be equal as strings  ${res.status_code}  200