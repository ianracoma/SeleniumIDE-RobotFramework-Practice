*** Settings ***
Documentation   A test suite for different login conditions
...
...             This suite tests for the following scenarios
...             - Successful user login
...             - Unsuccessful user login by locked out user
...             - Incorrect Password
...             - Logged in as a problem user with a broken inventory page
Resource         resource.robot

*** Test Cases ***
Valid login
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # input username
    Input Username    ${VALID USER}
    # input password
    Input Pass    ${UNIVERSAL PASSWORD}
    # click login button
    Submit Credentials
    # should be open in products page
    Home Page Should Be Open
    # close browser
    [Teardown]    Close Browser

Invalid Login
    Open Browser To Login Page
    # input username
    Input Username    ${INVALID USER}
    # input password
    Input Pass    ${UNIVERSAL PASSWORD}
    # click login button
    Submit Credentials
    # Error message close should be present
    Page Should Contain Element   class:error-button
    # Error message should be "Epic sadface: Sorry, this user has been locked out."
    Element Text Should Be    data-test:error    Epic sadface: Sorry, this user has been locked out.
    # close browser
    [Teardown]    Close Browser
