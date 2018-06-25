*** Settings ***
Library					Selenium2Library
Suite Setup



*** Variables ***
${url_login}								https://staging.customer.sendit.asia/th/2stage/login
${admin_username}							admin@sendit.asia
${admin_password}							12345678
#element login-home page
${url_2stage_activdelivery}					https://staging.customer.sendit.asia/th/2stage/parcels?activeStatusTab=ongoing&currentView
${css_login_modal}							css=div.login-container__loginform___2rEJe
${css_username}								//div[1]/div/div/div/div[1]/input
${css_password}								//div[1]/div/div/div/div[2]/input
${css_loginbtn}								//div[1]/div/div/div/div[3]/button
#Go to Location Management Page
${css_LocationManagementbtn}				//div/div/div[2]/ul/li[11]/a/i
${css_inputSearchLocationManagement}		//div/div/div[3]/div/div[1]/div/input
${css_Courierbtn}							//div/div/div[3]/div/div[1]/div/ul/li[1]/span

#Create
${css_CreateNewbtn}							//div/div/div[3]/div/div[2]/div/div[2]/button
#input data Create
${css_inputCourierName}						//div/div/div[3]/div/div[3]/div/div[1]/input
${css_inputCourierCode}						//div/div/div[3]/div/div[3]/div/div[2]/input
${css_inputCourierAddress}					//div/div/div[3]/div/div[3]/div/div[3]/textarea
${css_inputCourierContactPersonName}		//div/div/div[3]/div/div[3]/div/div[4]/input
${css_inputCourierEmail}					//div/div/div[3]/div/div[3]/div/div[5]/input
${css_inputCourierPhone}					//div/div/div[3]/div/div[3]/div/div[6]/input

#Data For test Create
${CourierName}								Kerry Express
${CourierCode}								Kerry
${CourierAddress}							Kerry Express At Asoke
${CourierContactPersonName}					Mr.Martin Jason
${CourierEmail}								KerryExpress_Asoke@Kerry.th
${CourierPhone}								08989983332

${css_CreateSAVEbtn}						//div/div/div[3]/div/div[3]/div/button[1]
${css_CreateCANCLEbtn}						//div/div/div[3]/div/div[3]/div/button[2]





*** Keywords ***
Login to 2Stage by		[Arguments]			${username}					${password}
	Open Browser							${url_login}					chrome
	Maximize Browser Window
	Element Should Be Visible				${css_login_modal}				10s
	Input Text								${css_username}					${username}
	Input Text								${css_password}					${password}
	Sleep  3s
	Click element  							${css_loginbtn}
	Sleep  1s
Go to Location Management page
	Wait Until Element Is Visible 			${css_LocationManagementbtn}		5s
	Click element    						${css_LocationManagementbtn}
select Courier
	Wait Until Element Is Visible 			${css_inputSearchLocationManagement}		5s
	Click element    						${css_inputSearchLocationManagement}
	Wait Until Element Is Visible 			${css_Courierbtn}		5s
	Click element    						${css_Courierbtn}
Create
	Wait Until Element Is Visible 			${css_CreateNewbtn}		5s
	Click element    						${css_CreateNewbtn}

Create Input Data
	#CourierName
	Wait Until Element Is Visible 			${css_inputCourierName}		5s
	Click element    						${css_inputCourierName}
	Input Text 								${css_inputCourierName}			${CourierName}
	#CourierCode
	Wait Until Element Is Visible 			${css_inputCourierCode}		5s
	Click element    						${css_inputCourierCode}
	Input Text 								${css_inputCourierCode}			${CourierCode}
	#CourierAddress
	Wait Until Element Is Visible 			${css_inputCourierAddress}		5s
	Click element    						${css_inputCourierAddress}
	Input Text 								${css_inputCourierAddress}			${CourierAddress}
	#CourierContactPersonName
	Wait Until Element Is Visible 			${css_inputCourierContactPersonName}		5s
	Click element    						${css_inputCourierContactPersonName}
	Input Text 								${css_inputCourierContactPersonName}			${CourierContactPersonName}
	#CourierEmail
	Wait Until Element Is Visible 			${css_inputCourierEmail}		5s
	Click element    						${css_inputCourierEmail}
	Input Text 								${css_inputCourierEmail}			${CourierEmail}
	#CourierPhone
	Wait Until Element Is Visible 			${css_inputCourierPhone}		5s
	Click element    						${css_inputCourierPhone}
	Input Text 								${css_inputCourierPhone}			${CourierPhone}


CANCLE btn
	Wait Until Element Is Visible 			${css_CreateCANCLEbtn}		5s
	Click element    						${css_CreateCANCLEbtn}
SAVE btn
	Wait Until Element Is Visible 			${css_CreateCANCLEbtn}		5s
	Click element    						${css_CreateSAVEbtn}










*** Test Cases ***
2Stage website Create CANCLE btn
	Login to 2Stage by						${admin_username}				${admin_password}
	Go to Location Management page
	select Courier
	Create
	Create Input Data
	CANCLE btn

# 2Stage website Create SAVE btn
# 	Login to 2Stage by						${admin_username}				${admin_password}
# 	Go to Location Management page
# 	select Courier
# 	Create
# 	Create Input Data
# 	SAVE btn