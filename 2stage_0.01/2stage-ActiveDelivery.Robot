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
#Go to Bag Page
${css_ActiveDeliverybtn}          //div/div/div[2]/ul/li[1]/a/i
#Search Set View
${css_SetViewbtn}						//div/div/div[3]/div/div[1]/div[2]/a[2]/span
${css_Customerbtn}					//div/div/div[3]/div/div[1]/div[1]/div[2]/div/span/span
${Customer}									//*[contains(text(),'ADEN')]
${css_startDatebtn}					//div/div/div[3]/div/div[1]/span/div[1]/div[2]/div/div[1]/div[1]
${startDate}								//div/div/div[3]/div/div[1]/span/div[1]/div[2]/div/div[2]/div/div/div[2]/div[2]/div/div[2]/table/tbody/tr[1]/td[6]/button
${LastDate}									//div/div/div[3]/div/div[1]/span/div[1]/div[2]/div/div[2]/div/div/div[2]/div[2]/div/div[2]/table/tbody/tr[5]/td[6]/button
${css_ParcelSizebtn}				//div/div/div[3]/div/div[1]/span/div[2]/div[2]/div/span/span
${ParcelSize}								//*[contains(text(),'UNKNOWN')]
${css_Statusbtn}						//div/div/div[3]/div/div[1]/span/div[3]/div[2]/div/span/span
${Status}										//*[contains(text(),'READY')]
${css_Bagbtn}								//div/div/div[3]/div/div[1]/span/div[4]/div[2]/div/span/span
${Bag}											//*[contains(text(),'WERE')]
#Search Status View
${css_StatusViewbtn}				//div/div/div[3]/div/div[1]/div[2]/a[1]/span
${css_OnGoingbtn}						//div/div/div[3]/div/div[1]/div[1]/div[2]/button[1]/span
${css_Historybtn}						//div/div/div[3]/div/div[1]/div[1]/div[2]/button[2]/span
${css_Customerbtn2}					//div/div/div[3]/div/div[1]/div[2]/div[2]/div/span/span
${css_Statusbtn2}						//div/div/div[3]/div/div[1]/span/div[2]/div[2]/div/span/span

${css_REFRESHbtn}						//div/div/div[3]/div/div[1]/div[4]/a[3]/span


${css_Actionbtn}								//div/div/div[3]/div/div[1]/div[4]/a[4]/span
${css_Exportbtn}								//div/div/div[3]/div/div[1]/div[4]/ul/li[1]/a/span
${css_Opennewtapbtn}						//div/div/div[3]/div/div[1]/div[4]/ul/li[2]/a/span
${css_Customizecolumnsbtn}			//div/div/div[3]/div/div[1]/div[4]/ul/li[3]/a/span


${css_Viewclicklinkbtn}			//div/div/div[3]/div/div[4]/table/tbody/tr[1]/td[2]/a


#Customizecolumns
${css_ParcelGroupbtn}						//div/div/div[3]/div/div[5]/div/div[1]/div[1]/label[3]/input
${css_Savebtn}									//div/div/div[3]/div/div[5]/div/div[2]/button
${css_Xbtn}											//div/div/div[3]/div/div[5]/div/button/i

#edit
${css_editbtn}									//div/div/div[3]/div/div[4]/table/tbody/tr[1]/td[15]/button/i
${css_edit1btn}									//div/div/div[3]/div/div[5]/div/div[2]/div[2]/i
${css_edit1Statusbtn}						//div/div/div[3]/div/div[5]/div/div[2]/div[2]/div[1]/div[1]/div/div/span/span
${edit1Status}									//*[contains(text(),'READY_TO_PICK_UP')]
${css_edit1inputnote}									//div/div/div[3]/div/div[5]/div/div[2]/div[2]/div[1]/div[2]/input
${edit1inputnote}											test
${css_edit1Savebtn}									//div/div/div[3]/div/div[5]/div/div[2]/div[2]/div[2]/div/button[1]

${css_editSenderbtn}						//div/div/div[3]/div/div[5]/div/div[2]/table[1]/tbody/tr[1]/td/i

${css_editSenderAddress}				//div/div/div[3]/div/div[5]/div/div[2]/div[3]/div[1]/div[1]/textarea


${editSenderAddress}				10/0095 Soi Sukhumvit 13 (Sang Chan), Khlong Toei Nuea, Watthana, Bangkok 10110, Bangkok



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
Go to Active Delivery page
	Wait Until Element Is Visible 			    ${css_ActiveDeliverybtn}  		5s
	Click element    						            ${css_ActiveDeliverybtn}

search by Status View
	Wait Until Element Is Visible 			    ${css_StatusViewbtn}	  		5s
	Click element    						            ${css_StatusViewbtn}
	Sleep    5S
	Wait Until Element Is Visible 			    ${css_OnGoingbtn}	  		5s
	Click element    						            ${css_OnGoingbtn}
	Sleep    5S
	Wait Until Element Is Visible 			    ${css_Historybtn}	  		5s
	Click element    						            ${css_Historybtn}
	Sleep    5S

	Wait Until Element Is Visible 			    ${css_Customerbtn2}	  		5s
	Click element    						            ${css_Customerbtn2}
	Wait Until Element Is Visible 			    ${Customer}	  		5s
	Click element    						            ${Customer}
	Wait Until Element Is Visible 			    ${css_startDatebtn}		  		5s
	Click element    						            ${css_startDatebtn}
	Wait Until Element Is Visible 			    ${startDate}		  		5s
	Click element    						            ${startDate}
	Wait Until Element Is Visible 			    ${LastDate}		  		5s
	Click element    						            ${LastDate}
	Wait Until Element Is Visible 			    ${css_Statusbtn2}			  		5s
	Click element    						            ${css_Statusbtn2}
	Wait Until Element Is Visible 			    ${Status}			  		5s
	Click element    						            ${Status}
	Wait Until Element Is Visible 			    ${css_REFRESHbtn}			  		5s
	Click element    						            ${css_REFRESHbtn}




