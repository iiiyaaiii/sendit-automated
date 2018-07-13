*** Settings ***
Library					Selenium2Library
Suite Setup


*** Variables ***
${url_login}								  https://staging.customer.sendit.asia/th/2stage/login
${admin_username}							test_admin@sendit.asia
${admin_password}							sendit1234
#element login-home page
${url_2stage_activdelivery}		https://staging.customer.sendit.asia/th/2stage/parcels?activeStatusTab=ongoing&currentView
${css_login_modal}						css=div.login-container__loginform___2rEJe
${css_username}								//div[1]/div/div/div/div[1]/input
${css_password}								//div[1]/div/div/div/div[2]/input
${css_loginbtn}								//div[1]/div/div/div/div[3]/button
#Go to Admin Page
# ${css_Adminbtn}          			//div/div/div[1]/div/div[2]/ul/li[3]
#${css_Change Passwordbtn}			//*[contains(text(),'Change Password')]
${css_CurrentPassword}				//div[1]/div/div/div[1]/div[1]/div/div/div[2]/div[1]/input
${css_NewPassword}						//div[1]/div/div/div[1]/div[1]/div/div/div[2]/div[2]/input
${css_ConfirmPassword}				//div[1]/div/div/div[1]/div[1]/div/div/div[2]/div[3]/input
${css_ChangePasswordbtn}			//div[1]/div/div/div[1]/div[1]/div/div/div[2]/div[4]/button
${css_Xbtn}										//div[1]/div/div/div[1]/div[1]/div/button

#Data 1
${CurrentPassword}						sendit1234
${NewPassword}								12341234
${ConfirmPassword}						12341234

#Data 2
${CurrentPassword2}						12341234
${NewPassword2}								sendit1234
${ConfirmPassword2}						sendit1234


*** Keywords ***
Login to 2Stage by		    [Arguments]			${username}					${password}
	Open Browser							              ${url_login}				chrome
	Maximize Browser Window
	Element Should Be Visible				        ${css_login_modal}				5s
	Input Text								              ${css_username}					${username}
	Input Text							               	${css_password}					${password}
	Sleep  3s
	Click element  							            ${css_loginbtn}
	Sleep  1s
Change Password X
	Wait Until Element Is Visible		css=.globalnav-component__menulist___279ou
	Mouse Over			css=.globalnav-component__menulist___279ou .globalnav-component__menutext___v7ebC
	Sleep  1s
	Click Element 		//*[contains(text(),'Change password')]
	Wait Until Element Is Visible 			   ${css_Xbtn}	      		5s
	Click element                          ${css_Xbtn}

Change Password Save
		Wait Until Element Is Visible		css=.globalnav-component__menulist___279ou
		Mouse Over			css=.globalnav-component__menulist___279ou .globalnav-component__menutext___v7ebC
		Sleep  1s
		Click Element 		//*[contains(text(),'Change password')]
		Wait Until Element Is Visible 			   ${css_CurrentPassword}	      		5s
		Click element                          ${css_CurrentPassword}
		Input Text    												 ${css_CurrentPassword}		${CurrentPassword}
		Wait Until Element Is Visible 			   ${css_NewPassword}	      		5s
		Click element                          ${css_NewPassword}
		Input Text    												 ${css_NewPassword}				${NewPassword}
		Wait Until Element Is Visible 			   ${css_ConfirmPassword}	      		5s
		Click element                          ${css_ConfirmPassword}
		Input Text    												 ${css_ConfirmPassword}				${ConfirmPassword}
		Wait Until Element Is Visible 			   ${css_ChangePasswordbtn}	      		5s
		Click element                          ${css_ChangePasswordbtn}
//*[@id="driversPanel"]/table/tbody/tr[1]/td[2]
Change Password Save Return
				Wait Until Element Is Visible		css=.globalnav-component__menulist___279ou
				Mouse Over			css=.globalnav-component__menulist___279ou .globalnav-component__menutext___v7ebC
				Sleep  1s
				Click Element 		//*[contains(text(),'Change password')]
				Wait Until Element Is Visible 			   ${css_CurrentPassword}	      		5s
				Click element                          ${css_CurrentPassword}
				Sleep    3s
				Input Text    												 ${css_CurrentPassword}		${CurrentPassword2}
				Wait Until Element Is Visible 			   ${css_NewPassword}	      		5s
				Click element                          ${css_NewPassword}
				Input Text    												 ${css_NewPassword}				${NewPassword2}
				Wait Until Element Is Visible 			   ${css_ConfirmPassword}	      		5s
				Click element                          ${css_ConfirmPassword}
				Input Text    												 ${css_ConfirmPassword}				${ConfirmPassword2}
				Wait Until Element Is Visible 			   ${css_ChangePasswordbtn}	      		5s
				Click element                          ${css_ChangePasswordbtn}

Logout
	Wait Until Element Is Visible		css=.globalnav-component__menulist___279ou
	Mouse Over			css=.globalnav-component__menulist___279ou .globalnav-component__menutext___v7ebC
	Sleep  5s
	Click Element 		//*[contains(text(),'Logout')]
	Sleep  5s
	Confirm Action
	Sleep  3s
	Location Should Be		https://staging.customer.sendit.asia/th/2stage/login






*** Test Cases ***
2Stage website Home Admin Change Password X
      Login to 2Stage by						${admin_username}				${admin_password}
      Change Password X
			Sleep    3s
			Logout

2Stage website Home Admin Change Password 12341234
      Login to 2Stage by						${admin_username}				${admin_password}
			Change Password Save
			Sleep    3s
			Logout

2Stage website Home Admin Change Password 12345678
			Login to 2Stage by						${admin_username}				${NewPassword}
			Change Password Save Return
			Sleep    3s
			Logout
