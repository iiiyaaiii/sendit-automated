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
#Go to Driver Page
${css_Pickupsbtn}        			//div/div/div[2]/ul/li[10]/a/i
${css_NewRequestbtn}        	//h4/button/span

#New Request
${css_ShopCode}  							//div[4]/div/div/div/div/form/div/div[2]/input
${css_Numberofitems} 					//div[4]/div/div/div/div/form/div/div[3]/input
${css_ChooseCustomerbtn}			//div[4]/div/div/div/div/div/button[2]/span
${css_CustomerSelect}					//div[4]/div/div/div/div/form/div[2]/div/div/span/span
${css_Customer}								//*[contains(text(),'7-11 to shop')]
#${css_Customer}								//*[contains(text(),'Lazada')]
${css_ShopSelect}							//div[4]/div/div/div/div/form/div[3]/div/div/div[1]
#${css_Shop}										//*[contains(text(),'โรงอาหารกลาง มธ.')]
# ${css_Shop}										//*[contains(text(),'MIDTOWN (อโศก)')]
# ${css_Shop}										//*[contains(text(),'ม.นักกีฬา จุด 4')]
# ${css_Shop}										//*[contains(text(),'กิ่งแก้ว 43')]
${css_Shop}										//*[contains(text(),'รามคำแหง 33')]
${css_CustomerNumberofitems}						//div[4]/div/div/div/div/form/div[4]/input
${css_CreateNewRequestbtn}							//div[4]/div/div/div/div/form/div[5]/button/span

#Data
${ShopCode}										67334
${Numberofitems} 							7
${CustomerNumberofitems}			7

#fillter
${css_CustomerSelectfiltersbtn}							//div[1]/div[2]/div/div/span/span
${css_ShopSelectfiltersbtn}									//div[1]/div[3]/div/div/span/span
${css_Body}						//div[1]
${css_SHOW_ONLY_UNASSIGNED_JOBS_BTN}				//div[1]/div[4]/div[1]/div/div[2]

#Action
${css_ActionCanclebtn}									//div[2]/div[1]/div[3]/div[1]/div/div/div[2]/div/div[13]/div/div/div/div/button[1]
${css_ActionAssingbtn}									//div[2]/div[1]/div[3]/div[1]/div/div/div[2]/div/div[13]/div/div/div/div/button[2]/i
${css_ActionAssinginputname}									//form/div/input
${css_nameDriver}												kijja
${css_ActionAssingDriverbtn}						//table/tbody/tr[1]/td[5]/button


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

fillter
	Wait Until Element Is Visible 			    ${css_CustomerSelectfiltersbtn}	    		5s
	Click element  													${css_CustomerSelectfiltersbtn}
	Wait Until Element Is Visible 			    ${css_Customer}		    		5s
	Click element  													${css_Customer}
	Wait Until Element Is Visible 			    ${css_Body}	    		5s
	Click element  													${css_Body}
	Wait Until Element Is Visible 			    ${css_ShopSelectfiltersbtn}	    		5s
	Click element  													${css_ShopSelectfiltersbtn}
	Wait Until Element Is Visible 			    ${css_Shop}		    		5s
	Click element  													${css_Shop}
	Wait Until Element Is Visible 			    ${css_Body}	    		5s
	Click element  													${css_Body}
	Wait Until Element Is Visible 			    ${css_SHOW_ONLY_UNASSIGNED_JOBS_BTN}		    		5s
	Click element  													${css_SHOW_ONLY_UNASSIGNED_JOBS_BTN}

Action cancle
	Wait Until Element Is Visible 			    ${css_ActionCanclebtn}	    		5s
	Click element  													${css_ActionCanclebtn}
	Confirm Action


Action Assing
			Wait Until Element Is Visible 			    ${css_ActionAssingbtn}	    		5s
			Click element  													${css_ActionAssingbtn}
			Wait Until Element Is Visible 			    ${css_ActionAssinginputname}		    		5s
			Click element  													${css_ActionAssinginputname}
			Input Text    ${css_ActionAssinginputname}	    ${css_nameDriver}
			Wait Until Element Is Visible 			    ${css_ActionAssingDriverbtn}	    		5s
			Click element  													${css_ActionAssingDriverbtn}
			Confirm Action


*** Test Cases ***
2Stage website Pickups New Request
      Login to 2Stage by						${admin_username}				${admin_password}
      Go to Pickups page
			New Request

# 2Stage website Pickups fillter
# 			Login to 2Stage by						${admin_username}				${admin_password}
# 			Go to Pickups page
# 			fillter

2Stage website Pickups Action Assing
						Login to 2Stage by						${admin_username}				${admin_password}
						Go to Pickups page
						fillter
						Action Assing

# 2Stage website Pickups Action Assing
# 						Login to 2Stage by						${admin_username}				${admin_password}
# 						Go to Pickups page
# 						Action cancle
