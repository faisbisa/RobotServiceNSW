*** Settings ***
Documentation       Base releted keywords
Library             SeleniumLibrary

*** Variables ***
${LOGIN_URL}     https://www.service.nsw.gov.au/

*** Keywords ***
Open Firefox Browser
    [Documentation]     Keyword to open browser Firefox
    Open Browser        browser=Firefox         url=${LOGIN_URL}