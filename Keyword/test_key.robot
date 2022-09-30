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