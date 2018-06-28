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
  Input Text                       ${dropoff1_location}       ${dropoff_address}
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
  Click Element                    ${complete_parcel_next_btn}
  Element Should Be Visible        ${confirmation_modal}
