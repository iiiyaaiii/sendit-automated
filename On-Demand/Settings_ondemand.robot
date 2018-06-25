*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Resource			globalElement.robot
Resource			keyword_Login.robot
Resource			keyword_Settings.robot

*** Test Cases ***
Edit user name phone and address successful
	Open Ondemand website
	Login to Ondemand			${username}		${password}
	Click Settings menu
	Wait Until Element Is Visible		${user_form}		5s
	Input Text 					${setting_name}			${settinguser_name}
	Input Text					${setting_email}		${settinguser_email}
	Input Text 					${setting_phone}		${user_phone}
	Input Text 					${setting_address}		${user_address}
	Click Element 				${setting_phone}
	Execute Javascript			$('#${submit_jquery}').click()

Change password and login successful
	Open Ondemand website
	Login to Ondemand			${username}		${password}
	Sleep  1s
	Change password				${newpassword}		${newpassword}
	Sleep  3s
	Click Element						${setting_email}
	Execute Javascript							$('#${submit_jquery}').click()
	Logout from Ondemand
	Login to Ondemand			${username}		${newpassword}
	Sleep  1s
	Change password				${password}		${password}
	Sleep  3s
	Click Element						${setting_email}
	Execute Javascript							$('#${submit_jquery}').click()
	Logout from Ondemand
	Login to Ondemand			${username}		${password}
	Logout from Ondemand

Change password fail input wrong confirm password
	Open Ondemand website
	Login to Ondemand			${username}		${password}
	Click Settings menu
	Wait Until Element Is Visible		${user_form}		5s
	Change password				${newpassword}		${password}
	Sleep  2s
	Error message should be 	css=p[ng-message="compareto"]		Passwords must be the same

