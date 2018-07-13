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
${css_TrackingDriverbtn}        //div/div/div[2]/ul/li[4]/a/i
${css_Searchinput}              ###
${DriverName1}                   Sendit Driver
${DriverName2}                   โกเมษ สำราญ
${DriverName3}                   ณัฐวัฒน์ บุญรอด

${DriverName4}              //*[@id="driversPanel"]/table/tbody/tr[1]/td[2]


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
Go to Tracking Driver page
	Wait Until Element Is Visible 			    ${css_TrackingDriverbtn}  		5s
	Click element    						            ${css_TrackingDriverbtn}
  Sleep    3s
Search by input name
  Wait Until Element Is Visible 			    ${css_Searchinput}       		5s
  Click element    						            ${css_Searchinput}
  Input Text                              ${css_Searchinput}          ${DriverName1}
Search by click name
  Wait Until Element Is Visible 			    ${DriverName4}     		5s
  Click element    						            ${DriverName4}



*** Test Cases ***
2Stage website Search Driver
      Login to 2Stage by						${admin_username}				${admin_password}
      Go to Tracking Driver page
      #Search by input name
      Search by click name
