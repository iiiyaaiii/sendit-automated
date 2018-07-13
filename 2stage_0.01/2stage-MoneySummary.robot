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
#Go to Driver Page
${css_MoneySummarybtn}        //div/div/div[2]/ul/li[9]/a/i
#SearFromRange
${css_SearFromRangebtn}       //div/div/div[3]/div/div/button[1]/span
#Set
${css_SelectSetbtn}       //div/div/div[3]/div/div/div[1]/div/div/span
${css_SelectSet}          //*[contains(text(),'SET 568 2018-06-27 12:18 pm')]
#Day
${css_1stDaybtn}          //div/div/div[3]/div/div[1]/div[1]/div[2]/div/div[2]/div[3]/div[1]/div[1]
${css_LastDaybtn}         //div/div/div[3]/div/div/div[1]/div[2]/div/div[2]/div[3]/div[2]/div[4]
${css_Premonthbtn}        //div/div/div[3]/div/div/div[1]/div[2]/div/div[1]/span[1]
${css_Nextmonthbtn}       //div/div/div[3]/div/div/div[1]/div[2]/div/div[1]/span[2]

${css_Searchbtn}          //div/div/div[3]/div/div[1]/div[2]/button
${css_body}          //div/div/div[3]/div
${css_CODbtn}           //div/div/div[3]/div/div[1]/div[3]/button[1]
${css_COD2btn}          //div/div/div[3]/div/div[1]/div[3]/button[2]
${css_FEEbtn}           //div/div/div[3]/div/div[1]/div[3]/button[3]
${css_Exportbtn}      //div/div/div[3]/div/div[1]/button[2]/span

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
Go to Money Summary page
	Wait Until Element Is Visible 			    ${css_MoneySummarybtn}  		5s
	Click element    						            ${css_MoneySummarybtn}
Search
  Wait Until Element Is Visible 			    ${css_SelectSetbtn}   		5s
  Click element                           ${css_SelectSetbtn}
  Wait Until Element Is Visible 			    ${css_SelectSet}   		5s
  Click element                           ${css_SelectSet}
  Wait Until Element Is Visible 			    ${css_SearFromRangebtn}    		5s
  Click element                           ${css_SearFromRangebtn}
  Wait Until Element Is Visible 			    ${css_LastDaybtn}    		5s
  Click element                           ${css_LastDaybtn}
  Wait Until Element Is Visible 			    ${css_Premonthbtn}    		5s
	Sleep    3s
  Click element                           ${css_Premonthbtn}
	Sleep    3s
  Click element                           ${css_Premonthbtn}
	Sleep    3s
	Click element                           ${css_Premonthbtn}
	Sleep    3s
  # Click element                           ${css_Premonthbtn}
  # Click element                           ${css_Premonthbtn}
  # Click element                           ${css_Premonthbtn}
#  Click element                           ${css_Premonthbtn}
  Wait Until Element Is Visible 			    ${css_1stDaybtn}    		5s
  Click element                           ${css_1stDaybtn}
  Wait Until Element Is Visible 			    ${css_body}    		5s
  Click element                           ${css_body}
	Sleep    3s
  Wait Until Element Is Visible 			   ${css_Searchbtn}      		5s
  Click element                          ${css_Searchbtn}
  Sleep    10s

COD
  Wait Until Element Is Visible 			   ${css_CODbtn}      		5s
  Click element                          ${css_CODbtn}
  Sleep    3s

COD2
  Wait Until Element Is Visible 			   ${css_COD2btn}      		5s
  Click element                          ${css_COD2btn}
  Sleep    3s

FEE
  Wait Until Element Is Visible 			   ${css_FEEbtn}      		5s
  Click element                          ${css_FEEbtn}
  Sleep    3s

Export
  Wait Until Element Is Visible 			   ${css_Exportbtn}      		5s
  Click element                          ${css_Exportbtn}


*** Test Cases ***
2Stage website Search Driver
    Login to 2Stage by						${admin_username}				${admin_password}
    Go to Money Summary page
		Sleep    3s
    Search
		Sleep    10s
		COD
		Sleep    3s
		COD2
		Sleep    3s
		FEE
		Sleep    3s
    Export
