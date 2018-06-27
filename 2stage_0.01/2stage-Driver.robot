*** Settings ***
Library					Selenium2Library
Suite Setup


*** Variables ***
${url_login}								https://staging.customer.sendit.asia/th/2stage/login
${admin_username}							admin@sendit.asia
${admin_password}							12345678
#element login-home page
${url_2stage_activdelivery}					https://staging.customer.sendit.asia/th/2stage/parcels?activeStatusTab=ongoing&currentView
${css_login_modal}						css=div.login-container__loginform___2rEJe
${css_username}								//div[1]/div/div/div/div[1]/input
${css_password}								//div[1]/div/div/div/div[2]/input
${css_loginbtn}								//div[1]/div/div/div/div[3]/button
#Go to Driver Page
${css_Driverbtn}              //div/div/div[2]/ul/li[12]/a/i
#search Driver
${css_searchDriver}  					//div/div/div[3]/div/div[1]/div[2]/div/input


#New Driver btn
${css_NewDriverbtn}						//div/div/div[3]/div/div[1]/div[1]/a/span
#Edit Driver btn
${css_editDriverbtn}					//div/div/div[3]/div/div[3]/div/div/div/div/div[3]/div/div/div/div[2]/div/div[10]/div/div/div/div/a/button/span
#Delete Driver btn
${css_DeleteDriverbtn}					//div/div/div[3]/div/div[3]/div/div/div/div/div[3]/div/div/div/div[2]/div/div[11]/div/div/div/div/button/span
#Reset Driver btn
${css_resetDriverbtn}					//div/div/div[3]/div/div[3]/div/div/div/div/div[3]/div/div/div/div[2]/div/div[12]/div/div/div/div/button/span


#PERSONAL INFO Data
${css_DrivernameTH}								//div/div/div[3]/div/div[3]/div[1]/form/div[1]/div[1]/div/input
${css_DriverlastTH}								//div/div/div[3]/div/div[3]/div[1]/form/div[1]/div[2]/div/input
${css_DrivernicknameTH}						//div/div/div[3]/div/div[3]/div[1]/form/div[2]/div[1]/div/input
${css_DrivernameENG}							//div/div/div[3]/div/div[3]/div[1]/form/div[3]/div[1]/div/input
${css_DriverlastENG}							//div/div/div[3]/div/div[3]/div[1]/form/div[3]/div[2]/div/input
${css_DrivernicknameENG}					//div/div/div[3]/div/div[3]/div[1]/form/div[4]/div[1]/div/input

${css_Driverbirthdaybtn}							//div/div/div[3]/div/div[3]/div[1]/form/div[5]/div[1]/div/div[1]/div/div/input
${css_Driverbirthday_Monthbtn}				//div/div/div[3]/div/div[3]/div[1]/form/div[5]/div[1]/div/div[1]/div/div[2]/div/div[2]/div[1]/div[2]/div[1]/select
${css_Driverbirthday_Month}						//*[contains(text(),'February')]
${css_Driverbirthday_Yearbtn}					//div/div/div[3]/div/div[3]/div[1]/form/div[5]/div[1]/div/div[1]/div/div[2]/div/div[2]/div[1]/div[2]/div[2]/select
${css_Driverbirthday_Year}						//*[contains(text(),'1991')]
# ${css_Driverbirthday_Daybtn}					//div/div/div[3]/div/div[3]/div[1]/form/div[5]/div[1]/div/div[1]/div/div[2]/div/div[2]
${css_Driverbirthday_Day}						//div/div/div[3]/div/div[3]/div[1]/form/div[5]/div[1]/div/div[1]/div/div[2]/div/div[2]/div[2]/div[1]/div[7]

${css_DrivercitizenId}						//div/div/div[3]/div/div[3]/div[1]/form/div[5]/div[2]/div/input
${css_DriverPhone}								//div/div/div[3]/div/div[3]/div[1]/form/div[6]/div[1]/div/input
${css_DriversendidPhone}					//div/div/div[3]/div/div[3]/div[1]/form/div[6]/div[2]/div/input
${css_COURIERbtn}								//div/div/div[3]/div/div[3]/div[2]/div/div[1]/div/div[2]/div/div/div[1]
${css_COURIER}										//*[contains(text(),'DHL')]


