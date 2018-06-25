*** Settings ***
Suite Setup
#Suite Teardown		Close All Browsers
Library				 Selenium2Library



*** Variables ***
${url_login}					https://staging.customer.sendit.asia/th/2stage/login
${admin_username}				admin@sendit.asia
${admin_password}				12345678

#element login-home page
${url_2stage_activdelivery}		https://staging.customer.sendit.asia/th/2stage/parcels?activeStatusTab=ongoing&currentView
${css_login_modal}				css=div.login-container__loginform___2rEJe
${css_username}					//div[1]/div/div/div/div[1]/input
${css_password}					//div[1]/div/div/div/div[2]/input
${css_loginbtn}					//div[1]/div/div/div/div[3]/button

#Go to Location Management Page
${css_LocationManagementbtn}				//div/div/div[2]/ul/li[11]/a/i
${css_inputSearchLocationManagement}		//div/div/div[3]/div/div[1]/div/input
${css_Courierbtn}							//div/div/div[3]/div/div[1]/div/ul/li[1]/span
${css_Statusbtn}							//div/div/div[3]/div/div[2]/div/div[1]/div/div/span/span
${css_StatusAllbtn}							//*[contains(text(),'ALL')]
${css_StatusActivebtn}						//*[contains(text(),'ACTIVE')]
${css_Statusinactivebtn}					//*[contains(text(),'INACTIVE')]
${css_inputSearch}							//div/div/div[1]/div/div[1]





*** Keywords ***
Login to 2Stage by			[Arguments]			${username}			${password}
	Open Browser 							${url_login} 					chrome
	Maximize Browser Window
	Element Should Be Visible 				${css_login_modal}				10s
	Input Text 								${css_username}					${username}
	Input Text								${css_password} 				${password}
	Sleep  3s
	Click Element 							${css_loginbtn}
	Sleep  1s

Go to Location Management page
	Wait Until Element Is Visible 			${css_LocationManagementbtn}		5s
	Click element    						${css_LocationManagementbtn}

Search Location Management
#	Wait Until Element Is Visible 			${css_inputSearchLocationManagement}		5s
#	Click element    						${css_inputSearchLocationManagement}
	Wait Until Element Is Visible 			${css_Courierbtn}		5s
	Click element    						${css_Courierbtn}

Search Location Management Courier Status All
	Wait Until Element Is Visible 			${css_Statusbtn}		5s
	Click element    						${css_Statusbtn}
	# Wait Until Element Is Visible 			${css_Statusinactivebtn}		5s
	# Click element    						${css_Statusinactivebtn}
	# Wait Until Element Is Visible 			${css_Statusbtn}		5s
	# Click element    						${css_Statusbtn}
	Wait Until Element Is Visible 			${css_StatusAllbtn}		5s
	Click element    						${css_StatusAllbtn}
	Wait Until Element Is Visible 			${css_inputSearch}		5s
	Click element    						${css_inputSearch}

Search Location Management Courier Status Active
	Wait Until Element Is Visible 			${css_Statusbtn}		5s
	Click element    						${css_Statusbtn}
	Wait Until Element Is Visible 			${css_StatusActivebtn}		5s
	Click element    						${css_StatusActivebtn}

Search Location Management Courier Status Inactive
	Wait Until Element Is Visible 			${css_Statusbtn}		5s
	Click element    						${css_Statusbtn}
	Wait Until Element Is Visible 			${css_Statusinactivebtn}		5s
	Click element    						${css_Statusinactivebtn}









*** Test Cases ***
2Stage website Search Courier all
	Login to 2Stage by						${admin_username}		${admin_password}
	Go to Location Management page
	Search Location Management
	Search Location Management Courier Status All

2Stage website Search Courier Active
	Login to 2Stage by						${admin_username}		${admin_password}
	Go to Location Management page
	Search Location Management
	Search Location Management Courier Status Active

2Stage website Search Courier Inactive
	Login to 2Stage by						${admin_username}		${admin_password}
	Go to Location Management page
	Search Location Management
	Search Location Management Courier Status Inactive
