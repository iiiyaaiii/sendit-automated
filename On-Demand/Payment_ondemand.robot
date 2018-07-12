*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Library				DateTime
Resource			globalElement.robot
Resource			keyword_Login.robot
Resource			keyword_Settings.robot
Resource			keyword_Pickup.robot
Resource			keyword_Dropoff.robot
Resource      keyword_Parcel.robot
Resource      keyword_Confirmation.robot
Resource      keyword_Payment.robot

*** Test Cases ***
Select pay by Cash successful
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Create Pickup location					${user_address}
  Set pickup date next month
  Set pickup time					14				05
  Complete sender details
  Click Element    				${submit_pickup}
  Sleep  2s
  Set Dropoff location             ${dropoff1_location}       ${dropoff1_address}
  Sleep  5s
  Set Dropoff contact person       ${contact_person1}          ${contact_name1}
  Set Dropoff contact phone number      ${phone_number1}            ${contact_phone1}
  Set Dropoff comment                   ${dropoff_comment1}         ${contact_comment1}
  Sleep  3s
  Select Parcel                    ID
  Select parcel                    RETURN
  Select Parcel                    INSURANCE
  Sleep  3s
  Click Element                    ${complete_parcel_next_btn}
  Sleep  10s
  Element Should Be Visible        ${confirmation_modal}
  Check send date time      2       05
  Element Text Should Be        ${dropoff_element}     1 DROPOFF
  Check parcels summary detail    1     1     ID
  Check parcels summary detail    1     2     DOCUMENT
  Check parcels summary detail    1     3     INSURANCE
  Click Button                Confirm >
  Element Should Be Visible     ${payment_modal}
