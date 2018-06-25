*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Resource 			keyword_Login.robot
Resource			globalElement.robot

*** Test Cases ***
Login to 2Stage website as Admin successful
	Login to 2Stage by						${admin_username}		${admin_password}
	Sleep  10s
	Location Should Contain					${url_2stage_activdelivery}	
	
Login to 2Stage website with incorrect Username
	Login to 2Stage by						${admin_wrongusername}		${admin_password}
	${error_msg} = 							Get Text 						${css_error_login}
	Display error message					${css_error_login}			${error_username_psswd_msg}

Login to 2Stage website with incorrect Password
	Login to 2Stage by						${admin_username}		${admin_wrongpasswd}
	Display error message					${css_error_login}			${error_username_psswd_msg}