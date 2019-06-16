*** Settings ***
Library					Selenium2Library
Suite Setup


*** Variables ***
${url_login}								https://staging.customer.sendit.asia/th/2stage/login
${admin_username}							test_admin@sendit.asia
${admin_password}							sendit1234
#element login-home page
${url_2stage_activdelivery}					https://staging.customer.sendit.asia/th/2stage/parcels?activeStatusTab=ongoing&currentView
${css_login_modal}						css=div.login-container__loginform___2rEJe
${css_username}								//div[1]/div/div/div/div[1]/input
${css_password}								//div[1]/div/div/div/div[2]/input
${css_loginbtn}								//div[1]/div/div/div/div[3]/button
#Go to Data Entry Page
${css_DataEntrybtn}        		//div/div/div[2]/ul/li[5]/a/i



*** Keywords ***
Login to 2Stage by		    [Arguments]			${username}					${password}
	Open Browser							              ${url_login}					chrome
	Maximize Browser Window
	Element Should Be Visible				        ${css_login_modal}				5s
	Input Text								              ${css_username}					${username}
	Input Text							               	${css_password}					${password}
	Sleep  3s
	Click element  							            ${css_loginbtn}
	Sleep  1s
Go to Data Entry page
	Wait Until Element Is Visible 			    ${css_DataEntrybtn}  		5s
	Click element    						            ${css_DataEntrybtn}


*** Test Cases ***
2Stage website Data Entry
    Login to 2Stage by										${admin_username}				${admin_password}
    Go to Data Entry page
