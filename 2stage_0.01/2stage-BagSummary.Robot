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
#Go to Bag Page
${css_BagSummarybtn}          //div/div/div[2]/ul/li[7]/a/i
#Search
${css_PleaseSelectbtn}        //div/div/div[3]/div/div[1]/div[1]/div/div/span/span
# ${css_PleaseSelect}           //*[contains(text(),'SET 568 2018-06-27 12:18 pm')]
${css_PleaseSelect}           //*[contains(text(),'SET 1 2016-07-20 11:34 am')]
${css_SelectFromRangebtn}        //div/div/div[3]/div/div[1]/button/span
${css_FristDay}               //div/div/div[3]/div/div[1]/div[1]/div[2]/div/div[2]/div[3]/div[1]/div[6]
${css_LastDay}                //div/div/div[3]/div/div[1]/div[1]/div[2]/div/div[2]/div[3]/div[5]/div[5]

${css_body}                   //div/div/div[3]/div
${css_Searchbtn}              //div/div/div[3]/div/div[1]/div[2]/button

${css_Recalbtn}               //*[contains(text(),'RECAL')][1]
${css_Mapbtn}               //*[contains(text(),'MAP')][1]



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
Go to Bag Summary page
	Wait Until Element Is Visible 			    ${css_BagSummarybtn}  		5s
	Click element    						            ${css_BagSummarybtn}
Search
    Wait Until Element Is Visible 			    ${css_PleaseSelectbtn}   		5s
    Click element                           ${css_PleaseSelectbtn}
    Wait Until Element Is Visible 			    ${css_PleaseSelect}   		5s
    Click element                           ${css_PleaseSelect}
    Wait Until Element Is Visible 			    ${css_SelectFromRangebtn}   		5s
    Click element                           ${css_SelectFromRangebtn}
    Wait Until Element Is Visible 			    ${css_FristDay}   		5s
    Click element                           ${css_FristDay}
    Wait Until Element Is Visible 			    ${css_LastDay}   		5s
    Click element                           ${css_LastDay}
    Wait Until Element Is Visible 			    ${css_body}    		5s
    Click element                           ${css_body}
    Wait Until Element Is Visible 			   ${css_Searchbtn}      		5s
    Click element                          ${css_Searchbtn}
    Sleep    10s
    Wait Until Element Is Visible 			   ${css_Recalbtn}      		5s
    Click element                          ${css_Recalbtn}
    Sleep    10s
    Wait Until Element Is Visible 			   ${css_Mapbtn}      		5s
    Click element                          ${css_Mapbtn}
    Sleep    10s



*** Test Cases ***
2Stage website Bag Summary
      Login to 2Stage by						${admin_username}				${admin_password}
      Go to Bag Summary page
      Search
