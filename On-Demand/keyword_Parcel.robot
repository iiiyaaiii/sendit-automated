*** Keywords ***

Set many Parcels      [Arguments]     ${parcel_amount}     ${parcel1}    ${parcel2}
  ${i} =  Set Variable		${0}
  ${j} =  Set Variable   ${1}
	:FOR  ${i}  IN RANGE  ${parcel_amount}
  \  ${i} =  Set Variable		${i+1}
  \  Run Keyword If 				${i} > ${parcel_amount} 			Exit For Loop
  \  Sleep  2s
  \  Select parcel          ${parcel1}
  \  Sleep  2s
  \  Select parcel          ${parcel2}
  \  Sleep  5s
  \  Click Element          ${add_more_parcel}
  \  Sleep  2s
  Execute Javascript     ${delete_parcel}.click()

Check send date time      [Arguments]     ${hour}     ${minute}
  ${present_date} =   	Get Current Date     result_format=%d
  ${present_month} =    Get Current Date     result_format=%m
  ${present_year} =    Get Current Date      result_format=%Y
  ${present_hour} =    Get Current Date     result_format=%I
  ${present_hour} =    Convert To Integer    ${present_hour}
  ${tmp_hour} =        Convert To Integer    ${hour}

  ${present_time}=   Run Keyword And Return Status    Should Be Equal    ${tmp_hour}   ${present_hour}
  ${pickup_hr}=   Run Keyword If      ${present_time} == True       Set Variable      ${tmp_hour+1}
  ...             ELSE IF             ${present_time} == False      Set Variable      ${tmp_hour}
  ${month} =           Convert To Integer         ${present_month}
  ${month} =           Set Variable          ${month+1}
  ${n_month} =          Convert To String         ${month}
  ${n_month} =        Run Keyword If         ${month} < 10    Set Variable    0${month}
  ${date_next_month} =       Set Variable         ${n_month}/${present_date}/${present_year}
  ${date_time_send} =        Set Variable     ${date_next_month} ${pickup_hr}:${minute}
  ${send_datetime} =    Get Text              ${summary_pickup_date}
  Should Contain       ${send_datetime}       ${date_time_send}

Check parcels summary detail    [Arguments]       ${parcel_no}    ${parcel_type}
  ${img_parcel_type} =        Run Keyword If      '${parcel_type}' == 'ID'
  ...                         Set Variable        ${img_parcel_ID}
  ...                         ELSE IF            '${parcel_type}' == 'DOCUMENT'
  ...                         Set Variable        ${img_parcel_Document}
  ...                         ELSE IF            '${parcel_type}' == 'MAILING'
  ...                         Set Variable        ${img_parcel_Mailing}
  ...                         ELSE IF             '${parcel_type}' == 'FOOD'
  ...                         Set Variable        ${img_parcel_Food}
  ...                         ELSE IF             '${parcel_type}' == 'RETURN'
  ...                         Set Variable        ${img_parcel_Return}
  ...                         ELSE IF             '${parcel_type}' == 'PURCHASE'
  ...                         Set Variable        ${img_parcel_Purchase}
  ...                         ELSE IF             '${parcel_type}' == 'CASH'
  ...                         Set Variable        ${img_parcel_Cash}
  ...                         ELSE IF             '${parcel_type}' == 'INSURANCE'
  ...                         Set Variable        ${img_parcel_Insurance}
  ${parcel_no} =              Convert To Integer      ${parcel_no}
  ${i} =                      Set Variable         ${parcel_no-1}
  Log To Console              ${i}

  Element Should Be Visible     $($('${element_parcel}')[${i}] '${img_parcel_type}')
  Element Should Be Visible     ${summary_parcel1}
  Element Should Be Visible     ${summary_parcel2}
  Element Should Be Visible     ${price-distance}
