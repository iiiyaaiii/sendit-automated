*** Settings ***
Library					Selenium2Library
Suite Setup


*** Variables ***
${url_login}								  https://staging.customer.sendit.asia/th/2stage/login
${admin_username}							admin@sendit.asia
${admin_password}							12345678
#element login-home page
${url_2stage_activdelivery}		https://staging.customer.sendit.asia/th/2stage/parcels?activeStatusTab=ongoing&currentView
${css_login_modal}						css=div.login-container__loginform___2rEJe
${css_username}								//div[1]/div/div/div/div[1]/input
${css_password}								//div[1]/div/div/div/div[2]/input
${css_loginbtn}								//div[1]/div/div/div/div[3]/button
#Go to Scanner page
${css_Scannerbtn}							//div[1]/div/div/div[2]/ul/li[6]/a/i
${css_Readbtn}								//div/div/div[3]/div/div[2]/div/ul/li[1]/span/span
${css_Barcodeinput}						//div/div/div[3]/div/div[3]/div/div/input
${Barcodeinput}								TSW000700


${css_SetSizebtn}						//div/div/div[3]/div/div[2]/div/ul/li[2]/span/span
${css_PickUpbtn}						//div/div/div[3]/div/div[2]/div/ul/li[3]/span/span
${css_InBagbtn}							//div/div/div[3]/div/div[2]/div/ul/li[4]/span/span
${css_ReturnCourierbtn}			//div/div/div[3]/div/div[2]/div/ul/li[5]/span/span
${css_ScanEYCodebtn}				//div/div/div[3]/div/div[2]/div/ul/li[6]/span/span
${css_MoveBagbtn}						//div/div/div[3]/div/div[2]/div/ul/li[7]/span/span
${css_Chack-100btn}					//div/div/div[3]/div/div[2]/div/ul/li[8]/span/span
${css_ReturnedCustomerbtn}	//div/div/div[3]/div/div[2]/div/ul/li[9]/span/span
${css_AirwayBillbtn}				//div/div/div[3]/div/div[2]/div/ul/li[10]/span/span
${css_PrintBagbtn}					//div/div/div[3]/div/div[2]/div/ul/li[11]/span/span
${css_Deliverbtn}						//div/div/div[3]/div/div[2]/div/ul/li[12]/span/span

#SetSize
${SetSize_Oversize}										//div/div/div[3]/div/div[3]/div/div[1]/ul/li[3]
${SetSize_Setchel}										//div/div/div[3]/div/div[3]/div/div[1]/ul/li[4]
${css_SetSizeinput}										//div/div/div[3]/div/div[3]/div/div[2]/div/input

#Pick Up
${pickup_Customerbtn}									//div/div/div[3]/div/div[3]/div/div/div/div/span/span
${pickup_Customer}										//*[contains(text(),'TRUE SELECT')]
${css_Pickupinput}										//div/div/div[3]/div/div[3]/div/div[2]/input

#in Bag
${css_InBaginput}										//div/div/div[3]/div/div[3]/div/div/input

*** Keywords ***
Login to 2Stage by		    [Arguments]			${username}					${password}
	Open Browser							              ${url_login}					chrome
	Maximize Browser Window
	Element Should Be Visible				        ${css_login_modal}				5s
	Input Text								              ${css_username}					${username}
	Input Text							               	${css_password}					${password}
	Sleep  3s
	Click element  							            ${css_loginbtn}
	Sleep  1s
Go to Scanner page
	Wait Until Element Is Visible 			    ${css_Scannerbtn}  		5s
	Click element    						            ${css_Scannerbtn}
Read
	Wait Until Element Is Visible 			    ${css_Readbtn}  		5s
	Click element    						            ${css_Readbtn}
	Wait Until Element Is Visible 			    ${css_Barcodeinput}  		5s
	Click element    						            ${css_Barcodeinput}
	Input Text   														${css_Barcodeinput} 	${Barcodeinput}
	Press Key    														${css_Barcodeinput}    \\13

Set Size
	Wait Until Element Is Visible 			    ${css_SetSizebtn}	 		5s
	Click element    						            ${css_SetSizebtn}
	Wait Until Element Is Visible 			    ${SetSize_Oversize}	  		5s
	Click element    						            ${SetSize_Oversize}
	Sleep    3s
	Wait Until Element Is Visible 			    ${css_SetSizeinput}	  		5s
	Click element    						            ${css_SetSizeinput}
	Input Text   														${css_SetSizeinput}	 	${Barcodeinput}
	Press Key    														${css_SetSizeinput}	    \\13
	Sleep    3s
	Wait Until Element Is Visible 			    ${SetSize_Setchel}  		5s
	Click element    						            ${SetSize_Setchel}
	Sleep    3s
	Wait Until Element Is Visible 			    ${css_SetSizeinput}	  		5s
	Click element    						            ${css_SetSizeinput}
	Input Text   														${css_SetSizeinput}	 	${Barcodeinput}
	Press Key    														${css_SetSizeinput}	    \\13

Pick Up
	Wait Until Element Is Visible 			    ${css_PickUpbtn}  		5s
	Click element    						            ${css_PickUpbtn}
	Wait Until Element Is Visible 			    ${pickup_Customerbtn}	 		5s
	Click element    						            ${pickup_Customerbtn}
	Wait Until Element Is Visible 			    ${pickup_Customer}		 		5s
	Click element    						            ${pickup_Customer}

	Sleep    3s
	Wait Until Element Is Visible 			    ${css_Pickupinput}	  		5s
	Click element    						            ${css_Pickupinput}
	Input Text   														${css_Pickupinput}	 	${Barcodeinput}
	Press Key    														${css_Pickupinput}	    \\13

In Bag
	Wait Until Element Is Visible 			    ${css_InBagbtn}  		5s
	Click element    						            ${css_InBagbtn}

	Wait Until Element Is Visible 			    ${css_InBaginput}	  		5s
	Click element    						            ${css_InBaginput}
	Input Text   														${css_InBaginput}	 	${Barcodeinput}
	Press Key    														${css_InBaginput}	    \\13

Return Courier
	Wait Until Element Is Visible 			    ${css_ReturnCourierbtn}  		5s
	Click element    						            ${css_ReturnCourierbtn}
Scan EYCode
	Wait Until Element Is Visible 			    ${css_ScanEYCodebtn}  		5s
	Click element    						            ${css_ScanEYCodebtn}
Move Bag
	Wait Until Element Is Visible 			    ${css_MoveBagbtn}  		5s
	Click element    						            ${css_MoveBagbtn}
Chack-100
	Wait Until Element Is Visible 			    ${css_Chack-100btn}  		5s
	Click element    						            ${css_Chack-100btn}
Returned Customer
	Wait Until Element Is Visible 			    ${css_Chack-100btn}  		5s
	Click element    						            ${css_Chack-100btn}
Airway Bill
	Wait Until Element Is Visible 			    ${css_AirwayBillbtn}	 		5s
	Click element    						            ${css_AirwayBillbtn}
Print Bag
	Wait Until Element Is Visible 			    ${css_PrintBagbtn}	 		5s
	Click element    						            ${css_PrintBagbtn}
Deliver
	Wait Until Element Is Visible 			    ${css_Deliverbtn}		 		5s
	Click element    						            ${css_Deliverbtn}


*** Test Cases ***
2Stage website
      Login to 2Stage by						${admin_username}				${admin_password}
      Go to Scanner page
			Read
			Set Size
			Pick Up
			In Bag
			# Return Courier
			# Scan EYCode
			# Move Bag
			# Chack-100
			# Returned Customer
			# Airway Bill
			# Print Bag
			# Deliver
