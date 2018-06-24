*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library

*** Variables ***
${url_ondemand_staging}			http://staging-customer.sendit.asia/
${username}						Tester1@sendit.asia
${password}						12345678

*** Keywords ***
Open Ondemand website
	Open Browser 							${url_ondemand_staging}					firefox
	Maximize Browser Window

Login to Ondemand
	Click Element			css=.login-menu
	Element Should Be Visible				css=#loginTab
	Input Text								css=#i_email			${username}
	Input password 							css=#i_pw			${password}
	Click Button							css=#b_login
	Wait Until Element Is Visible			css=#s_usernamedirective		10s
	Element Should Contain					css=#s_usernamedirective		${username}

Logout from Ondemand
	Reload Page
	Wait Until Element Is Visible			css=#b_usernamedirective		10s
	Click Element							css=#b_usernamedirective
	Sleep  5s
	Wait Until Element Is Visible			css=#usernamedd			10s
	Click Element							//*[contains(text(),'Logout')]

*** Test Cases ***
Access to Ondemand web and login successful
	Open Ondemand website
	Login to Ondemand
	Logout from Ondemand