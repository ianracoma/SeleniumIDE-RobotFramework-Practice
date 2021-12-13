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
Successful User Login
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
    # Products page should not be broken
    Home Page Is Correct
    # close browser
    [Teardown]    Close Browser

Unsuccessful Login by Locked Out User
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
    Element Text Should Be    css:*[data-test=error]    Epic sadface: Sorry, this user has been locked out.
    # close browser
    [Teardown]    Close Browser

Incorrect Password
    Open Browser To Login Page
    # input username
    Input Username  ${VALID USER}
    # input password
    Input Pass  ${WRONG PASSWORD}
    # click login button
    Submit Credentials
    # Error message close should be present
    Page Should Contain Element   class:error-button
    # Error message should be "Epic sadface: Username and password do not match any user in this service."
    Element Text Should Be    css:*[data-test=error]    Epic sadface: Username and password do not match any user in this service
    # close browser
    [Teardown]    Close Browser

Problem User
    Open Browser To Login Page
    # input username
    Input Username  ${PROBLEM USER}
    # input password
    Input Pass  ${UNIVERSAL PASSWORD}
    # click login button
    Submit Credentials
    # Home page should be open
    Home Page Should Be Open
    # Inventory pictures must not be found
    Page Should Not Contain Image   css:*[src="${IMAGE 0 SRC}"]
    Page Should Not Contain Image   css:*[src="${IMAGE 1 SRC}"]
    Page Should Not Contain Image   css:*[src="${IMAGE 2 SRC}"]
    Page Should Not Contain Image   css:*[src="${IMAGE 3 SRC}"]
    Page Should Not Contain Image   css:*[src="${IMAGE 4 SRC}"]
    Page Should Not Contain Image   css:*[src="${IMAGE 5 SRC}"]
    # close browser
    [Teardown]  Close Browser