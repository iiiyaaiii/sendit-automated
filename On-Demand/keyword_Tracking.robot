*** Keywords ***

Check search results display correctly     [Arguments]     ${element}       ${input}
  ${i} =  Set Variable		${1}
  ${results} =      Get Element Count    ${results_list}
  ${j} =  Set Variable		${0}
  :FOR  ${index}  IN RANGE  ${results}
	\  Click Element          ${result_item}[${i}]/a
  \  Sleep  10s
  \  ${recipient_element} =      Get Element Count    ${element}
  \  Loop to check recipient detail     ${recipient_element}      ${input}
	\  ${i} =  Set Variable		${i+1}
	\  Run Keyword If 				${i} > ${results} 			Exit For Loop


Loop to check recipient detail      [Arguments]     ${recipient_element}      ${input}
  ${j} =  Set Variable		${0}
  :FOR  ${index}  IN RANGE  ${recipient_element}
  \  ${recipient_name} =   Execute Javascript    	return $($('${dropoff_recipient_name}')[${j}]).text()
  \  Should Contain        ${recipient_name}       ${input}
  \  ${j} =  Set Variable		${j+1}
  \  Run Keyword If 				${j} >= ${recipient_element} 			Exit For Loop

Check no results found
  Element Should Be Visible    ${noorder_element}
  Element Text Should Be      ${noorder_element}        ${no_order_message}
  Element Text Should Be      ${all_loaded_element}     ${all_loaded_message}
