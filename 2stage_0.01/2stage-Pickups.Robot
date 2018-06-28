*** Settings ***
Library					Selenium2Library
Suite Setup


*** Variables ***
${url_login}								  https://staging.customer.sendit.asia/th/2stage/login
${admin_username}							admin@sendit.asia
${admin_password}							12345678
#element login-home page
${url_2stage_activdelivery}		https://staging.customer.sendit.asia/th/2stage/parcels?activeStatusTab=ongoing&currentView
${css_login_modal}						css=div.login-container__loginform___2rEJe
${css_username}								//div[1]/div/div/div/div[1]/input
${css_password}								//div[1]/div/div/div/div[2]/input
${css_loginbtn}								//div[1]/div/div/div/div[3]/button
#Go to Driver Page
${css_Pickupsbtn}        			//div/div/div[2]/ul/li[10]/a/i
${css_NewRequestbtn}        	//h4/button/span

#New Request
${css_ShopCode}  							//div[4]/div/div/div/div/form/div/div[2]/input
${css_Numberofitems} 					//div[4]/div/div/div/div/form/div/div[3]/input
${css_ChooseCustomerbtn}			//div[4]/div/div/div/div/div/button[2]/span
${css_CustomerSelect}					//div[4]/div/div/div/div/form/div[2]/div/div/span/span
${css_Customer}								//*[contains(text(),'7-11 to shop')]
${css_ShopSelect}						//div[4]/div/div/div/div/form/div[3]/div/div/span
${css_Shop}										//*[contains(text(),'โรงอาหารกลาง มธ.')]
${css_CustomerNumberofitems}						//div[4]/div/div/div/div/form/div[4]/input
${css_CreateNewRequestbtn}							//div[4]/div/div/div/div/form/div[5]/button/span

#Data
${ShopCode}										123453335
${Numberofitems} 							7
${CustomerNumberofitems}			7




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
Go to Pickups page
	Wait Until Element Is Visible 			    ${css_Pickupsbtn}  		5s
	Click element    						            ${css_Pickupsbtn}
New Request
	Wait Until Element Is Visible 			    ${css_NewRequestbtn}    		5s
	Click element  													${css_NewRequestbtn}
	Wait Until Element Is Visible 			    ${css_ShopCode}  	    		5s
	Click element  													${css_ShopCode}
	Input Text    													${css_ShopCode}  		${ShopCode}
	Sleep    3s
	Wait Until Element Is Visible 			    ${css_Numberofitems} 	    		5s
	Click element  													${css_Numberofitems}
	Input Text    													${css_Numberofitems}  		${Numberofitems}
	Wait Until Element Is Visible 			    ${css_ChooseCustomerbtn} 	    		5s
	Click element  													${css_ChooseCustomerbtn}
	Sleep    3s
	Wait Until Element Is Visible 			    ${css_CustomerSelect} 	    		5s
	Click element  													${css_CustomerSelect}
	Sleep    3s
	Wait Until Element Is Visible 			    ${css_Customer} 	    		5s
	Click element  													${css_Customer}
	Wait Until Element Is Visible 			    ${css_CustomerNumberofitems} 	    		5s
	Click element  													${css_CustomerNumberofitems}
	Input Text    													${css_CustomerNumberofitems}  						${CustomerNumberofitems}
	Wait Until Element Is Visible 			    ${css_ShopSelect} 	    		5s
	Click element  													${css_ShopSelect}
	Wait Until Element Is Visible 			    ${css_Shop} 	    		5s
	Click element  													${css_Shop}
	Wait Until Element Is Visible 			    ${css_CreateNewRequestbtn}	 	    		5s
	Click element  													${css_CreateNewRequestbtn}
	Confirm Action


*** Test Cases ***
# 2Stage website Pickups New Request
#       Login to 2Stage by						${admin_username}				${admin_password}
#       Go to Pickups page
# 			New Request