#PERSONAL INFO Data New Driver
${DrivernameTH}								อันนา
${DriverlastTH}								ณ ทองหล่อ
${DrivernicknameTH}						นานา
${DrivernameENG}							anna
${DriverlastENG}							Na thonglor
${DrivernicknameENG}					nana
${DrivercitizenId}						1222664444122
${DriverPhone}								09898622220
${DriversendidPhone}					09892222222


#PERSONAL INFO Data New Driver Edit
${DrivernameTHedit}								อันนา
${DriverlastTHedit}								ณ สีลม
${DrivernicknameTHedit}						นานา
${DrivernameENGedit}							anna
${DriverlastENGedit}							Na silom
${DrivernicknameENGedit}					nana
${DrivercitizenIdedit}						1222664444122
${DriverPhoneedit}								09898622220
${DriversendidPhoneedit}					09892222222


${css_Createbtn} 						//div/div/div[3]/div/div[4]/div/div[2]/button
${css_Canclebtn} 					//div/div/div[3]/div/div[4]/div/div[1]/button

#Reset password
${css_ResetpasswordCanclebtn} 								//div/div/div[3]/div/div[1]/div/button/i
${css_ResetpasswordViewbtn}										//div/div/div[3]/div/div[1]/div/div/div[2]/div[1]/div[2]/i
${css_ResetpasswordinputNewPassword}					//div/div/div[3]/div/div[1]/div/div/div[2]/div[1]/div[1]/input
${css_ResetpasswordChangebtn}									//div/div/div[3]/div/div[1]/div/div/div[2]/div[2]/button
${NewPassword}																12345678



*** Keywords ***
Login to 2Stage by		    [Arguments]			${username}					${password}
	Open Browser							              ${url_login}					chrome
	Maximize Browser Window
	Element Should Be Visible				        ${css_login_modal}				10s
	Input Text								              ${css_username}					${username}
	Input Text							               	${css_password}					${password}
	Sleep  3s
	Click element  							            ${css_loginbtn}
	Sleep  1s
Go to Driver page
	Wait Until Element Is Visible 			    ${css_Driverbtn}		5s
	Click element    						            ${css_Driverbtn}
Search Driver
	Wait Until Element Is Visible 			    ${css_searchDriver}  		5s
	Click element    						            ${css_searchDriver}
	Input Text    													${css_searchDriver}  		${DrivernameTH}
	Wait Until Element Is Visible 			    ${css_searchDriver}  		5s
	Sleep    5s
	Clear Element Text 											${css_searchDriver}
	Sleep    5s
	Click element    						            ${css_searchDriver}
	Input Text   														${css_searchDriver}  		${DrivercitizenId}

