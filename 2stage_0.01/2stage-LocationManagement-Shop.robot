*** Settings ***
Library					Selenium2Library
Suite Setup



*** Variables ***
${url_login}								https://staging.customer.sendit.asia/th/2stage/login
${admin_username}							test_admin@sendit.asia
${admin_password}							sendit1234
#element login-home page
${url_2stage_activdelivery}					https://staging.customer.sendit.asia/th/2stage/parcels?activeStatusTab=ongoing&currentView
${css_login_modal}							css=div.login-container__loginform___2rEJe
${css_username}								//div[1]/div/div/div/div[1]/input
${css_password}								//div[1]/div/div/div/div[2]/input
${css_loginbtn}								//div[1]/div/div/div/div[3]/button
#Go to Location Management Page
${css_LocationManagementbtn}				//div/div/div[2]/ul/li[11]/a/i
${css_inputSearchLocationManagement}		//div/div/div[3]/div/div[1]/div/input
${css_SHOPbtn}								//*[contains(text(),'SHOP')]


#SearchByShop
${css_SearchByShopbtn}                              //div/div/div[3]/div/div[2]/div/div[1]/div/div/span/span
${css_Shop7-11Speed-dbtn}                   //*[contains(text(),'7-11 Speed-D')]
${css_Shop7-11ToShopbtn}                    //*[contains(text(),'7-11 to shop')]
${css_ShopLAZADAbtn}                        //*[contains(text(),'Lazada')]
${css_inputSearch}                          //div/div/div[1]/div/div[1]


#SearchByShop input name shop
${css_inputSearchName}                      //div/div/div[3]/div/div[2]/div/input
${inputSearchName1}                         เพชรพระราม
${inputSearchName2}                         อสมท.



#Create
${css_CreateNewbtn}								//div/div/div[3]/div/div[2]/div/div[2]/button
#input data Create
${css_inputSHOPCustomerbtn} 										//div/div/div[3]/div/div[3]/div/div[1]/div/span/span
${css_inputSHOPCustomer}											//*[contains(text(),'Lazada')]
${css_inputSHOPName}												//div/div/div[3]/div/div[3]/div/div[2]/input
${css_inputSHOPCode}												//div/div/div[3]/div/div[3]/div/div[3]/input
${css_inputSHOPphone}												//div/div/div[3]/div/div[3]/div/div[4]/input
${css_inputSHOPAddress}												//div/div/div[3]/div/div[3]/div/div[5]/textarea
${css_inputSHOPcontactPersonname}									//div/div/div[3]/div/div[3]/div/div[6]/input
${css_inputSHOPcontactPerson.email}									//div/div/div[3]/div/div[3]/div/div[7]/input
${css_inputSHOPcontactPerson.phone}									//div/div/div[3]/div/div[3]/div/div[8]/input


#Data For test Create
${SHOPName}															Eve and Boy
${SHOPCode}															09990
${SHOPphone}														0987228201
${SHOPAddress}														Eve and Boy
${SHOPcontactPersonname}											Eve and Boy Manager
${SHOPcontactPerson.email}											EveandBoy@hotmail.co.th
${SHOPcontactPerson.phone}											0987228201


#Data For test Edit
${SHOPNameEdit}															Eve and Boy
${SHOPCodeEdit}															016171
${SHOPphoneEdit}														0987228201
${SHOPAddressEdit}														Eve and Boy



${css_CreateSAVEbtn}						//div/div/div[3]/div/div[3]/div/button[2]
${css_CreateCANCLEbtn}						//div/div/div[3]/div/div[3]/div/button[1]


${css_SelecetSHOPForEdit}					//*[contains(text(),'Eve and Boy')]
${css_Editbtn}								//div/div/div[3]/div/div[3]/div/button
${css_EditDisable_Enablebtn}				//div/div/div[3]/div/div[3]/div/div[4]/div/div[2]



*** Keywords ***
Login to 2Stage by		[Arguments]			${username}					${password}
	Open Browser							${url_login}					chrome
	Maximize Browser Window
	Element Should Be Visible				${css_login_modal}				10s
	Input Text								${css_username}					${username}
	Input Text								${css_password}					${password}
	Sleep  3s
	Click element  							${css_loginbtn}
	Sleep  1s
