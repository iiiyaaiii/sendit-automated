*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Library				DateTime
Resource			globalElement.robot
Resource      Input_data.robot
Resource			keyword_Login.robot
Resource			keyword_Settings.robot
Resource			keyword_Pickup.robot
Resource			keyword_Dropoff.robot
Resource      keyword_Parcel.robot
Resource      keyword_Confirmation.robot
Resource      keyword_Payment.robot
Resource      keyword_Tracking.robot

*** Test Cases ***
Search tracking by ID
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Sleep  3s
  Click Link               ${tracking_link_menu}
  Sleep  3s
  ${orderid} =            Get Text        //*[@id="list-view"]/div/ul/li[1]/div[1]/small[1]/b
  Log To Console          ${orderid}
  Input Text              ${search_tracking}      ${orderid}

Search tracking by Name
  Open Ondemand website
  Login to Ondemand			   ${username}				${password}
  Sleep  3s
  Click Link               ${tracking_link_menu}
  Sleep  3s
  Input Text               ${search_tracking}      ${contact_name1}
  Check search results display correctly           ${contact_name1}
