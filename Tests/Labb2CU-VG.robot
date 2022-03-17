*** Settings ***
Documentation  Test cases for assignment in the course 'Automatiserad testning'
...  Testing car rental web page rental1.infotiv.net

Resource  ../Resources/keywords.robot

Library  SeleniumLibrary

Test Setup  Begin Web Test

Test Teardown   Check If Car Is UnBooked

Suite Teardown  End Web Test

*** Variables ***
${URL}  http://rental1.infotiv.net/

*** Test Cases ***
Book A Car On Existing User
    [Documentation]   Gherkin based BDD test of booking process on an existing user
    [Tags]  VG_CU

    Given User is on Car Rental Page
    And User logs in with valid username and password
    And User is logged in on Car Selection Page
    And User chooses a valid date on Date Selection Page

    When User clicks buttom to book a Audi Q7
    And User enters a valid Card

    Then User get booking message
    And User clicks button My page
    And User clicks buttom Cancel booking
    And User get unbooked message
