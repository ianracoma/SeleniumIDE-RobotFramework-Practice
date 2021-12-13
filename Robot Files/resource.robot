*** Settings ***
Documentation   A resource file for the login test suite
Library         SeleniumLibrary

*** Variables ***
${LOGIN URL}            https://www.saucedemo.com/
${BROWSER}              firefox
${DELAY}                0.5
${VALID USER}           standard_user
${INVALID USER}         locked_out_user
${PROBLEM USER}         problem_user
${UNIVERSAL PASSWORD}   secret_sauce

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Element    login-button

Home Page Should Be Open
    Element Text Should Be    class:title    PRODUCTS

Input Username
    [Arguments]    ${username}
    Input Text    user-name    ${username}

Input Pass
    [Arguments]    ${password}
    Input Password    password    ${password}

Submit Credentials
    Click Button    login-button
