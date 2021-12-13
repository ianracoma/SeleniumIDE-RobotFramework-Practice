*** Settings ***
Documentation   A test suite for different sorting criterion
...
...             This suite tests for the following scenarios
...             - Sorted name from A to Z
...             - Sorted name from Z to A
...             - Sorted by lowest to highest price
...             - Logged by highest to lowest price
Resource         resource.robot

*** Test Cases ***
Sort Product Name (A to Z)
    # Perform a Successful Login
    Successful Login
    # Sort the list from A to Z
    Select From List By Value   css:*[data-test="product_sort_container"]   az
    # Assert that the page is properly sorted
    Element Text Should Be    ${FIRST TITLE XPATH}     ${ITEM 4 TITLE}
    Element Attribute Value Should Be   ${FIRST IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 4 SRC}
    Element Text Should Be    ${SECOND TITLE XPATH}     ${ITEM 0 TITLE}
    Element Attribute Value Should Be   ${SECOND IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 0 SRC}
    Element Text Should Be    ${THIRD TITLE XPATH}     ${ITEM 1 TITLE}
    Element Attribute Value Should Be   ${THIRD IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 1 SRC}
    Element Text Should Be    ${FOURTH TITLE XPATH}     ${ITEM 5 TITLE}
    Element Attribute Value Should Be   ${FOURTH IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 5 SRC}
    Element Text Should Be    ${FIFTH TITLE XPATH}     ${ITEM 2 TITLE}
    Element Attribute Value Should Be   ${FIFTH IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 2 SRC}
    Element Text Should Be    ${SIXTH TITLE XPATH}     ${ITEM 3 TITLE}
    Element Attribute Value Should Be   ${SIXTH IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 3 SRC}
    # Close the browser
    [Teardown]    Close Browser

Sort Product Name (Z to A)
    # Perform a Successful Login
    Successful Login
    # Sort the list from Z to Z
    Select From List By Value   css:*[data-test="product_sort_container"]   za
    # Assert that the page is properly sorted
    Element Text Should Be    ${FIRST TITLE XPATH}     ${ITEM 3 TITLE}
    Element Attribute Value Should Be   ${FIRST IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 3 SRC}
    Element Text Should Be    ${SECOND TITLE XPATH}     ${ITEM 2 TITLE}
    Element Attribute Value Should Be   ${SECOND IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 2 SRC}
    Element Text Should Be    ${THIRD TITLE XPATH}     ${ITEM 5 TITLE}
    Element Attribute Value Should Be   ${THIRD IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 5 SRC}
    Element Text Should Be    ${FOURTH TITLE XPATH}     ${ITEM 1 TITLE}
    Element Attribute Value Should Be   ${FOURTH IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 1 SRC}
    Element Text Should Be    ${FIFTH TITLE XPATH}     ${ITEM 0 TITLE}
    Element Attribute Value Should Be   ${FIFTH IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 0 SRC}
    Element Text Should Be    ${SIXTH TITLE XPATH}     ${ITEM 4 TITLE}
    Element Attribute Value Should Be   ${SIXTH IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 4 SRC}
    # Close the browser
    [Teardown]    Close Browser

Sort Product Price (Low to High)
    Successful Login
    Select From List By Value   css:*[data-test="product_sort_container"]   lohi
    # Assert that the page is properly sorted
    Element Text Should Be    ${FIRST TITLE XPATH}     ${ITEM 2 TITLE}
    Element Attribute Value Should Be   ${FIRST IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 2 SRC}
    Element Text Should Be    ${SECOND TITLE XPATH}     ${ITEM 0 TITLE}
    Element Attribute Value Should Be   ${SECOND IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 0 SRC}
    Element Text Should Be    ${THIRD TITLE XPATH}     ${ITEM 1 TITLE}
    Element Attribute Value Should Be   ${THIRD IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 1 SRC}
    Element Text Should Be    ${FOURTH TITLE XPATH}     ${ITEM 3 TITLE}
    Element Attribute Value Should Be   ${FOURTH IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 3 SRC}
    Element Text Should Be    ${FIFTH TITLE XPATH}     ${ITEM 4 TITLE}
    Element Attribute Value Should Be   ${FIFTH IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 4 SRC}
    Element Text Should Be    ${SIXTH TITLE XPATH}     ${ITEM 5 TITLE}
    Element Attribute Value Should Be   ${SIXTH IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 5 SRC}
    # Close the browser
    [Teardown]    Close Browser

Sort Product Price (High to Low)
    Successful Login
    Select From List By Value   css:*[data-test="product_sort_container"]   hilo
    # Assert that the page is properly sorted
    Element Text Should Be    ${FIRST TITLE XPATH}     ${ITEM 5 TITLE}
    Element Attribute Value Should Be   ${FIRST IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 5 SRC}
    Element Text Should Be    ${SECOND TITLE XPATH}     ${ITEM 4 TITLE}
    Element Attribute Value Should Be   ${SECOND IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 4 SRC}
    Element Text Should Be    ${THIRD TITLE XPATH}     ${ITEM 1 TITLE}
    Element Attribute Value Should Be   ${THIRD IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 1 SRC}
    Element Text Should Be    ${FOURTH TITLE XPATH}     ${ITEM 3 TITLE}
    Element Attribute Value Should Be   ${FOURTH IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 3 SRC}
    Element Text Should Be    ${FIFTH TITLE XPATH}     ${ITEM 0 TITLE}
    Element Attribute Value Should Be   ${FIFTH IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 0 SRC}
    Element Text Should Be    ${SIXTH TITLE XPATH}     ${ITEM 2 TITLE}
    Element Attribute Value Should Be   ${SIXTH IMAGE XPATH}  src   https://www.saucedemo.com${IMAGE 2 SRC}
    # Close the browser
    [Teardown]    Close Browser