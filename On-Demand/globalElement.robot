*** Variables ***
${browser}						      chrome
${url_ondemand_staging}			https://staging-customer.sendit.asia/
${username}						      Tester1@sendit.asia
${password}						      12345678
${defaultuser_name}				  Panuwit S.
${defaultuser_email}			  tester1@sendit.asia
${defaultuser_phone}			  022020022
${defaultuser_address}			Bangkok
${user_form}					      css=form[name="userForm"]
${newpassword}					    new12345
${settinguser_name}				  Ms.Pitchaya
${settinguser_email}			  pitchaya_ket@sendit.asia
${user_phone}					      0929929992
${user_address}					    Asoke Tower
${error_alertmsg}				    css=div.alert-danger
${Login_menu}					      css=.login-menu
${Login_modal}					    css=#loginTab
${email_field}					    css=#i_email
${pswd_password}				    css=#i_pw
${login_btn}					      css=#b_login
${username_topmenu}				  css=#s_usernamedirective
${username_topmenu_jquery}		s_usernamedirective
${logout_jquery}				    a_logoutdirective
${setting_jquery}				    a_settingsdirective
${change_pswd}					    css=input[name='pw1']
${confirm_change_pswd}			css=input[name='pwc']
${phone}						        css=input[name='iphone']
${submit_jquery}				    b_reg
${setting_name}					    css=input[name="iname"]
${setting_email}				    css=input[name="iemail"]
${setting_phone}				    css=input[name="iphone"]
${setting_address}				  css=input[name="address"]
${setting_language}				  //*[@id="individual"]/div[1]/select

#Pickup
${pickup_tab}               //*[@id="panel-heading-style"]/h4/a/div/span[2]