search by Set View
	Wait Until Element Is Visible 			    ${css_SetViewbtn}	  		5s
	Click element    						            ${css_SetViewbtn}
	Wait Until Element Is Visible 			    ${css_Customerbtn}	  		5s
	Click element    						            ${css_Customerbtn}
	Wait Until Element Is Visible 			    ${Customer}	  		5s
	Click element    						            ${Customer}
	Wait Until Element Is Visible 			    ${css_startDatebtn}		  		5s
	Click element    						            ${css_startDatebtn}
	Wait Until Element Is Visible 			    ${startDate}		  		5s
	Click element    						            ${startDate}
	Wait Until Element Is Visible 			    ${LastDate}		  		5s
	Click element    						            ${LastDate}
	# Wait Until Element Is Visible 			    ${css_ParcelSizebtn}		  		5s
	# Click element    						            ${css_ParcelSizebtn}
	# Wait Until Element Is Visible 			    ${ParcelSize}			  		5s
	# Click element    						            ${ParcelSize}
	Wait Until Element Is Visible 			    ${css_Statusbtn}			  		5s
	Click element    						            ${css_Statusbtn}
	Wait Until Element Is Visible 			    ${Status}			  		5s
	Click element    						            ${Status}
	Wait Until Element Is Visible 			    ${css_Bagbtn}		  		5s
	Click element    						            ${css_Bagbtn}
	Wait Until Element Is Visible 			    ${Bag}		  		5s
	Click element    						            ${Bag}
	Wait Until Element Is Visible 			    ${css_REFRESHbtn}			  		5s
	Click element    						            ${css_REFRESHbtn}

Action
		Wait Until Element Is Visible 			    ${css_Actionbtn}	  		5s
		Click element    						            ${css_Actionbtn}

Export
	Wait Until Element Is Visible 			    ${css_Exportbtn}	  		5s
	Click element    						            ${css_Exportbtn}

Open new tap
	Wait Until Element Is Visible 			    ${css_Opennewtapbtn}	  		5s
	Click element    						            ${css_Opennewtapbtn}

Customize columns
	Wait Until Element Is Visible 			    ${css_Customizecolumnsbtn}	  		5s
	Click element    						            ${css_Customizecolumnsbtn}
	Wait Until Element Is Visible 			    ${css_ParcelGroupbtn}	  		5s
	Click element    						            ${css_ParcelGroupbtn}
	Wait Until Element Is Visible 			    ${css_Savebtn}	  		5s
	Click element    						            ${css_Savebtn}


	Wait Until Element Is Visible 			    ${css_Actionbtn}	  		5s
	Click element    						            ${css_Actionbtn}

	Wait Until Element Is Visible 			    ${css_Customizecolumnsbtn}	  		5s
	Click element    						            ${css_Customizecolumnsbtn}
	Wait Until Element Is Visible 			    ${css_ParcelGroupbtn}	  		5s
	Click element    						            ${css_ParcelGroupbtn}
	Wait Until Element Is Visible 			    ${css_Xbtn}	  		5s
	Click element    						            ${css_Xbtn}

View click link
		Wait Until Element Is Visible 			    ${css_Viewclicklinkbtn}		  		5s
		Click element  													${css_Viewclicklinkbtn}

Edit
		Wait Until Element Is Visible 			    ${css_editbtn}		  		5s
		Click element  													${css_editbtn}


Edit 1
		Wait Until Element Is Visible 			    ${css_edit1btn}		  		5s
		Click element  													${css_edit1btn}
		Wait Until Element Is Visible 			    ${css_edit1St atusbtn}		  		5s
		Click element  													${css_edit1Statusbtn}
		# Wait Until Element Is Visible 			    ${edit1Status}			  		5s
		# Sleep    3s
		# Click element  													${edit1Status}
		Wait Until Element Is Visible 			    ${css_edit1inputnote}		  		5s
		Click element  													${css_edit1inputnote}
		Input Text                              ${css_edit1inputnote}   ${edit1inputnote}
		Wait Until Element Is Visible 			    ${css_edit1Savebtn}			  		5s
		Click element  													${css_edit1Savebtn}


Edit SENDER
		Wait Until Element Is Visible 			    ${css_editSenderbtn}			  		5s
		Click element  													${css_editSenderbtn}
		Wait Until Element Is Visible 			    ${css_editSenderAddress}		  		5s
		Click element  													${css_editSenderAddress}
		Input Text    													${css_editSenderAddress}				${editSenderAddress}

Edit RECIPIENT



*** Test Cases ***
# 2Stage website Active Delivery
#       Login to 2Stage by						${admin_username}				${admin_password}
#       Go to Active Delivery page
# 			search by Set View

# 2Stage website Active Delivery
# 			Login to 2Stage by						${admin_username}				${admin_password}
# 			Go to Active Delivery page
# 			search by Status View

# 2Stage website Active Delivery : Action Menu
# 						Login to 2Stage by						${admin_username}				${admin_password}
# 						Go to Active Delivery page
# 						search by Status View
# 						Action
# 						Export
# 						Action
# 						Open new tap
# 						Action
# 						Customize columns
# 						View click link


2Stage website Active Delivery : Edit
						Login to 2Stage by						${admin_username}				${admin_password}
						Go to Active Delivery page
						search by Status View
						Edit
						Edit SENDER
