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
${pickup_location_input}    css=input[placeholder="Pickup Location - Type to search"]
${pickup_time_input}        css=input[placeholder="Pickup time"]
${pickup_time_modal}        css=md-dialog-content.dtp-content
${pickup_google_item}       li.icn-google
${nextmonth}                css=div.dtp-month-btn-next
${selected_date}            css=.dtp-select-day.selected
${clock}                    css=.dtp-picker-clock
${hr}                       css=#time-hours
${min}                      css=#time-minutes
${submit_datetime}          css=.dtp-btn-ok
${submit_pickup}            //*[@id="content1"]/div/div/div/div/div/button
${sender_name}              css=#senderContactName
${sender_phone}             css=#senderPhoneNumber
${sender_email}             css=#senderEmail
${sender_comment}           css=textarea[placeholder="Comments(floor, building - Optional)"]
${dropoff_modal}            css=div.dropoffContainer
${parcel_modal}             css=div.parcelContainer

#Dropoff
${dropoff1_location}        css=input[placeholder="Dropoff1 Location"]
${dropoff2_location}        css=input[placeholder="Dropoff2 Location"]
${dropoff3_location}        css=input[placeholder="Dropoff3 Location"]
${dropoff4_location}        css=input[placeholder="Dropoff4 Location"]
${dropoff5_location}        css=input[placeholder="Dropoff5 Location"]
${dropoff1_address}          Richmond Office Building
${dropoff2_address}          AIA
${contact_person}           css=.dropoffContainer input[placeholder="Contact Person / Company"]
${contact_name}             สมชาย  ขายดี
${phone_number}             css=.dropoffContainer input[placeholder="Phone number"]
${contact_phone}            0925554545
${dropoff_comment}          css=#textinputDropoffComment
${contact_comment}          Level 12
${parcel_Cash}              .parcelContainer li[tooltip="Cash on delivery"]
${parcel_Food}              .parcelContainer li[tooltip="Hot food delivery"]
${parcel_ID}                .parcelContainer li[tooltip="Photo ID approval"]
${parcel_Return}            .parcelContainer li[tooltip="Return route"]
${parcel_Document}          .parcelContainer li[tooltip="Document processing"]
${parcel_Purchase}          .parcelContainer li[tooltip="Purchase services"]
${parcel_Mailing}           .parcelContainer li[tooltip="Mailing services"]
${parcel_Insurance}         .parcelContainer li[tooltip="Extra Insurance"]
${COD_input}                css=input[placeholder="THB"]
${done_btn}                 css=a.done
${parcel_cash_value}        css=.green .service-value
${pacel_insurance_value}    css=.blue .service-value
${complete_parcel_next_btn}          css=button[ng-click="vm.doPriceAndConfirm()"]
${confirmation_modal}       css=#content3
