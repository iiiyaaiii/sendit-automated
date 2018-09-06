*** Settings ***
Library                 AppiumLibrary
Suite Teardown          Close All Applications

*** Variables ***
${REMOTE_URL}   http://127.0.0.1:4723/wd/hub

*** Keywords ***
TestOnDemand-Login
    Open Application   ${REMOTE_URL}     platformName=Android    platformVersion=8.1.0      deviceName=ENU7N15B06004732        appPackage=com.sendit.driver_androidstaging        appActivity=com.sendit.driver_androidlib.LandingPage.SendIT
    # Sleep  5s
    # Click Element      id=com.sendit.driver_androidstaging:id/txt_later_download
    Sleep  1s
    Click Element      id=com.android.packageinstaller:id/permission_allow_button
    Sleep  1s
    Click Element      id=com.android.packageinstaller:id/permission_allow_button
    Sleep  1s
    Click Element      id=com.android.packageinstaller:id/permission_allow_button
    Sleep  1s
    Click Element      id=com.android.packageinstaller:id/permission_allow_button
    Sleep  1s
    Click Element      id=com.android.packageinstaller:id/permission_allow_button
    Sleep    1s
    Click Element      id=com.sendit.driver_androidstaging:id/buttonLogIn
    Click Element      id=idPhoneNumber
      Sleep    1s
    Input Text         id=idPhoneNumber    2222222222222
      Sleep    1s
    Click Element      id=com.sendit.driver_androidstaging:id/idPassword
      Sleep    1s
    Input Text         id=com.sendit.driver_androidstaging:id/idPassword    12345678
      Sleep    1s
    Click Element      id=com.sendit.driver_androidstaging:id/idLogIn

    # Element Text Should Be      id=result     10
    Capture Page Screenshot     Ondemand_result.png

TestOnDemand-Assignments

    Wait Until Element Is Visible    id=idButtonImageAssignments    1000s
    Click Element      id=idButtonImageAssignments
    Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ListView/android.widget.RelativeLayout[1]/android.widget.FrameLayout/android.widget.LinearLayout   1000s
    Click Element      xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ListView/android.widget.RelativeLayout[1]/android.widget.FrameLayout/android.widget.LinearLayout
        Sleep    5s
    Click Element      id=button1
        Sleep    5s
    Click Element      id=idJobPickedUp
        Sleep    5s
    Click Element      id=button1
        Sleep    5s
    Click Element      id=idJobPickedUp
        Sleep    5s
    Click Element      id=button1
        Sleep    5s
    Click Element      id=button1
        Sleep    5s
    Click Element      id=idJobCheckIn
        Sleep    5s
    Click Element      id=button1
        Sleep    5s
    Click Element      id=button1
        Sleep    5s
    Click Element      id=idJobDroppedOff
        Sleep    5s
    Click Element      id=button1
        Sleep    5s
    Click Element      id=shutter_button
        Sleep    5s
    Click Element      id=shutter_button
        Sleep    5s
    Click Element      id=btn_upload
        Sleep    5s
    Click Element      id=btn_ok
        Sleep    5s
    Click Element      id=button1
        Sleep    5s
    Click Element      id=button1
        Sleep    5s


TestOnDemand-EARNINGS
    Wait Until Element Is Visible    id=idButtonImageEarnings    1000s
    Click Element      id=idButtonImageEarnings
TestOnDemand-EARNINGS-Week
  Wait Until Element Is Visible    id=buttonWeek   1000s
  Click Element      id=buttonWeek
TestOnDemand-EARNINGS-Month
  Wait Until Element Is Visible    id=buttonMonth  1000s
  Click Element      id=buttonMonth
TestOnDemand-EARNINGS-Graph
  Wait Until Element Is Visible    id=action_chart  1000s
  Click Element      id=action_chart


TestOnDemand-Profile
  Wait Until Element Is Visible    id=idButtonImageProfile    1000s
  Click Element      id=idButtonImageProfile

TestOnDemand-Tutorial
    Wait Until Element Is Visible    id=idButtonImageTutorial   1000s
    Click Element      id=idButtonImageTutorial
    Sleep    2s
    Wait Until Element Is Visible    id=buttonNext  1000s
    Click Element      id=buttonNext
    Sleep    2s
    Wait Until Element Is Visible    id=buttonNext  1000s
    Click Element      id=buttonNext

TestOnDemand-Terms
    Wait Until Element Is Visible    id=idButtonImageTerms   1000s
    Click Element      id=idButtonImageTerms



TestOnDemand-Setting
    Wait Until Element Is Visible    id=menu_settings  1000s
    Click Element      id=menu_settings
TestOnDemand-Setting-ChangePassword
    Wait Until Element Is Visible    id=idChangePassword  1000s
    Click Element      id=idChangePassword
    Sleep    1s
    Click Element      id=idOldPassword
    Sleep    1s
    Input Text         id=idOldPassword   12345678
    Sleep    1s
    Input Text         id=idNewPassword   12345678
    Sleep    1s
    Input Text         id=idConfirmPassword  12345678
    Sleep    1s
    Input Text         id=menu_ok
TestOnDemand-Setting-LanguageOptions
    Wait Until Element Is Visible    id=idLanguageOptions  1000s
    Click Element      id=idLanguageOptions
    Sleep    1s
TestOnDemand-Setting-LanguageOptions-TH
    Wait Until Element Is Visible    id=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.support.v7.widget.LinearLayoutCompat/android.widget.FrameLayout/android.widget.ListView/android.widget.TextView[1] 1000s
    Click Element                    id=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.support.v7.widget.LinearLayoutCompat/android.widget.FrameLayout/android.widget.ListView/android.widget.TextView[1]
    Sleep    1s
TestOnDemand-Setting-LanguageOptions-EN
    Wait Until Element Is Visible    id=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.support.v7.widget.LinearLayoutCompat/android.widget.FrameLayout/android.widget.ListView/android.widget.TextView[2] 1000s
    Click Element                    id=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.support.v7.widget.LinearLayoutCompat/android.widget.FrameLayout/android.widget.ListView/android.widget.TextView[2]
    Sleep    1s





*** Test Cases ***
Test Case Login
    TestOnDemand-Login

Test Case Assignments
    TestOnDemand-Login
    TestOnDemand-Assignments

Test Case EARNINGS
    TestOnDemand-Login
    TestOnDemand-EARNINGS
Test Case EARNINGS by Week
    TestOnDemand-Login
    TestOnDemand-EARNINGS
    TestOnDemand-EARNINGS-Week
Test Case EARNINGS by Month
    TestOnDemand-Login
    TestOnDemand-EARNINGS
    TestOnDemand-EARNINGS-Month
Test Case EARNINGS by Graph
    TestOnDemand-Login
    TestOnDemand-EARNINGS
    TestOnDemand-EARNINGS-Graph

Test Case Profile
    TestOnDemand-Login
    TestOnDemand-Profile

Test Case Tutorial
    TestOnDemand-Login
    TestOnDemand-Tutorial

Test Case Terms
    TestOnDemand-Login
    TestOnDemand-Terms


Test Case Setting ChangePassword
    TestOnDemand-Setting
    TestOnDemand-Setting-ChangePassword

Test Case Setting LanguageOptions-EN
    TestOnDemand-Setting
    TestOnDemand-Setting-LanguageOptions
    TestOnDemand-Setting-LanguageOptions-EN

Test Case Setting LanguageOptions-TH
    TestOnDemand-Setting
    TestOnDemand-Setting-LanguageOptions
    TestOnDemand-Setting-LanguageOptions-TH
