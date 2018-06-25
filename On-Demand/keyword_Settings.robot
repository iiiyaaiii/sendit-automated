*** Keywords ***
Click Settings menu
	Execute Javascript						$('#${username_topmenu_jquery}').click()
	Sleep  1s
	Execute Javascript						$('#${setting_jquery}').click()
	Sleep  3s

Change password				[Arguments]			${newpswd}			${confirmpswd}
	Click Settings menu
	Input Text 							${change_pswd}			${newpswd}
	Input Text 							${confirm_change_pswd}			${confirmpswd}
	# Sleep  3s
	# Click Element						${setting_email}
	# Execute Javascript							$('#${submit_jquery}').click()

