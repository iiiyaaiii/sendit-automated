*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Resource			globalElement.robot
Resource			keyword_Login.robot

*** Test Cases ***
Access to Ondemand web and login successful
	Open Ondemand website
	Login to Ondemand			${username}		${password}
	Logout from Ondemand

Change password and login successful
	Open Ondemand website
	Login to Ondemand			${username}		${password}
	Change password				${newpassword}		${newpassword}
	Logout from Ondemand
	Login to Ondemand			${username}		${newpassword}
	Change password				${password}		${password}
	Logout from Ondemand
	Login to Ondemand			${username}		${password}
	Logout from Ondemand