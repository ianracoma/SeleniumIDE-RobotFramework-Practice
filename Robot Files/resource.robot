*** Settings ***
Documentation   A resource file for the login test suite
Library         SeleniumLibrary

*** Variables ***
${LOGIN URL}            https://www.saucedemo.com/
${BROWSER}              firefox
${DELAY}                0.25
${VALID USER}           standard_user
${INVALID USER}         locked_out_user
${PROBLEM USER}         problem_user
${UNIVERSAL PASSWORD}   secret_sauce
${WRONG PASSWORD}       wrong_password

# Item image src paths
${IMAGE 0 SRC}          /static/media/bike-light-1200x1500.a0c9caae.jpg
${IMAGE 1 SRC}          /static/media/bolt-shirt-1200x1500.c0dae290.jpg
${IMAGE 2 SRC}          /static/media/red-onesie-1200x1500.1b15e1fa.jpg
${IMAGE 3 SRC}          /static/media/red-tatt-1200x1500.e32b4ef9.jpg
${IMAGE 4 SRC}          /static/media/sauce-backpack-1200x1500.34e7aa42.jpg
${IMAGE 5 SRC}          /static/media/sauce-pullover-1200x1500.439fc934.jpg

# Item titles

${ITEM 0 TITLE}          Sauce Labs Bike Light
${ITEM 1 TITLE}          Sauce Labs Bolt T-Shirt
${ITEM 2 TITLE}          Sauce Labs Onesie
${ITEM 3 TITLE}          Test.allTheThings() T-Shirt (Red)
${ITEM 4 TITLE}          Sauce Labs Backpack
${ITEM 5 TITLE}          Sauce Labs Fleece Jacket

# Image and Title xpaths (for absolute positions)
${FIRST TITLE XPATH}    xpath:/html/body/div/div/div/div[2]/div/div/div/div[1]/div[2]/div[1]/a/div 
${FIRST IMAGE XPATH}    xpath:/html/body/div/div/div/div[2]/div/div/div/div[1]/div[1]/a/img

${SECOND TITLE XPATH}   xpath:/html/body/div/div/div/div[2]/div/div/div/div[2]/div[2]/div[1]/a/div
${SECOND IMAGE XPATH}   xpath:/html/body/div/div/div/div[2]/div/div/div/div[2]/div[1]/a/img

${THIRD TITLE XPATH}    xpath:/html/body/div/div/div/div[2]/div/div/div/div[3]/div[2]/div[1]/a/div 
${THIRD IMAGE XPATH}    xpath:/html/body/div/div/div/div[2]/div/div/div/div[3]/div[1]/a/img

${FOURTH TITLE XPATH}   xpath:/html/body/div/div/div/div[2]/div/div/div/div[4]/div[2]/div[1]/a/div 
${FOURTH IMAGE XPATH}   xpath:/html/body/div/div/div/div[2]/div/div/div/div[4]/div[1]/a/img

${FIFTH TITLE XPATH}    xpath:/html/body/div/div/div/div[2]/div/div/div/div[5]/div[2]/div[1]/a/div 
${FIFTH IMAGE XPATH}    xpath:/html/body/div/div/div/div[2]/div/div/div/div[5]/div[1]/a/img

${SIXTH TITLE XPATH}    xpath:/html/body/div/div/div/div[2]/div/div/div/div[6]/div[2]/div[1]/a/div 
${SIXTH IMAGE XPATH}    xpath:/html/body/div/div/div/div[2]/div/div/div/div[6]/div[1]/a/img

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

Home Page Is Correct
    Page Should Contain Element   css:*[src="/static/media/sauce-backpack-1200x1500.34e7aa42.jpg"]

Input Username
    [Arguments]    ${username}
    Input Text    user-name    ${username}

Input Pass
    [Arguments]    ${password}
    Input Password    password    ${password}

Submit Credentials
    Click Button    login-button

Successful Login
    Open Browser To Login Page
    Input Username  ${VALID USER}
    Input Pass  ${UNIVERSAL PASSWORD}
    Submit Credentials
    Home Page Should Be Open
    Home Page Is Correct