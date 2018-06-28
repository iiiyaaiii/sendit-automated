*** Settings ***
Suite Setup
Suite Teardown		Close All Browsers
Library				Selenium2Library
Resource 			keyword_Logout.robot
Resource 			keyword_Login.robot
Resource			globalElement.robot

*** Test Cases ***
Logout from 2Stage successfully
	Check user already login then can logout successfully

