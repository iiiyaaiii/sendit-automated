*** Keywords ***
Open Ondemand website
	Open Browser 							${url_ondemand_staging}					firefox
	Maximize Browser Window

Login to Ondemand 			[Arguments]			${username}			${password}
	Click Element			css=.login-menu
	Element Should Be Visible				css=#loginTab
	Input Text								css=#i_email			${username}
	Input Password 							css=#i_pw			${password}
	Click Button							css=#b_login
	Wait Until Element Is Visible			css=#s_usernamedirective		10s
	Element Should Contain					css=#s_usernamedirective		${username}

Logout from Ondemand
	Wait Until Element Is Visible			css=#s_usernamedirective		10s
	Execute Javascript						$('#s_usernamedirective').click()
	Execute Javascript						$('#a_logoutdirective').click()
	Sleep  3s
	Element Should Not Be Visible 			css=#s_usernamedirective

Change password				[Arguments]			${newpswd}			${confirmpswd}
	Execute Javascript						$('#s_usernamedirective').click()
	Execute Javascript						$('#a_settingsdirective').click()
	Sleep  1s
	Input Text 							css=input[name='pw1']			${newpswd}
	Input Text 							css=input[name='pwc']			${confirmpswd}
	Sleep  1s
	Click Element						css=input[name='iphone']
	Execute Javascript							$('#b_reg').click()