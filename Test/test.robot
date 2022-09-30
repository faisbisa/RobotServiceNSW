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