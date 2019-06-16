*** Settings ***
Library					Selenium2Library
Suite Setup



*** Variables ***
${url_login}								https://staging.customer.sendit.asia/th/2stage/login
${admin_username}							test_admin@sendit.asia
${admin_password}							sendit1234
#element login-home page
${url_2stage_activdelivery}					https://staging.customer.sendit.asia/th/2stage/parcels?activeStatusTab=ongoing&currentView
${css_login_modal}							css=div.login-container__loginform___2rEJe
${css_username}								//div[1]/div/div/div/div[1]/input
${css_password}								//div[1]/div/div/div/div[2]/input
${css_loginbtn}								//div[1]/div/div/div/div[3]/button
#Go to Location Management Page
${css_LocationManagementbtn}				//div/div/div[2]/ul/li[11]/a/i
${css_inputSearchLocationManagement}		//div/div/div[3]/div/div[1]/div/input
${css_DCbtn}								//*[contains(text(),'DC')]


#SearchByStatus
${css_Statusbtn}                            //div/div/div[3]/div/div[2]/div/div[1]/div/div/span/span
${css_StatusAllbtn}                         //*[contains(text(),'ALL')]
${css_StatusActivebtn}                      //*[contains(text(),'ACTIVE')]
${css_Statusinactivebtn}                    //*[contains(text(),'INACTIVE')]
${css_inputSearch}                          //div/div/div[1]/div/div[1]



#Create
${css_CreateNewbtn}							//div/div/div[3]/div/div[2]/div/div[2]/button
#input data Create
${css_inputDCName}							//div/div/div[3]/div/div[3]/div/div[1]/input
${css_inputDCAddress}						//div/div/div[3]/div/div[3]/div/div[2]/textarea




#Data For test Create
${DCName}									DC Sukhumvit 25
${DCAddress}							Richmond Office Building Soi Sukhumvit 26 Khwaeng Khongton Khet Khongtei Bangkok 10110 (Test Create)


#Data For test Edit
${DCNameEdit}									DC Sukhumvit Richmond Office
${DCAddressEdit}							Richmond Office Building Soi Sukhumvit 26 Khwaeng Khongton Khet Khongtei Bangkok 10110 (Test Edit)


${css_CreateSAVEbtn}							//div/div/div[3]/div/div[3]/div/div[3]/button[1]
${css_CreateCANCLEbtn}						//div/div/div[3]/div/div[3]/div/div[3]/button[2]/span


${css_SelecetDCForEdit}							//*[contains(text(),'DC Sukhumvit 26')]
${css_Editbtn}											//div/div/div[3]/div/div[3]/div/button
${css_EditDisable_Enablebtn}				//div/div/div[3]/div/div[3]/div/div[3]/div/div[2]



*** Keywords ***
Login to 2Stage by		[Arguments]			${username}					${password}
	Open Browser										${url_login}					chrome
	Maximize Browser Window
	Element Should Be Visible				${css_login_modal}				10s
	Input Text											${css_username}					${username}
	Input Text											${css_password}					${password}
	Sleep  3s
	Click element  									${css_loginbtn}
	Sleep  1s
Go to Location Management page
	Wait Until Element Is Visible 			${css_LocationManagementbtn}		5s
	Click element    										${css_LocationManagementbtn}

select DC
	Wait Until Element Is Visible 			${css_inputSearchLocationManagement}		5s
	Click element    										${css_inputSearchLocationManagement}
	Wait Until Element Is Visible 			${css_DCbtn}		5s
	Click element    										${css_DCbtn}






Create
	Wait Until Element Is Visible 			${css_CreateNewbtn}		5s
	Click element    										${css_CreateNewbtn}

Create Input Data
	#DCName
	Wait Until Element Is Visible 			${css_inputDCName}		5s
	Click element    										${css_inputDCName}
	Input Text 													${css_inputDCName}			${DCName}
	#DCAddress
	Wait Until Element Is Visible 			${css_inputDCAddress}		5s
	Click element    										${css_inputDCAddress}
	Input Text 													${css_inputDCAddress}			${DCAddress}