New Driver
	Wait Until Element Is Visible 			    ${css_NewDriverbtn}	  		5s
	Click element   											  ${css_NewDriverbtn}

	Wait Until Element Is Visible 			    ${css_DrivernameTH}	   		5s
	Click element														${css_DrivernameTH}
	Input Text   														${css_DrivernameTH}	 		${DrivernameTH}
	Wait Until Element Is Visible 			    ${css_DriverlastTH}	   		5s
	Click element														${css_DriverlastTH}
	Input Text   														${css_DriverlastTH}	 		${DriverlastTH}
	Wait Until Element Is Visible 			    ${css_DrivernicknameTH}	   		5s
	Click element														${css_DrivernicknameTH}
	Input Text   														${css_DrivernicknameTH}	 		${DrivernicknameTH}

	Wait Until Element Is Visible 			    ${css_DrivernameENG}	   		5s
	Click element														${css_DrivernameENG}
	Input Text   														${css_DrivernameENG}	 		${DrivernameENG}
	Wait Until Element Is Visible 			    ${css_DriverlastENG}	   		5s
	Click element														${css_DriverlastENG}
	Input Text   														${css_DriverlastENG}	 		${DriverlastENG}
	Wait Until Element Is Visible 			    ${css_DrivernicknameENG}	   		5s
	Click element														${css_DrivernicknameENG}
	Input Text   														${css_DrivernicknameENG}	 		${DrivernicknameENG}

	Wait Until Element Is Visible 			    ${css_Driverbirthdaybtn}		   				5s
	Click element														${css_Driverbirthdaybtn}
	Wait Until Element Is Visible 			    ${css_Driverbirthday_Monthbtn}		   	5s
	Click element														${css_Driverbirthday_Monthbtn}
	Wait Until Element Is Visible 			    ${css_Driverbirthday_Month}		   			5s
	Click element														${css_Driverbirthday_Month}
	Wait Until Element Is Visible 			    ${css_Driverbirthday_Yearbtn}		   		5s
	Click element														${css_Driverbirthday_Yearbtn}
	Wait Until Element Is Visible 			    ${css_Driverbirthday_Year}		   			5s
	Click element														${css_Driverbirthday_Year}
	Wait Until Element Is Visible 			    ${css_Driverbirthday_Day}		   			5s
	Click element														${css_Driverbirthday_Day}



	Wait Until Element Is Visible 			    ${css_DrivercitizenId}	   		5s
	Click element														${css_DrivercitizenId}
	Input Text   														${css_DrivercitizenId}	 		${DrivercitizenId}
	Wait Until Element Is Visible 			    ${css_DriverPhone}	   		5s
	Click element														${css_DriverPhone}
	Input Text   														${css_DriverPhone}	 				${DriverPhone}
	Wait Until Element Is Visible 			    ${css_DriversendidPhone}	   		5s
	Click element														${css_DriversendidPhone}
	Input Text   														${css_DriversendidPhone}	 		${DriversendidPhone}
	Wait Until Element Is Visible 			    ${css_COURIERbtn}		   		5s
	Click element														${css_COURIERbtn}
	Wait Until Element Is Visible 			    ${css_COURIER}		   		5s
	Click element														${css_COURIER}

Edit Driver
		Wait Until Element Is Visible 			    ${css_editDriverbtn}	  		5s
		Click element   											  ${css_editDriverbtn}

		Wait Until Element Is Visible 			    ${css_DrivernameTH}	   		5s
		Click element														${css_DrivernameTH}
		Input Text   														${css_DrivernameTH}	 		${DrivernameTHedit}
		Wait Until Element Is Visible 			    ${css_DriverlastTH}	   		5s
		Click element														${css_DriverlastTH}
		Input Text   														${css_DriverlastTH}	 		${DriverlastTHedit}
		Wait Until Element Is Visible 			    ${css_DrivernicknameTH}	   		5s
		Click element														${css_DrivernicknameTH}
		Input Text   														${css_DrivernicknameTH}	 		${DrivernicknameTHedit}

		Wait Until Element Is Visible 			    ${css_DrivernameENG}	   		5s
		Click element														${css_DrivernameENG}
		Input Text   														${css_DrivernameENG}	 		${DrivernameENGedit}
		Wait Until Element Is Visible 			    ${css_DriverlastENG}	   		5s
		Click element														${css_DriverlastENG}
		Input Text   														${css_DriverlastENG}	 		${DriverlastENGedit}
		Wait Until Element Is Visible 			    ${css_DrivernicknameENG}	   		5s
		Click element														${css_DrivernicknameENG}
		Input Text   														${css_DrivernicknameENG}	 		${DrivernicknameENGedit}

		Wait Until Element Is Visible 			    ${css_Driverbirthdaybtn}		   				5s
		Click element														${css_Driverbirthdaybtn}
		Wait Until Element Is Visible 			    ${css_Driverbirthday_Monthbtn}		   	5s
		Click element														${css_Driverbirthday_Monthbtn}
		Wait Until Element Is Visible 			    ${css_Driverbirthday_Month}		   			5s
		Click element														${css_Driverbirthday_Month}
		Wait Until Element Is Visible 			    ${css_Driverbirthday_Yearbtn}		   		5s
		Click element														${css_Driverbirthday_Yearbtn}
		Wait Until Element Is Visible 			    ${css_Driverbirthday_Year}		   			5s
		Click element														${css_Driverbirthday_Year}
		Wait Until Element Is Visible 			    ${css_Driverbirthday_Day}		   			5s
		Click element														${css_Driverbirthday_Day}



		Wait Until Element Is Visible 			    ${css_DrivercitizenId}	   		5s
		Click element														${css_DrivercitizenId}
		Input Text   														${css_DrivercitizenId}	 		${DrivercitizenIdedit}
		Wait Until Element Is Visible 			    ${css_DriverPhone}	   		5s
		Click element														${css_DriverPhone}
		Input Text   														${css_DriverPhone}	 				${DriverPhoneedit}
		Wait Until Element Is Visible 			    ${css_DriversendidPhone}	   		5s
		Click element														${css_DriversendidPhone}
		Input Text   														${css_DriversendidPhone}	 		${DriversendidPhoneedit}
		Wait Until Element Is Visible 			    ${css_COURIERbtn}		   		5s
		Click element														${css_COURIERbtn}
		Wait Until Element Is Visible 			    ${css_COURIER}		   		5s
		Click element														${css_COURIER}

