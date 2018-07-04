*** Keywords ***

Create Pickup location    [Arguments]     ${address}
  Sleep  20s
  Wait Until Element Is Visible        ${pickup_location_input}   5s
  Input Text               ${pickup_location_input}       ${address}
  Click Element						${pickup_location_input}
  Sleep  10s
  Execute Javascript    	$($('${pickup_google_item}')[0]).click()
  Sleep  5s

Set pickup date next month
  Click Element            ${pickup_time_input}
  Sleep  5s
  Element Should Be Visible         ${pickup_time_modal}
  Click Element											${nextmonth}
  Element Should Be Visible    			${selected_date}
  Click Element											${submit_datetime}

Set current time
  	${date} =		Get Current Date	UTC
  	Log To Console    							${date}
  	${hr}=   	Get Current Date   result_format=%H
  	${min}=   	Get Current Date   result_format=%M
    Wait Until Element Is Visible			${clock} 				10s
    Click Element						${submit_datetime}
    Click Element						${submit_datetime}

Set pickup time        [Arguments]       ${input_hr}       ${input_min}
  Wait Until Element Is Visible			${clock} 				10s
  ${hour} =               Run Keyword If    ${input_hr} < 12      Set Variable    ${hr_beforenoon}
  ...                     ELSE IF           ${input_hr} >= 12     Set Variable    ${hr_afternoon}
  Click Element    				${hour}-${input_hr}
  Sleep  3s
  Click Element						${submit_datetime}
  Sleep  5s
  Click Element						${minute}-${input_min}
  Sleep  3s
  ${present} =  Run Keyword And Return Status    Element Should Be Visible   ${submit_datetime}
  Run Keyword If    ${present}    Click Element		${submit_datetime}

Complete sender details
  Input Text							${sender_name}							${settinguser_name}
  Input Text							${sender_phone}							${user_phone}
  Input Text							${sender_email}							${settinguser_email}
  Input Text							${sender_comment}						${user_pickup_comment} 
