*** Settings ***
Library					Selenium2Library
Suite Setup



*** Variables ***
${url_login}												https://staging.customer.sendit.asia/th/2stage/login
${admin_username}										admin@sendit.asia
${admin_password}										12345678
#element login-home page
${url_2stage_activdelivery}					https://staging.customer.sendit.asia/th/2stage/parcels?activeStatusTab=ongoing&currentView
${css_login_modal}									css=div.login-container__loginform___2rEJe
${css_username}											//div[1]/div/div/div/div[1]/input
${css_password}											//div[1]/div/div/div/div[2]/input
${css_loginbtn}											//div[1]/div/div/div/div[3]/button
#Go to Location Management Page
${css_LocationManagementbtn}						//div/div/div[2]/ul/li[11]/a/i
${css_inputSearchLocationManagement}		//div/div/div[3]/div/div[1]/div/input
${css_MOBILE_HUBbtn}										//*[contains(text(),'MOBILE_HUB')]


#SearchByStatus
${css_Statusbtn}                            //div/div/div[3]/div/div[2]/div/div[1]/div/div/span/span
${css_StatusAllbtn}                         //*[contains(text(),'ALL')]
${css_StatusActivebtn}                      //*[contains(text(),'ACTIVE')]
${css_Statusinactivebtn}                    //*[contains(text(),'INACTIVE')]
${css_inputSearch}                          //div/div/div[1]/div/div[1]



#Create
${css_CreateNewbtn}											//div/div/div[3]/div/div[2]/div/div[2]/button
#input data Create
${css_inputMOBILE_HUBlicense}						//div/div/div[3]/div/div[3]/div/div[2]/input
${css_inputMOBILE_HUBName}							//div/div/div[3]/div/div[3]/div/div[1]/input
${css_inputMOBILE_HUBCity}							//*[contains(text(),'ระยอง')]
${css_inputMOBILE_HUBCourier}						//*[contains(text(),'DHL')]


${css_Citybtn}										//div/div/div[3]/div/div[3]/div/div[3]/div[1]/div/span/span
${css_Courierbtn}									//div/div/div[3]/div/div[3]/div/div[3]/div[2]/div/span/span

#Data For test Create
${MOBILE_HUBName}									MOBILE HUB Test 2
${MOBILE_HUBlicense}							DHL MOBILE HUB Test 2 Genera
${MOBILE_HUBCity}									//*[contains(text(),'ตราด')]
${MOBILE_HUBCourier}							//*[contains(text(),'DHL')]


#Data For test Edit
${MOBILE_HUBNameEdit}									MOBILE HUB Test 1
${MOBILE_HUBlicenseEdit}							DHL MOBILE HUB Test 1
${MOBILE_HUBCityEdit}									//*[contains(text(),'ตราด')]
${MOBILE_HUBCourierEdit}							//*[contains(text(),'DHL')]


${css_CreateSAVEbtn}							//div/div/div[3]/div/div[3]/div/div[4]/button[1]
${css_CreateCANCLEbtn}						//div/div/div[3]/div/div[3]/div/div[4]/button[2]


${css_SelecetMOBILE_HUBForEdit}				//*[contains(text(),'MOBILE HUB Test 1')]
${css_Editbtn}												//div/div/div[3]/div/div[3]/div/button
${css_EditDisable_Enablebtn}					//div/div/div[3]/div/div[3]/div/div[4]/div/div[2]



*** Keywords ***
Login to 2Stage by		[Arguments]			${username}					${password}
	Open Browser												${url_login}					chrome
	Maximize Browser Window
	Element Should Be Visible						${css_login_modal}				10s
	Input Text													${css_username}					${username}
	Input Text													${css_password}					${password}
	Sleep  3s
	Click element  											${css_loginbtn}
	Sleep  1s
Go to Location Management page
	Wait Until Element Is Visible 			${css_LocationManagementbtn}		5s
	Click element    										${css_LocationManagementbtn}

select MOBILE_HUB
	Wait Until Element Is Visible 			${css_inputSearchLocationManagement}		5s
	Click element    										${css_inputSearchLocationManagement}
	Wait Until Element Is Visible 			${css_MOBILE_HUBbtn}		5s
	Click element    										${css_MOBILE_HUBbtn}






Create
	Wait Until Element Is Visible 			${css_CreateNewbtn}		5s
	Click element    										${css_CreateNewbtn}

Create Input Data
	#MOBILE_HUBName
	Wait Until Element Is Visible 			${css_inputMOBILE_HUBName}		5s
	Click element    										${css_inputMOBILE_HUBName}
	Input Text 													${css_inputMOBILE_HUBName}			${MOBILE_HUBName}
	#MOBILE_HUBlicense
	Wait Until Element Is Visible 			${css_inputMOBILE_HUBlicense}		5s
	Click element    										${css_inputMOBILE_HUBlicense}
	Input Text 													${css_inputMOBILE_HUBlicense}			${MOBILE_HUBlicense}
	#MOBILE_HUBCity
	Wait Until Element Is Visible 			${css_Citybtn}		5s
	Click element    										${css_Citybtn}
	Wait Until Element Is Visible 			${css_inputMOBILE_HUBCity}		5s
	Click element    										${css_inputMOBILE_HUBCity}
#	Input Text 													${css_inputMOBILE_HUBCity}			${MOBILE_HUBCity}
	#MOBILE_HUBCourier
	Wait Until Element Is Visible 			${css_Courierbtn}		5s
	Click element    										${css_Courierbtn}
	Wait Until Element Is Visible 			${css_inputMOBILE_HUBCourier}		5s
	Click element    										${css_inputMOBILE_HUBCourier}
