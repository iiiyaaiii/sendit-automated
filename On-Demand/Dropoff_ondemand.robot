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
  Create Pickup location					 ${user_address}			${hr}-11		${min}-30
  Sleep  5s
  Wait Until Element Is Visible    ${dropoff_modal}     5s
  Input Text                       ${dropoff1_location}       ${dropoff1_address}
  Click Element						         ${dropoff1_location}
	Sleep  5s
	Execute Javascript    	$('${pickup_google_item}').click()
  Sleep  5s
  Click Element                    ${contact_person}
  Input Text                       ${contact_person}          ${contact_name}
  Input Text                       ${phone_number}            ${contact_phone}
  Input Text                       ${dropoff_comment}         ${contact_comment}
  Click Element                    ${dropoff_comment}
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
  Create Pickup location					 ${user_address}			${hr}-11		${min}-30
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
  Create Pickup location					 ${user_address}			${hr}-11		${min}-30
  Sleep  5s
  Wait Until Element Is Visible    ${dropoff_modal}     5s
  Input Text                       ${dropoff1_location}       ${dropoff1_address}
  Click Element						         ${dropoff1_location}
  Sleep  5s
  Execute Javascript    	$('${pickup_google_item}').click()
  Sleep  5s
  Click Element                    ${contact_person}
  Input Text                       ${contact_person}          ${contact_name}
  Input Text                       ${phone_number}            ${contact_phone}
  Input Text                       ${dropoff_comment}         ${contact_comment}
  Click Element                    ${dropoff_comment}
  Select Parcel                    ID
  Select parcel                    RETURN
  Sleep  10s
  Element Should Be Enabled        ${complete_parcel_next_btn}
  Click Element                    css=li#addNewDropoff
  Wait Until Element Is Visible    ${dropoff_modal}     5s
  Input Text                       ${dropoff2_location}       ${dropoff2_address}
  Click Element						         ${dropoff2_location}
  Sleep  5s
  Execute Javascript    	$('${pickup_google_item}').click()
  Sleep  5s
  Execute Javascript               $($('.dropoffContainer input[placeholder="Contact Person / Company"]')[1]).click()
  Execute Javascript               $($('.dropoffContainer input[placeholder="Contact Person / Company"]')[1]).val('${contact_name}')
  Execute Javascript               $($('.dropoffContainer input[placeholder="Contact Person / Company"]')[1]).val('${contact_name}')
  Sleep  3s
  Execute Javascript               $($('.dropoffContainer input[placeholder="Phone number"]')[1]).val("${contact_phone}")
  Execute Javascript               $($('.dropoffContainer input[placeholder="Phone number"]')[1]).click()
  Select Parcel                    FOOD
  Select Parcel                    PURCHASE
  Sleep  10s
  Element Should Be Enabled        ${complete_parcel_next_btn}
  Click Element                    ${complete_parcel_next_btn}
  # Sleep  1s
  # Element Should Be Visible        ${confirmation_modal}
