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
#Go to Sorting Page
${css_Sortingbtn}        			//div/div/div[2]/ul/li[3]/a/i
#Sorting
${css_SortingTypebtn}  					//div/div/div[3]/div/div/div[2]/div/ul/li[68]/span
${css_Choosefilebtn} 						input#document
${css_Uplodefilebtn} 						//*[@id="root"]/div/div/div[3]/div/div/div[3]/form/button






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
Go to Sorting page
	Wait Until Element Is Visible 			    ${css_Sortingbtn}  		5s
	Click element    						            ${css_Sortingbtn}
Sorting
	Wait Until Element Is Visible 			    ${css_SortingTypebtn}    		5s
	Click element    						           	${css_SortingTypebtn}
	Sleep    3s
	# Wait Until Element Is Visible 			    ${css_Choosefilebtn}  		5s
	# Sleep    5s
	# Click Button    						            ${css_Choosefilebtn}
	# Choose File    													${css_Choosefilebtn}  				C://Users/MP1CCW3X/Downloads/Sorting.xlsx
	# Choose File    													${css_Choosefilebtn}  				C://Users/MP1CCW3X/Downloads/test.txt
	Choose File    													id=document				C:\\Users\\MP1CCW3X\\Desktop\\Sorting.xlsx
	Sleep    3s
	Wait Until Element Is Visible 			    ${css_Uplodefilebtn}  		5s
	Click element  													${css_Uplodefilebtn}
	


*** Test Cases ***
2Stage website Sorting
      Login to 2Stage by						${admin_username}				${admin_password}
      Go to Sorting page
			Sorting
