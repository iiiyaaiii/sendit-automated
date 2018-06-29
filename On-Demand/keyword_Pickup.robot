*** Keywords ***

Create Pickup location    [Arguments]     ${address}    ${hour}   ${minute}
  Wait Until Element Is Visible     ${pickup_tab}     30s
  Sleep  20s
  Input Text               ${pickup_location_input}       ${address}
  Click Element						${pickup_location_input}
  Sleep  10s
  Execute Javascript    	$($('${pickup_google_item}')[0]).click()
  Sleep  5s
  Click Element            ${pickup_time_input}
  Sleep  5s
  Element Should Be Visible         ${pickup_time_modal}
  Click Element											${nextmonth}
  Element Should Be Visible    			${selected_date}
  Click Element											${submit_datetime}
  Wait Until Element Is Visible			${clock} 				10s
  Click Element    				${hour}
  Sleep  1s
  Click Element						${submit_datetime}
  Sleep  1s
  Click Element						${minute}
  Click Element						${submit_datetime}
  Input Text							${sender_name}							${settinguser_name}
  Input Text							${sender_phone}							${user_phone}
  Input Text							${sender_email}							${settinguser_email}
  Input Text							${sender_comment}						18th floor
  Click Element    				${submit_pickup}
