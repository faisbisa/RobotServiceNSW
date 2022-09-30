# RobotServiceNSW
Exercise UI Automation Service NSW

HOW TO BUILD :

1. If you already have Python with pip installed, you can simply run:
   pip install robotframework
   
2. Ready to make test step :
  - Navigate To Open URL https://www.service.nsw.gov.au/
  - Validate the navigation to appropriate page
  - Verify Scroll Down
  - User search by suburb
  - Verify after search by suburb  "Sydney 2000"
  - It should use service centre named as "Marrickville Service Centre"
  
 3. Applied in the form of a Robot script with the POM method:
  - Base.Robot :
    *** Settings ***
Documentation       Base releted keywords
Library             SeleniumLibrary

*** Variables ***
${LOGIN_URL}     https://www.service.nsw.gov.au/

*** Keywords ***
Open Firefox Browser
    [Documentation]     Keyword to open browser Firefox
    Open Browser        browser=Firefox         url=${LOGIN_URL}
    
 - Script for test steps test.robot :
  *** Settings ***
Documentation                           Search for "Apply for a number plate"
Resource                                ../base.robot
Resource                                ../Keyword/test_key.robot
Suite Setup                             base.Open Firefox Browser
Suite Teardown                          Close Browser
Library                                 SeleniumLibrary

*** Variable ***
${suburb1}                             Sydney 2000
${suburb2}                             Sydney Domestic Airport 2020 

*** Test Cases ***
Search by Suburb Sydney 2000
        [Documentation]                 Test to Search by Suburb Sydney 2000
        Navigate To Open URL
        Sleep               3s
        User click Find Locations
        Sleep               5s
        Validate the navigation to appropriate page
        Verify Scroll Down
        Verify Scroll
        Sleep               5s
        User search by suburb
        Sleep               5s
        Verify after search by suburb
        Sleep               3s
        Verify Scroll Down1
        Verify Scroll After Search
        
  - Sricpt for keyword test_key.robot :
    *** Settings ***
Documentation                           Login releted keywords
Variables                               test_loc.yaml

*** Variables ***
${LOGIN_URL}                            https://www.service.nsw.gov.au/
${suburb1}                             Sydney 2000
${suburb2}                             Sydney Domestic Airport 2020 

*** Keywords ***
Navigate To Open URL
    [Documentation]                 Keyword to Navigate To Open URL
    Go To                           ${LOGIN_URL}

Verify Current Url Is Open Url
    [Documentation]                 Keyword to verify current url is login url
    Wait Until Element is Visible     ${verify_openURL}        

User click Find Locations
    [Documentation]                 Keyword to User click Find Locations
    Click Element                   ${find_loc}
        
Validate the navigation to appropriate page
    [Documentation]                 Keyword to Validate the navigation to appropriate page
    Wait Until Element is Visible     ${verify_findLoc} 

Verify Scroll Down
    [Documentation]                 Keyword to verify scrool re new password        
    Execute Javascript              window.scrollTo(0,669)  
    sleep                           1s   

Verify Scroll Down1
    [Documentation]                 Keyword to verify scrool re new password        
    Execute Javascript              window.scrollTo(0,277)  
    sleep                           1s

Verify Scroll
    [Documentation]                 Keyword to verify scrool re new password
    Wait Until Element is Visible   ${inputSearch}
   
Verify Scroll After Search
    [Documentation]                 Keyword to verify scrool re new password
    Wait Until Element is Visible   ${verifyscroll1}

User search by suburb
    [Documentation]                 Keyword to User search by suburb
    # [Arguments]                     ${suburb1}
    Wait Until Element Is Visible   ${inputSearch} 
    Input Text                      ${inputSearch}              ${suburb1}  
    Press Keys                      None            ENTER               
    Sleep                           5s

Verify after search by suburb
    [Documentation]                 Keyword to verify scrool re new password
    Wait Until Element is Visible   ${verifyAfterSearch}

Should use service centre named as "Marrickville Service Centre"
    [Documentation]                 Keyword to verify scrool re new password
    Wait Until Element is Visible   ${Marrickville_SC}
 
 - locator : 
 
  verify_openURL: //*[@class="LogoLockUp__nswLogo-wS-fVG2tbE"]
find_loc: (//*[@class="NavLink__listItem-VYVwsaNaTG"])[5]
verifyscroll1: (//*[@data-outage-message="info"])[1]
verifyscroll2: (//*[@data-outage-message="info"])[2]
verify_findLoc: //*[@id="page-title"]
verifyScroll: (//*[@class="location__title"])[5]
verifyAfterSearch: (//*[@class="is-excluded"])[2]
inputSearch: //*[@id="locatorTextSearch"]
Marrickville_SC: //*[@href="/service-centre/marrickville-service-centre"]


2. For Run Script

  - Open terminal input robot name_test
    robot test.robot
    <img width="924" alt="image" src="https://user-images.githubusercontent.com/19841139/193172214-76cf1a43-8269-411e-af08-579104bf4e27.png">
    log report :
    file:///C:/Users/admin/Downloads/Test%20Log_servicensw.html
  - for the final test results do not get a value "Marrickville Service Centre" search by suburb  "Sydney 2000" but  “Wynyard Service Centre”

<img width="488" alt="image" src="https://user-images.githubusercontent.com/19841139/193173470-fd4bf1be-be2a-4258-ab93-db95f2d91a7a.png">

    
  
