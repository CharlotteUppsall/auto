*** Settings ***
Documentation  Test cases for assignment in the course 'Automatiserad testning'
...  Testing car rental web page rental1.infotiv.net

Resource  ../Resources/keywords.robot

Library  SeleniumLibrary
Library  robot.libraries.DateTime

Suite Setup  Begin Web Test

Test Setup  Navigate To Infotiv Car Rental Web Page

Suite Teardown  End Web Test

*** Variables ***
${URL}  http://rental1.infotiv.net/




*** Test Cases ***
Open Web Page And Verify
    [Documentation]  Undefined basic requirement: Web page is up and running.
    [Tags]  Smoke
    Navigate To Infotiv Car Rental Web Page

Check Default Date On Start Page
    [Documentation]  Requirement: On the date selection page[...]. The default values will always be put as todays date.
    [Tags]  DateSelection
    Compare Date Value On Page With Current Date

Choose Date And Continue To Car Selection Page
    [Documentation]  Requirement: If valid dates are inputted, the Continue button will take the user to the car selection page.
    [Tags]  DateSelection
    Choose current date and continue

Check System Alert When User Chooses Filters Without Valid Results
    [Documentation]  Requirement: If no car meets the selected filter criterias, a message asks the user to try a different selection
    [Tags]  CarSelection
    Choose current date and continue
    Filter Make Volvo
    Filter Two Passengers
    Wait Until Page Contains  No cars with selected filters. Please edit filter selection

Check Alert Message Asking User To Sign In Before Booking Car
    [Documentation]  Requirement: If the user is not signed in when pressing the book button, an alert box will appear asking the user to sign in before proceeding.
    [Tags]  CarSelection
    Choose current date and continue
    Filter Make Volvo
    Filter Five Passengers
    Book First Car In Filtered List
    Alert Should Be Present  You need to be logged in to continue.