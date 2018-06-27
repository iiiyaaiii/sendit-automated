*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Resource			globalElement.robot
Resource			keyword_Login.robot
Resource			keyword_Settings.robot

*** Test Cases ***
Create Pickup successful
	Open Ondemand website
	Login to Ondemand			   ${username}				${password}
  Wait Until Element Is Visible     ${pickup_tab}     10s
	Sleep  5s
  Input Text               ${pickup_location_input}       Asoke Tower
	Click Element						${pickup_location_input}
  Sleep  10s
	Execute Javascript    	$($('${pickup_google_item}')[0]).click()
	Sleep  5s
  Click Element            ${pickup_time_input}
  Sleep  5s
  Element Should Be Visible         ${pickup_time_modal}
	Click Element											${nextmonth}
	Element Should Be Visible    			${selected_date}
	Click Element											${submit_datetime}
	Wait Until Element Is Visible			${clock} 				10s
	Click Element    				${hr_11}
	Sleep  1s
	Click Element						${submit_datetime}
	Sleep  1s
	Click Element						${min_30}
	Click Element						${submit_datetime}
	Input Text							${sender_name}							${settinguser_name}
	Input Text							${sender_phone}							${user_phone}
	Input Text							${sender_email}							${settinguser_email}
	Input Text							${sender_comment}						18th floor
	Click Element    				${submit_pickup}
	Sleep  5s
	Element Should Be Visible				${dropoff_modal}
	Element Should Be Visible       ${parcel_modal}
