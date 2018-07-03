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
  Set Dropoff location             ${dropoff1_location}       ${dropoff1_address}
  Sleep  5s
  Set Dropoff contact person       ${contact_person1}          ${contact_name1}
  Set Dropoff contact phone number      ${phone_number1}            ${contact_phone1}
  Set Dropoff comment                   ${dropoff_comment1}         ${contact_comment1}
  Select Parcel                    CASH
  Select Parcel                    ID
  Select parcel                    RETURN
  Select Parcel                    INSURANCE
  Sleep  3s
  Click Element                    ${complete_parcel_next_btn}
  Element Should Be Visible        ${confirmation_modal}

Create drop off fail incomplete required fields
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Create Pickup location					 ${user_address}			${hr_afternoon}-14		${min}-30
  Sleep  3s
  Wait Until Element Is Visible    ${dropoff_modal}     5s
  Set Dropoff location             ${dropoff1_location}       ${dropoff1_address}
	Sleep  3s
	Execute Javascript    	$('${pickup_google_item}').click()
  Sleep  3s
  Select Parcel                    ID
  Element Should Be Disabled       ${complete_parcel_next_btn}

Create drop off fail not selecting parcel
    Open Ondemand website
    Login to Ondemand			   ${username}				${password}
    Create Pickup location					 ${user_address}			${hr_afternoon}-14		${min}-30
    Sleep  3s
    Wait Until Element Is Visible    ${dropoff_modal}     5s
    Set Dropoff location             ${dropoff1_location}       ${dropoff1_address}
  	Sleep  3s
  	Execute Javascript    	$('${pickup_google_item}').click()
    Sleep  3s
    Set Dropoff and Parcel    1    False    False
    Element Should Be Disabled       ${complete_parcel_next_btn}

Add more drop off successful
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Create Pickup location					 ${user_address}			${hr_afternoon}-14		${min}-30
  Sleep  3s
  Set Dropoff location             ${dropoff1_location}       ${dropoff1_address}
  Sleep  3s
  Execute Javascript    	$('${pickup_google_item}').click()
  Sleep  3s
  Set Dropoff and Parcel    3     ID    DOCUMENT
  # Sleep  10s
  # Element Should Be Enabled        ${complete_parcel_next_btn}
  # Execute Javascript              $('button[ng-click="vm.doPriceAndConfirm()"]').trigger("select");

Delete this Dropoff successful
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Create Pickup location					 ${user_address}			${hr_afternoon}-14		${min}-30
  Sleep  3s
  Set Dropoff and Parcel    2     ID    RETURN
  Execute Javascript               $(${delete_dropoff}).click()
  Sleep  5s
  Element Should Not Be Visible    ${dropoff2_location}

Add drop off reach limit 5 locations correctly
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Create Pickup location					 ${user_address}			${hr_beforenoon}-10		${min}-35
  Sleep  5s
  Set Dropoff and Parcel    5     DOCUMENT    MAILING
  Element Should Not Be Visible      ${add_more_dropoff}
