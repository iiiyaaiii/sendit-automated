*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Resource			globalElement.robot
Resource			keyword_Login.robot
Resource			keyword_Settings.robot
Resource			keyword_Pickup.robot
Resource			keyword_Dropoff.robot

*** Test Cases ***
Create drop off and select parcel successful
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Create Pickup location					 ${user_address}			${hr_afternoon}-14		${min}-30
  Sleep  5s
  Wait Until Element Is Visible    ${dropoff_modal}     5s
  Input Text                       ${dropoff1_location}       ${dropoff1_address}
  Click Element						         ${dropoff1_location}
	Sleep  5s
	Execute Javascript    	$('${pickup_google_item}').click()
  Sleep  5s
  Click Element                    ${contact_person1}
  Input Text                       ${contact_person1}          ${contact_name1}
  Input Text                       ${phone_number1}            ${contact_phone1}
  Input Text                       ${dropoff_comment1}         ${contact_comment1}
  Click Element                    ${dropoff_comment1}
  Select Parcel                    CASH
  Select Parcel                    ID
  Select parcel                    RETURN
  Select Parcel                    INSURANCE
  Sleep  5s
  Click Element                    ${complete_parcel_next_btn}
  Element Should Be Visible        ${confirmation_modal}

Create drop off fail incomplete required fields
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Create Pickup location					 ${user_address}			${hr_afternoon}-14		${min}-30
  Sleep  5s
  Wait Until Element Is Visible    ${dropoff_modal}     5s
  Input Text                       ${dropoff1_location}       ${dropoff1_address}
  Click Element						         ${dropoff1_location}
	Sleep  5s
	Execute Javascript    	$('${pickup_google_item}').click()
  Sleep  5s
  Select Parcel                    ID
  Element Should Be Disabled       ${complete_parcel_next_btn}

Add more drop off successful
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Create Pickup location					 ${user_address}			${hr_afternoon}-14		${min}-30
  Sleep  5s
  Wait Until Element Is Visible    ${dropoff_modal}     5s
  Input Text                       ${dropoff1_location}       ${dropoff1_address}
  Click Element						         ${dropoff1_location}
  Sleep  5s
  Execute Javascript    	$('${pickup_google_item}').click()
  Sleep  5s
  Click Element                    ${contact_person1}
  Input Text                       ${contact_person1}          ${contact_name1}
  Input Text                       ${phone_number1}            ${contact_phone1}
  Input Text                       ${dropoff_comment1}         ${contact_comment1}
  Click Element                    ${dropoff_comment1}
  Select Parcel                    ID
  Select parcel                    RETURN
  Sleep  10s
  Element Should Be Enabled        ${complete_parcel_next_btn}
  Click Element                    ${add_more_dropoff}
  Wait Until Element Is Visible    ${dropoff_modal}     5s
  Input Text                       ${dropoff2_location}       ${dropoff2_address}
  Click Element						         ${dropoff2_location}
  Sleep  3s
  Execute Javascript    	$('${pickup_google_item}').click()
  Execute Javascript               $(${contact_person2}).click()
  Execute Javascript               $(${contact_person2}).val("${contact_name2}")
  Execute Javascript               $(${phone_number2}).val("${contact_phone2}")
  Sleep  2s
  Select Parcel                    FOOD
  Select Parcel                    PURCHASE
  # Sleep  10s
  # Element Should Be Enabled        ${complete_parcel_next_btn}
  # Click Element                    ${complete_parcel_next_btn}
  Click Element                    ${add_more_dropoff}
  Wait Until Element Is Visible    ${dropoff_modal}     5s
  Input Text                       ${dropoff3_location}       ${dropoff3_address}
  Click Element						         ${dropoff3_location}
  Sleep  3s
  Execute Javascript    	$('${pickup_google_item}').click()
  Execute Javascript               $(${contact_person3}).click()
  Execute Javascript               $(${contact_person3}).val('${contact_name3}')
  Execute Javascript               $(${phone_number3}).val("${contact_phone3}")
  Sleep  2s
  Select Parcel                    ID
  Select Parcel                    PURCHASE
  # Sleep  10s
  # Element Should Be Enabled        ${complete_parcel_next_btn}
  # Execute Javascript              $('button[ng-click="vm.doPriceAndConfirm()"]').trigger("select");

Delete this drop off successful
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Create Pickup location					 ${user_address}			${hr_afternoon}-14		${min}-30
  Sleep  5s
  Wait Until Element Is Visible    ${dropoff_modal}     5s
  Input Text                       ${dropoff1_location}       ${dropoff1_address}
  Click Element						         ${dropoff1_location}
  Sleep  5s
  Execute Javascript    	$('${pickup_google_item}').click()
  Sleep  5s
  Click Element                    ${contact_person1}
  Input Text                       ${contact_person1}          ${contact_name1}
  Input Text                       ${phone_number1}            ${contact_phone1}
  Input Text                       ${dropoff_comment1}         ${contact_comment1}
  Click Element                    ${dropoff_comment1}
  Select Parcel                    ID
  Select parcel                    RETURN
  Sleep  10s
  Element Should Be Enabled        ${complete_parcel_next_btn}
  Click Element                    ${add_more_dropoff}
  Wait Until Element Is Visible    ${dropoff_modal}     5s
  Input Text                       ${dropoff2_location}       ${dropoff2_address}
  Click Element						         ${dropoff2_location}
  Sleep  3s
  Execute Javascript    	$('${pickup_google_item}').click()
  Execute Javascript               $(${contact_person2}).click()
  Execute Javascript               $(${contact_person2}).val("${contact_name2}")
  Execute Javascript               $(${phone_number2}).val("${contact_phone2}")
  Sleep  2s
  Select Parcel                    FOOD
  Select Parcel                    PURCHASE
  Execute Javascript               $(${delete_dropoff}).click()
  Sleep  5s
  Element Should Not Be Visible    ${dropoff2_location}