Go to Location Management page
	Wait Until Element Is Visible 			${css_LocationManagementbtn}		5s
	Click element    						${css_LocationManagementbtn}

select SHOP
	Wait Until Element Is Visible 			${css_inputSearchLocationManagement}		5s
	Click element    						${css_inputSearchLocationManagement}
	Wait Until Element Is Visible 			${css_SHOPbtn}		5s
	Click element    						${css_SHOPbtn}






Create
	Wait Until Element Is Visible 			${css_CreateNewbtn}		5s
	Click element    						${css_CreateNewbtn}

Create Input Data
	#SHOPCustomer
	Wait Until Element Is Visible 			${css_inputSHOPCustomerbtn}		5s
	Click element    						${css_inputSHOPCustomerbtn}
	Wait Until Element Is Visible 			${css_inputSHOPCustomer}		5s
	Click element    						${css_inputSHOPCustomer}
	#SHOPName
	Wait Until Element Is Visible 			${css_inputSHOPName}		5s
	Click element    						${css_inputSHOPName}
	Input Text 								${css_inputSHOPName}			${SHOPName}
	#SHOPCode
	Wait Until Element Is Visible 			${css_inputSHOPCode}		5s
	Click element    						${css_inputSHOPCode}
	Input Text 								${css_inputSHOPCode}			${SHOPCode}
	#SHOPphone
	Wait Until Element Is Visible 			${css_inputSHOPphone}		5s
	Click element    						${css_inputSHOPphone}
	Input Text 								${css_inputSHOPphone}			${SHOPphone}
	#SHOPAddress
	Wait Until Element Is Visible 			${css_inputSHOPAddress}		5s
	Click element    						${css_inputSHOPAddress}
	Input Text 								${css_inputSHOPAddress}			${SHOPAddress}
	#SHOPcontactPersonname
	Wait Until Element Is Visible 			${css_inputSHOPcontactPersonname}		5s
	Click element    						${css_inputSHOPcontactPersonname}
	Input Text 								${css_inputSHOPcontactPersonname}			${SHOPcontactPersonname}
	#SHOPcontactPerson.email
	Wait Until Element Is Visible 			${css_inputSHOPcontactPerson.email}		5s
	Click element    						${css_inputSHOPcontactPerson.email}
	Input Text 								${css_inputSHOPcontactPerson.email}			${SHOPcontactPerson.email}
	#SHOPcontactPerson.Phone
	Wait Until Element Is Visible 			${css_inputSHOPcontactPerson.phone}		5s
	Click element    						${css_inputSHOPcontactPerson.phone}
	Input Text 								${css_inputSHOPcontactPerson.phone}			${SHOPcontactPerson.phone}









select SHOP for edit
	Wait Until Element Is Visible 			${css_SelecetSHOPForEdit}		5s
	Click Element							${css_SelecetSHOPForEdit}
	Wait Until Element Is Visible 			${css_Editbtn}						5s
	Click Element 							${css_Editbtn}


Edit Input Data
	#SHOPCustomer
	Wait Until Element Is Visible 			${css_inputSHOPCustomerbtn}		5s
	Click element    						${css_inputSHOPCustomerbtn}
	Wait Until Element Is Visible 			${css_inputSHOPCustomer}		5s
	Click element    						${css_inputSHOPCustomer}
	#SHOPName
	Wait Until Element Is Visible 			${css_inputSHOPName}		5s
	Click element    						${css_inputSHOPName}
	Input Text 								${css_inputSHOPName}			${SHOPNameEdit}
	#SHOPCode
	Wait Until Element Is Visible 			${css_inputSHOPCode}		5s
	Click element    						${css_inputSHOPCode}
	Input Text 								${css_inputSHOPCode}			${SHOPCodeEdit}
	#SHOPphone
	Wait Until Element Is Visible 			${css_inputSHOPphone}		5s
	Click element    						${css_inputSHOPphone}
	Input Text 								${css_inputSHOPphone}			${SHOPphoneEdit}
	#SHOPAddress
	Wait Until Element Is Visible 			${css_inputSHOPAddress}		5s
	Click element    						${css_inputSHOPAddress}
	Input Text 								${css_inputSHOPAddress}			${SHOPAddressEdit}









