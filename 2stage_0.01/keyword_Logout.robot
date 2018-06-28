*** Settings ***
Library				Selenium2Library

*** Keywords ***
Check user already login then can logout successfully
	Login to 2Stage by		${admin_username}		${admin_password}
	Wait Until Element Is Visible		css=.globalnav-component__menulist___279ou
	Mouse Over			css=.globalnav-component__menulist___279ou .globalnav-component__menutext___v7ebC
	Sleep  1s
	Click Element 		//*[contains(text(),'Logout')]
	Sleep  1s
	Confirm Action
	Sleep  3s
	Location Should Be		https://staging.customer.sendit.asia/th/2stage/login





