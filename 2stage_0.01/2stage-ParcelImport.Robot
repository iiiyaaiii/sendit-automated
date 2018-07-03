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
#Go to Parcel Import page
${css_ParcelImportbtn}         //div/div/div[2]/ul/li[13]/a/i

#Browse Customer
${css_BrowseCustomer}					//div/div/div[3]/div/div[2]/input
${BrowseCustomer}							ADEN


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


*** Test Cases ***
2Stage website Parcel Import
      Login to 2Stage by						${admin_username}				${admin_password}
      Go to Parcel Import page