New Driver CANCLE btn
		Wait Until Element Is Visible 			 	${css_Canclebtn} 	   		5s
		Click element													${css_Canclebtn}

New Driver Create btn
		Wait Until Element Is Visible 			  ${css_Createbtn} 	   		5s
		Click element													${css_Createbtn}

Reset password
		Wait Until Element Is Visible 			 		${css_resetDriverbtn} 	   		5s
		Click element														${css_resetDriverbtn}
		Wait Until Element Is Visible 			 		${css_ResetpasswordinputNewPassword}	   		5s
		Click element														${css_ResetpasswordinputNewPassword}
		Input Text    													${css_ResetpasswordinputNewPassword}				${NewPassword}
		Wait Until Element Is Visible 			 		${css_ResetpasswordViewbtn}		   		5s
		Click element														${css_ResetpasswordViewbtn}
		Sleep    10s

Reset password CANCLE btn
		Wait Until Element Is Visible 			 		${css_ResetpasswordCanclebtn} 		   		5s
		Click element														${css_ResetpasswordCanclebtn}

Reset password Change btn
		Wait Until Element Is Visible 			 		${css_ResetpasswordChangebtn}			   		5s
		Click element														${css_ResetpasswordChangebtn}

Delete Driver
		Wait Until Element Is Visible 			 		${css_DeleteDriverbtn}			   		5s
		Click element														${css_DeleteDriverbtn}
		Sleep    3s
		#Handle Alert									DISMISS			5s

Delete Driver CANCLE btn
		Handle Alert									DISMISS			5s

Delete Driver ACCEPT btn
		Handle Alert									ACCEPT			5s




*** Test Cases ***
# 2Stage website Search Driver
#   Login to 2Stage by						${admin_username}				${admin_password}
#   Go to Driver page
# 	Search Driver

# 2Stage website New Driver
# 	  Login to 2Stage by						${admin_username}				${admin_password}
# 	  Go to Driver page
		# New Driver
		# New Driver CANCLE btn
		# New Driver
		# New Driver Create btn

# 2Stage website Edit Driver
# 		Login to 2Stage by						${admin_username}				${admin_password}
# 		Go to Driver page
# 		Search Driver
# 		Sleep    5s
# 		Edit Driver
# 		New Driver CANCLE btn
# 		Search Driver
# 		Sleep    5s
# 		Edit Driver
# 		New Driver Create btn



# 2Stage website reset Password
# 				Login to 2Stage by						${admin_username}				${admin_password}
# 				Go to Driver page
# 				Search Driver
# 				Reset password
# 				Reset password CANCLE btn
# 				Reset password
# 				Reset password Change btn


2Stage website reset Password
				Login to 2Stage by						${admin_username}				${admin_password}
				Go to Driver page
				Search Driver
				Delete Driver
				Delete Driver ACCEPT btn
