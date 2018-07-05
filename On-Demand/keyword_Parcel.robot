*** Keywords ***

Set many Parcels      [Arguments]     ${parcel_amount}     ${parcel1}    ${parcel2}
  ${i} =  Set Variable		${1}
	:FOR  ${index}  IN RANGE  ${parcel_amount}
  \  Select parcel          ${parcel1}
  \  Select parcel          ${parcel2}
	\  ${i} =  Set Variable		${i+1}
	\  Run Keyword If 				${i} > ${parcel_amount} 			Exit For Loop
  \  Click Element          ${add_more_parcel}
  \  Sleep  2s

Check send date time      [Arguments]     ${hour}     ${minute}
  ${present_date} =   	Get Current Date     result_format=%d
  ${present_month} =    Get Current Date     result_format=%m
  ${present_year} =    Get Current Date      result_format=%Y
  ${month} =           Convert To Integer         ${present_month}
  ${month} =           Set Variable          ${month+1}
  ${n_month} =          Convert To String         ${month}
  ${n_month} =        Run Keyword If         ${month} < 10    Set Variable    0${month}
  ${date_next_month} =       Set Variable         ${n_month}/${present_date}/${present_year}
  ${date_time_send} =        Set Variable     ${date_next_month} ${hour}:${minute}

  Log To Console        ${date_next_month}
  ${send_datetime} =    Get Text              css=div[ng-hide="vm.sendImmediately"]
  Should Contain       ${send_datetime}       ${date_time_send}
