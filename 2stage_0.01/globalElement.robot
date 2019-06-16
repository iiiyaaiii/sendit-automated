*** Variables ***
${url_login}					https://staging.customer.sendit.asia/th/2stage/login
${admin_username}				admin@sendit.asia
${admin_password}				12345678
${admin_wrongusername}			not_admin@sendit.asia
${admin_wrongpasswd}			11111111

#element login-home page
${url_2stage_activdelivery}		https://staging.customer.sendit.asia/th/2stage/parcels?activeStatusTab=ongoing&currentView
${css_login_modal}				css=div.login-container__loginform___2rEJe
${css_username}					//div[1]/div/div/div/div[1]/input
${css_password}					//div[1]/div/div/div/div[2]/input
${css_loginbtn}					//div[1]/div/div/div/div[3]/button
# ${element_nav_text}				css=.globalnav-component__pageTitle___3ydbX		

${css_error_login}				//*[@id="root"]/div/div/div/div[4]
${error_username_psswd_msg}		Not found username or password incorrect
#Left menu bar
${css_left_menu_modal}			css=.sidenav-component__sidenav___1FCbh
# ${css_admin_menu}				css=.globalnav-component__menutext___v7ebC