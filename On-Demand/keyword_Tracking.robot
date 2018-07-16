*** Keywords ***

Check search results display correctly     [Arguments]     ${input}
  ${i} =  Set Variable		${1}
  ${results} =      Get Element Count    css=.order-list

  :FOR  ${index}  IN RANGE  ${results}
	\  Click Element            //*[@id="list-view"]/div/ul/li[${i}]/a
  \  Sleep  2s
  # \  Execute Javascript    	$('${pickup_google_item}').click()
  # \  Sleep  2s
  # \  Execute Javascript               $(${contact_person_element}[${i-1}]).click()
  # \  Execute Javascript               $(${contact_person_element}[${i-1}]).val("${contact_name${i}}")
  # \  Execute Javascript               $(${phone_number_element}[${i-1}]).val("${contact_phone${i}}")
  # \  Run Keyword If 				'${parcel1}' != 'False' 		  Select parcel          ${parcel1}
  # \  Run Keyword If 				'${parcel1}' == 'False' 		  Exit For Loop
  # \  Run Keyword If 				'${parcel2}' != 'False' 		  Select parcel          ${parcel2}
  # \  Run Keyword If 				'${parcel2}' == 'False' 		  Exit For Loop
	\  ${i} =  Set Variable		${i+1}
	\  Run Keyword If 				${i} > ${results} 			Exit For Loop
  # \  Click Element                   ${add_more_dropoff}