#	Input Text 													${css_inputMOBILE_HUBCourier}			${MOBILE_HUBCourier}






select MOBILE_HUB for edit
	Wait Until Element Is Visible 			${css_SelecetMOBILE_HUBForEdit}		5s
	Click Element												${css_SelecetMOBILE_HUBForEdit}
	Wait Until Element Is Visible 			${css_Editbtn}						5s
	Click Element 											${css_Editbtn}


Edit Input Data
	#MOBILE_HUBName
	Wait Until Element Is Visible 			${css_inputMOBILE_HUBName}		5s
	Click element    										${css_inputMOBILE_HUBName}
	Input Text 													${css_inputMOBILE_HUBName}				${MOBILE_HUBName}
	#MOBILE_HUBlicense
	Wait Until Element Is Visible 			${css_inputMOBILE_HUBlicense}		5s
	Click element    										${css_inputMOBILE_HUBlicense}
	Input Text 													${css_inputMOBILE_HUBlicense}			${MOBILE_HUBlicense}
	#MOBILE_HUBCity
	Wait Until Element Is Visible 			${css_inputMOBILE_HUBCity}		5s
	Click element    										${css_inputMOBILE_HUBCity}
	Input Text 													${css_inputMOBILE_HUBCity}				${MOBILE_HUBCity}
		#MOBILE_HUBCourier
	Wait Until Element Is Visible 			${css_inputMOBILE_HUBCourier}		5s
	Click element    										${css_inputMOBILE_HUBCourier}
	Input Text 													${css_inputMOBILE_HUBCourier}			${MOBILE_HUBCourier}

Edit disable
	Wait Until Element Is Visible 			${css_EditDisable_Enablebtn}		5s
	Click Element 											${css_EditDisable_Enablebtn}
Edit enable
	Wait Until Element Is Visible 			${css_EditDisable_Enablebtn}		5s
	Click Element 											${css_EditDisable_Enablebtn}





CANCLE btn
	Wait Until Element Is Visible 			${css_CreateCANCLEbtn}		5s
	Click element    										${css_CreateCANCLEbtn}
SAVE btn
	Wait Until Element Is Visible 			${css_CreateSAVEbtn}		5s
	Click element    										${css_CreateSAVEbtn}





Search Location Management
	Wait Until Element Is Visible 			${css_MOBILE_HUBbtn}		5s
	Click element    										${css_MOBILE_HUBbtn}

Search Location Management MOBILE_HUB Status All
	Wait Until Element Is Visible 			${css_Statusbtn}		5s
	Click element    										${css_Statusbtn}
	Wait Until Element Is Visible 			${css_StatusAllbtn}		5s
	Click element    										${css_StatusAllbtn}
	Wait Until Element Is Visible 			${css_inputSearch}		5s
	Click element    										${css_inputSearch}

Search Location Management MOBILE_HUB Status Active
	Wait Until Element Is Visible 			${css_Statusbtn}		5s
	Click element    										${css_Statusbtn}
	Wait Until Element Is Visible 			${css_StatusActivebtn}		5s
	Click element    										${css_StatusActivebtn}

Search Location Management MOBILE_HUB Status Inactive
	Wait Until Element Is Visible 			${css_Statusbtn}		5s
	Click element    										${css_Statusbtn}
	Wait Until Element Is Visible 			${css_Statusinactivebtn}		5s
	Click element    										${css_Statusinactivebtn}


*** Test Cases ***
# 2Stage website Create CANCLE btn
# 	Login to 2Stage by						${admin_username}				${admin_password}
# 	Go to Location Management page
# 	select MOBILE_HUB
# 	Create
# 	Create Input Data
# 	CANCLE btn

# 2Stage website Create SAVE btn
# 	Login to 2Stage by						${admin_username}				${admin_password}
# 	Go to Location Management page
# 	select MOBILE_HUB
# 	Create
# 	Create Input Data
# 	SAVE btn

# 2Stage website Search MOBILE_HUB all
# 	Login to 2Stage by						${admin_username}		${admin_password}
# 	Go to Location Management page
# 	Search Location Management
# 	Search Location Management MOBILE_HUB Status All

# 2Stage website Search MOBILE_HUB Active
# 	Login to 2Stage by						${admin_username}		${admin_password}
# 	Go to Location Management page
# 	Search Location Management
# 	Search Location Management MOBILE_HUB Status Active

# 2Stage website Search MOBILE_HUB Inactive
# 	Login to 2Stage by						${admin_username}		${admin_password}
# 	Go to Location Management page
# 	Search Location Management
# 	Search Location Management MOBILE_HUB Status Inactive

# 2Stage website Edit CANCLE btn
# 	Login to 2Stage by						${admin_username}				${admin_password}
# 	Go to Location Management page
# 	select MOBILE_HUB
# 	select MOBILE_HUB for edit
# 	Edit Input Data
# 	CANCLE btn

# 2Stage website Edit SAVE btn
# 	Login to 2Stage by						${admin_username}				${admin_password}
# 	Go to Location Management page
# 	select MOBILE_HUB
# 	select MOBILE_HUB for edit
# 	Edit Input Data
# 	SAVE btn

2Stage website Edit DISABLE btn
	Login to 2Stage by						${admin_username}				${admin_password}
	Go to Location Management page
	select MOBILE_HUB
	select MOBILE_HUB for edit
	Edit disable
	SAVE btn

2Stage website Edit ENABLE btn
	Login to 2Stage by						${admin_username}				${admin_password}
	Go to Location Management page
	select MOBILE_HUB
	select MOBILE_HUB for edit
	Edit enable
	SAVE btn