select DC for edit
	Wait Until Element Is Visible 			${css_SelecetDCForEdit}		5s
	Click Element							${css_SelecetDCForEdit}
	Wait Until Element Is Visible 			${css_Editbtn}						5s
	Click Element 							${css_Editbtn}


Edit Input Data
	#DCName
	Wait Until Element Is Visible 			${css_inputDCName}		5s
	Click element    						${css_inputDCName}
	Input Text 								${css_inputDCName}			${DCNameEdit}
	#DCAddress
	Wait Until Element Is Visible 			${css_inputDCAddress}		5s
	Click element    						${css_inputDCAddress}
	Input Text 								${css_inputDCAddress}			${DCAddressEdit}


Edit disable
	Wait Until Element Is Visible 			${css_EditDisable_Enablebtn}		5s
	Click Element 							${css_EditDisable_Enablebtn}
Edit enable
	Wait Until Element Is Visible 			${css_EditDisable_Enablebtn}		5s
	Click Element 							${css_EditDisable_Enablebtn}





CANCLE btn
	Wait Until Element Is Visible 			${css_CreateCANCLEbtn}		5s
	Click element    						${css_CreateCANCLEbtn}
SAVE btn
	Wait Until Element Is Visible 			${css_CreateSAVEbtn}		5s
	Click element    						${css_CreateSAVEbtn}





Search Location Management
	Wait Until Element Is Visible 			${css_DCbtn}		5s
	Click element    										${css_DCbtn}

Search Location Management DC Status All
	Wait Until Element Is Visible 			${css_Statusbtn}		5s
	Click element    										${css_Statusbtn}
	Wait Until Element Is Visible 			${css_StatusAllbtn}		5s
	Click element    										${css_StatusAllbtn}
	Wait Until Element Is Visible 			${css_inputSearch}		5s
	Click element    										${css_inputSearch}

Search Location Management DC Status Active
	Wait Until Element Is Visible 			${css_Statusbtn}		5s
	Click element    										${css_Statusbtn}
	Wait Until Element Is Visible 			${css_StatusActivebtn}		5s
	Click element    										${css_StatusActivebtn}

Search Location Management DC Status Inactive
	Wait Until Element Is Visible 			${css_Statusbtn}		5s
	Click element    										${css_Statusbtn}
	Wait Until Element Is Visible 			${css_Statusinactivebtn}		5s
	Click element    										${css_Statusinactivebtn}



*** Test Cases ***
2Stage website Create CANCLE btn
	Login to 2Stage by						${admin_username}				${admin_password}
	Go to Location Management page
	select DC
	Create
	Create Input Data
	CANCLE btn

2Stage website Create SAVE btn
	Login to 2Stage by						${admin_username}				${admin_password}
	Go to Location Management page
	select DC
	Create
	Create Input Data
	SAVE btn


2Stage website Search DC all
	Login to 2Stage by						${admin_username}		${admin_password}
	Go to Location Management page
	Search Location Management
	Search Location Management DC Status All

2Stage website Search DC Active
	Login to 2Stage by						${admin_username}		${admin_password}
	Go to Location Management page
	Search Location Management
	Search Location Management DC Status Active

2Stage website Search DC Inactive
	Login to 2Stage by						${admin_username}		${admin_password}
	Go to Location Management page
	Search Location Management
	Search Location Management DC Status Inactive

2Stage website Edit CANCLE btn
	Login to 2Stage by						${admin_username}				${admin_password}
	Go to Location Management page
	select DC
	select DC for edit
	Edit Input Data
	CANCLE btn

2Stage website Edit SAVE btn
	Login to 2Stage by						${admin_username}				${admin_password}
	Go to Location Management page
	select DC
	select DC for edit
	Edit Input Data
	SAVE btn

2Stage website Edit DISABLE btn
	Login to 2Stage by						${admin_username}				${admin_password}
	Go to Location Management page
	select DC
	select DC for edit
	Edit disable
	SAVE btn

2Stage website Edit ENABLE btn
	Login to 2Stage by						${admin_username}				${admin_password}
	Go to Location Management page
	select DC
	select DC for edit
	Edit enable
	SAVE btn