CANCLE btn
	Wait Until Element Is Visible 			${css_CreateCANCLEbtn}		5s
	Click element    						${css_CreateCANCLEbtn}
SAVE btn
	Wait Until Element Is Visible 			${css_CreateSAVEbtn}		5s
	Click element    						${css_CreateSAVEbtn}





Search Location Management
	Wait Until Element Is Visible 			${css_SHOPbtn}		5s
	Click element    						${css_SHOPbtn}

Search Location Management SHOP 7-11 Speed-D
	Wait Until Element Is Visible 			${css_SearchByShopbtn}		5s
	Click element    						${css_SearchByShopbtn}
	Wait Until Element Is Visible 			${css_Shop7-11Speed-dbtn}		5s
	Click element    						${css_Shop7-11Speed-dbtn}

Search Location Management SHOP 7-11 to shop
	Wait Until Element Is Visible 			${css_SearchByShopbtn}		5s
	Click element    						${css_SearchByShopbtn}
	Wait Until Element Is Visible 			${css_Shop7-11ToShopbtn}		5s
	Click element    						${css_Shop7-11ToShopbtn}

Search Location Management SHOP LAZADA
	Wait Until Element Is Visible 			${css_SearchByShopbtn}		5s
	Click element    						${css_SearchByShopbtn}
	Wait Until Element Is Visible 			${css_ShopLAZADAbtn}		5s
	Click element    						${css_ShopLAZADAbtn}



SearchByShop input name shop
	Wait Until Element Is Visible   		${css_inputSearchName}		5s
	Click Element 							${css_inputSearchName}
	Input Text 								${css_inputSearchName}			${inputSearchName1}
	Click Element 							${css_inputSearchName}
	Input Text 								${css_inputSearchName}			${inputSearchName2}










*** Test Cases ***
# 2Stage website Create CANCLE btn
# 	Login to 2Stage by						${admin_username}				${admin_password}
# 	Go to Location Management page
# 	select SHOP
# 	Create
# 	Create Input Data
# 	CANCLE btn

# 2Stage website Create SAVE btn
# 	Login to 2Stage by						${admin_username}				${admin_password}
# 	Go to Location Management page
# 	select SHOP
# 	Create
# 	Create Input Data
# 	SAVE btn


# Search Location Management SHOP 7-11 Speed-D
# 	Login to 2Stage by						${admin_username}		${admin_password}
# 	Go to Location Management page
# 	Search Location Management
# 	Search Location Management SHOP 7-11 Speed-D
# 	SearchByShop input name shop

# Search Location Management SHOP 7-11 to shop
# 	Login to 2Stage by						${admin_username}		${admin_password}
# 	Go to Location Management page
# 	Search Location Management
# 	Search Location Management SHOP 7-11 to shop

# Search Location Management SHOP LAZADA
# 	Login to 2Stage by						${admin_username}		${admin_password}
# 	Go to Location Management page
# 	Search Location Management
# 	Search Location Management SHOP LAZADA

# 2Stage website Edit CANCLE btn
# 	Login to 2Stage by						${admin_username}				${admin_password}
# 	Go to Location Management page
# 	select SHOP
# 	select SHOP for edit
# 	Edit Input Data
# 	CANCLE btn


2Stage website Edit Shop CANCLE
	Login to 2Stage by						${admin_username}				${admin_password}
	Go to Location Management page
	select SHOP
	Search Location Management SHOP LAZADA
	select SHOP for edit
	Edit Input Data
	CANCLE btn


2Stage website Edit Shop SAVE
	Login to 2Stage by						${admin_username}				${admin_password}
	Go to Location Management page
	select SHOP
	Search Location Management SHOP LAZADA
	select SHOP for edit
	Edit Input Data
	SAVE btn
