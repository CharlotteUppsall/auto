*** Keywords ***
Begin Web Test
    Open Browser  about:blank  chrome
    Maximize Browser Window

End Web Test
    Close Browser

Navigate To Infotiv Car Rental Web Page
    Go To  ${URL}
    Wait Until Page Contains  When do you want to make your trip?

Compare Date Value On Page With Current Date
    ${yyyy}  ${mm}  ${dd}=  Get time  year,month,day
    ${dateshown}=  Get Value  id:start
    Should be Equal  ${dateshown}  ${yyyy}-${mm}-${dd}

Choose current date and continue
    Compare Date Value On Page With Current Date
    Click Element  id:continue
    Wait Until Page Contains  What would you like to drive?

Filter Make Volvo
    Click Element  id:filterMakeHolder
    Click Element  id:ms-opt-4

Filter Two Passengers
    Click Element  id:filterPassHolder
    Click Element  id:ms-opt-5

Filter Five Passengers
    Click Element  id:filterPassHolder
    Click Element  id:ms-opt-6

Book First Car In Filtered List
    Wait Until Page Contains Element  id:carSelect1
    Click Element  id:carSelect1

#GHERKIN TEST CASE
User is on Car Rental Page
        Go To  ${URL}
        Wait Until Page Contains  When do you want to make your trip?

User logs in with valid username and password
       Input Text   id:email   anna.larson@amail.com
       Input Text   id:password   robot14
       Click Element  id:login

User is logged in on Car Selection Page
       Wait Until Page Contains   You are signed in as Anna

User chooses a valid date on Date Selection Page
       Click Element   id:continue
       Wait Until Page Contains   What would you like to drive?


User clicks buttom to book a Audi Q7
       Click Element   id:filterMakeHolder
       Click Element   id:ms-opt-1
       Click Element   id:filterPassHolder
       Click Element   id:ms-opt-6
       Wait Until Page Contains Element  id:carSelect3
       Click Element   id:carSelect3


User enters a valid Card
       Wait Until Page Contains Element   id:cardNum
       Input Text   id:cardNum   9137523488455678
       Input Text   id:fullName   Anna Larsson
       Click Element  id:month1
       Click Element  id:month2023
       Input Text   id:cvc   533
       Click Element   id:confirm

User get booking message
       Wait Until Page Contains   You can view your booking on your page

User clicks button My page
       Click Element   id:mypage

User clicks buttom Cancel booking
       Click Element   id:unBook1
       Alert Should Be Present

User get unbooked message
       Wait Until Page Contains   has been Returned
       Click Element   id:mypage

Check if car is unbooked
       Wait Until Page Contains   You have no bookings