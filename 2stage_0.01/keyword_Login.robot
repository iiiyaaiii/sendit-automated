*** Settings ***
Library				Selenium2Library


*** Keywords ***
Login to 2Stage by			[Arguments]			${username}			${password}
	Open Browser 							${url_login} 					chrome
	Element Should Be Visible 				${css_login_modal}				10s
	Input Text 								${css_username}					${username}
	Input Text								${css_password} 				${password}
	Sleep  3s
	Click Element 							${css_loginbtn}
	Sleep  1s

Display error message 		[Arguments]			${element}			${message}
	${error_msg} = 							Get Text 						${element}
	Should Be Equal							${error_msg}					${message}

