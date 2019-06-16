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
#Go to Approve Transfer Page
${css_ApproveTransferbtn}          			//div/div/div[2]/ul/li[8]/a/i
#Search
${css_Selectedbtn}    				//div/div/div[3]/div/div[1]/button[1]
${css_FristDay}               //div/div/div[3]/div/div[1]/div[1]/div[2]/div/div[2]/div[3]/div[1]/div[6]
${css_LastDay}                //div/div/div[3]/div/div[1]/div[1]/div[2]/div/div[2]/div[3]/div[5]/div[5]
${css_ClickPrevDay} 					//div/div/div[3]/div/div[1]/div[1]/div[2]/div/div[1]/span[1]
${css_body}                   //div/div/div[3]/div
${css_Searchbtn}              //div/div/div[3]/div/div[1]/div/button

${css_SearchStatusApprovebtn}   //div/div/div[3]/div/div[1]/button[2]/span
${css_Approvebtn} 							//div/div/div[3]/div/div[2]/div/div[1]/div[3]/div[4]/div/div/div[2]/div/div[11]/div/div/div/div/button


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
Go to Approve Transfer Page
	Wait Until Element Is Visible 			    ${css_ApproveTransferbtn}   				5s
	Click element														${css_ApproveTransferbtn}
Search

    Wait Until Element Is Visible 			    ${css_Selectedbtn}   		5s
    Click element                           ${css_Selectedbtn}
		Wait Until Element Is Visible 			    ${css_ClickPrevDay}    		5s
		Click element                           ${css_ClickPrevDay}
		Click element                           ${css_ClickPrevDay}
    Wait Until Element Is Visible 			    ${css_FristDay}   		5s
    Click element                           ${css_FristDay}
    # Wait Until Element Is Visible 			    ${css_LastDay}   		5s
    # Click element                           ${css_LastDay}
    Wait Until Element Is Visible 			    ${css_body}    		5s
    Click element                           ${css_body}
    Wait Until Element Is Visible 			   ${css_Searchbtn}      		5s
    Click element                          ${css_Searchbtn}
    Sleep    5s

See by Status Approve
		Wait Until Element Is Visible 			   ${css_SearchStatusApprovebtn}     		5s
		Click element                          ${css_SearchStatusApprovebtn}
		Sleep    3s

Approve
		Wait Until Element Is Visible 			   ${css_Approvebtn}     		5s
		Click element                          ${css_Approvebtn}
		Sleep  1s
		Confirm Action
		#Handle Alert									DISMISS			5s



*** Test Cases ***
2Stage website Home Admin
      Login to 2Stage by						${admin_username}				${admin_password}
			Go to Approve Transfer Page
			Search
			See by Status Approve
			See by Status Approve
			Approve
