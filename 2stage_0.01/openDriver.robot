*** Settings ***
Library				Selenium2Library



*** Variables ***
${url_login}					https://staging.customer.sendit.asia/th/2stage/login
${admin_username}				admin@sendit.asia
${admin_password}				12345678
#${admin_wrongusername}			not_admin@sendit.asia
#${admin_wrongpasswd}			11111111

#element login-home page
${url_2stage_activdelivery}		https://staging.customer.sendit.asia/th/2stage/parcels?activeStatusTab=ongoing&currentView
${css_login_modal}				css=div.login-container__loginform___2rEJe
${css_username}					//div[1]/div/div/div/div[1]/input
${css_password}					//div[1]/div/div/div/div[2]/input
${css_loginbtn}					//div[1]/div/div/div/div[3]/button
# ${element_nav_text}				css=.globalnav-component__pageTitle___3ydbX

#${css_error_login}				//*[@id="root"]/div/div/div/div[4]
#${error_username_psswd_msg}		Not found username or password incorrect
#Left menu bar
#${css_left_menu_modal}			css=.sidenav-component__sidenav___1FCbh
# ${css_admin_menu}				css=.globalnav-component__menutext___v7ebC
#${url_2stageDriver_activdelivery}		//div/div/div[2]/ul/li[12]/a/i
${CSS_2stageDriver}				//div/div/div[2]/ul/li[4]/a/i
#${drivername}					ขจร
#${css_drivername}				<input type="text" placeholder="search by name" ng-model="search.name" class="form-control searchField ng-pristine ng-untouched ng-valid ng-empty">
${css_searchbtn}				//*[@id="driversPanel"]/table/tbody/tr[1]/td[2]

${css_LocationManage}			//div/div/div[2]/ul/li[11]/a/i
${css_LocationManage_DC}		//div/div/div[3]/div/div[1]/div/ul/li[2]
${css_LocationManage_DCBKK3}	//div/div/div[3]/div/div[2]/div/ul/li[1]
${css_createDCbtn}				//div/div/div[3]/div/div[2]/div/div[2]/button
${css_createDCname}				//div/div/div[3]/div/div[3]/div/div[1]/input
${css_createDCaddress}	 		//div/div/div[3]/div/div[3]/div/div[2]/textarea
${DCname}						DC Bangna 2
${DCname2}						DC Bangna
${DCaddress}					Sukhumvit 21 Road (Asoke Road) Bangkok Thailand
${css_createDCbtnSave}			//div/div/div[3]/div/div[3]/div/div[3]/button[1]
${css_searchDC}      			//div/div/div[3]/div/div[2]/div/input
${css_searchDCasoke} 			//div/div/div[3]/div/div[2]/div/ul/li[1]
${css_editDC} 					//div/div/div[3]/div/div[3]/div/button



*** Keywords ***
Login to 2Stage by			[Arguments]			${username}			${password}
	Open Browser 							${url_login} 					chrome
	Maximize Browser Window
	Element Should Be Visible 				${css_login_modal}				10s
	Input Text 								${css_username}					${username}
	Input Text								${css_password} 				${password}
	Sleep  3s
	Click Element 							${css_loginbtn}
	Sleep  1s
	#Click Element 							${CSS_2stageDriver}
	#Go To 									${url_2stageDriver_activdelivery}
#search Driver by
	#Sleep  20s
	#Wait Until Element Is Visible 			${css_drivername}		10s
	#Click Element 							${css_drivername}
	#Input Text 								${css_drivername}		${name}
	#Sleep  10s
	#Wait Until Element Is Visible			${css_searchbtn}
	#Click Element 							${css_searchbtn}
create DC Asoke by
	Wait Until Element Is Visible 			${css_LocationManage}		5s
	Click Element 							${css_LocationManage}
	Wait Until Element Is Visible 			${css_LocationManage_DC}	5s
	Click Element 							${css_LocationManage_DC}
	Wait Until Element Is Visible 			${css_LocationManage_DCBKK3}	5s
	Click Element 							${css_LocationManage_DCBKK3}
	Wait Until Element Is Visible 			${css_createDCbtn}		5s
	Click Element 							${css_createDCbtn}
	Wait Until Element Is Visible 			${css_createDCname}			5s
	Click Element 							${css_createDCname}
	Input Text 								${css_createDCname}			${DCname}
	Click Element 							${css_createDCaddress}
	Input Text 								${css_createDCaddress}		${DCaddress}
	Wait Until Element Is Visible 			${css_createDCbtnSave}			5s
	Click Element 							${css_createDCbtnSave}
	Relode page
edit Dc Asoke by
	Wait Until Element Is Visible 			${css_LocationManage}		5s
	Click Element 							${css_LocationManage}
	Wait Until Element Is Visible 			${css_LocationManage_DC}	5s
	Click Element 							${css_LocationManage_DC}
	Wait Until Element Is Visible 			${css_searchDC}    	5s
	Click Element 							${css_searchDC}
	Input Text 								${css_searchDC}  			${DCname}
	Click Element 							${css_searchDCasoke}
	Click Element 							${css_editDC}
	Click Element 							${css_createDCname}
	Input Text 								${css_createDCname}			${DCname2}
	Wait Until Element Is Visible 			${css_createDCbtnSave}			5s
	Click Element 							${css_createDCbtnSave}
	Reload Page




*** Settings ***
Suite Setup
#Suite Teardown		Close All Browsers
Library				Selenium2Library
#Resource 			keyword_Login.robot
#Resource			globalElement.robot

*** Test Cases ***
2Stage website edit Dc
	Login to 2Stage by						${admin_username}		${admin_password}
	#Location Should Contain					${url_2stage_activdelivery}
	#Sleep  3s
	#Wait Until Element Is Visible 			${css_2stageDriver}			5s
	#Click Element 							${css_2stageDriver}
	#create DC Asoke by
	edit Dc Asoke by


