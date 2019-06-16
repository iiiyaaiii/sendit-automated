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
#Go to Parcel Import page
${css_ParcelImportbtn}         //div/div/div[2]/ul/li[13]/a/i

#Browse Customer
${css_BrowseCustomer}					//div/div/div[3]/div/div[2]/input
${BrowseCustomer}							ADEN
${BrowseCustomer2}							ADEN
${Customerbtn}								//div/div/div[3]/div/div[2]/ul/li
${ChooseFilebtn}							//div/div/div[3]/div/div[2]/div[1]/div[2]/div/div/input

${Downloadanexamplefilebtn}							//div/div/div[3]/div/div[3]/div[1]/div[1]/a
${viewallbtn}														//div/div/div[3]/div/div[3]/div[2]/div[1]/a
${Downloadbtn}													//div/div/div[3]/div/div[1]/div/table/tbody[1]/tr[2]/td[4]/a[1]
${Rollbackbtn}													//div/div/div[3]/div/div[1]/div/table/tbody[1]/tr[2]/td[4]/a[2]


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
Go to Parcel Import page
	Wait Until Element Is Visible 			    ${css_ParcelImportbtn}  		5s
	Click element    						            ${css_ParcelImportbtn}

Browse Customer
	Wait Until Element Is Visible 			    ${css_BrowseCustomer}  		5s
	Click element    						            ${css_BrowseCustomer}
	Input Text    													${css_BrowseCustomer}				${BrowseCustomer}
	Wait Until Element Is Visible 			    ${Customerbtn}  		5s
	Click element  													${Customerbtn}
	# Wait Until Element Is Visible    				//div/div/div[3]/div/div[2]/div[1]/div[2]/div/div/input
	# Click element  												//div/div/div[3]/div/div[2]/div[1]/div[2]/div/div/input
	Choose File    													//*[@id="root"]/div/div/div[3]/div/div[2]/div[1]/div[2]/div/div/input 	C:\\Users\\MP1CCW3X\\Downloads\\test.txt
Download an example file
	Wait Until Element Is Visible 			    ${Downloadanexamplefilebtn}  		5s
	Click element  													${Downloadanexamplefilebtn}
view all
	Wait Until Element Is Visible 			    ${viewallbtn}	  		5s
	Click element  													${viewallbtn}
Download
	Wait Until Element Is Visible 			    ${Downloadbtn}	  		5s
	Click element  													${Downloadbtn}
Rollback
	Wait Until Element Is Visible 			    ${Rollbackbtn}	  		5s
	Click element  													${Rollbackbtn}


*** Test Cases ***
2Stage website Parcel Import
      Login to 2Stage by						${admin_username}				${admin_password}
      Go to Parcel Import page
			Browse Customer
			Download an example file
			view all
			Download
			Rollback
