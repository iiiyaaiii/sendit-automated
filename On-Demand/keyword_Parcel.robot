*** Keywords ***

Set many Parcels      [Arguments]     ${parcel_amount}     ${parcel1}    ${parcel2}
  ${i} =  Set Variable		${1}
	:FOR  ${index}  IN RANGE  ${parcel_amount}
  \  Run Keyword If 				'${parcel1}' != 'False' 		  Select parcel          ${parcel1}
  \  Run Keyword If 				'${parcel1}' == 'False' 		  Exit For Loop
  \  Run Keyword If 				'${parcel2}' != 'False' 		  Select parcel          ${parcel2}
  \  Run Keyword If 				'${parcel2}' == 'False' 		  Exit For Loop
	\  ${i} =  Set Variable		${i+1}
	\  Run Keyword If 				${i} > ${parcel_amount} 			Exit For Loop
  \  Click Element          ${add_more_parcel}
