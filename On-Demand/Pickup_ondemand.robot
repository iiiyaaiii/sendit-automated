*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Library				DateTime
Resource			globalElement.robot
Resource			keyword_Login.robot
Resource			keyword_Settings.robot
Resource			keyword_Pickup.robot

*** Test Cases ***
Create Pickup successful
	Open Ondemand website
	Login to Ondemand			   ${username}				${password}
  Create Pickup location					${user_address}
	Sleep  5s
	Element Should Be Visible				${dropoff_modal}
	Element Should Be Visible       ${parcel_modal}

Create Pickup fail incomplete required fields
	Open Ondemand website
	Login to Ondemand			   ${username}				${password}
	Wait Until Element Is Visible     ${pickup_tab}     10s
	Sleep  10s
	Input Text               ${pickup_location_input}       ${user_address}
	Click Element						${pickup_location_input}
	Sleep  10s
	Execute Javascript    	$($('${pickup_google_item}')[0]).click()
	Sleep  5s
	Clear Element Text   		${sender_name}
	Clear Element Text			${sender_phone}
	Element Should Be Disabled    					${submit_pickup}

Create Pickup now successful
	Open Ondemand website
	Login to Ondemand			   ${username}				${password}
	Set current Time
	Input Text               ${pickup_location_input}       ${user_address}
  Click Element						${pickup_location_input}
  Sleep  10s
  Execute Javascript    	$($('${pickup_google_item}')[0]).click()
  Sleep  5s
	Click Element					${pickup_now}
	Input Text							${sender_name}							${settinguser_name}
  Input Text							${sender_phone}							${user_phone}
  Input Text							${sender_email}							${settinguser_email}
	Click Element    				${submit_pickup}
	Sleep  5s
 	Element Should Be Visible				${dropoff_modal}
 	Element Should Be Visible       ${parcel_modal}
