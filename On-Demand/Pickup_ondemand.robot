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
  Input Text               css=input[placeholder="Pickup Location - Type to search"]       Asoke Tower
  Sleep  5s
  Click Element            css=input[placeholder="Pickup time"]
  Sleep  5s
  Element Should Be Visible          css=md-dialog-content.dtp-content
