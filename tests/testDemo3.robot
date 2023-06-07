*** Settings ***
Documentation   To validate the Login form
Library    SeleniumLibrary
Library    String
Library    Collections
Test Setup    open the browser with the Mortgage payment url
Test Teardown    Close Browser
Resource    resource.robot



*** Variables ***
${Error_Message_Login}      css:.alert-danger
${email}


*** Test Cases ***
Validate Child window Functionality
    Select the link of child window
    Verify the user is Switched to Child window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email

*** Keywords ***
 Select the link of child window
    Click Element    css:.blinkingText
    Sleep            5

Verify the user is Switched to Child window
    Switch Window       NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

Grab the Email id in the Child Window
    ${text}=   Get Text     css:.red
    Log    ${text}
    @{words}=   Split String    ${text}     at
    Log     ${words}
    ${text_split}=  Get From List    ${words}   1
    Log     ${text_split}
    @{words_2}=   Split String    ${text_split}
    Log     ${words_2}
    ${email}=     Get From List    ${words_2}   0
    Log    ${email}
    Set Global Variable    ${email}

Switch to Parent window and enter the Email
    Switch Window    MAIN
    Title Should Be  LoginPage Practise |  Rahul Shetty Academy
    Input Text       id:username    ${email}












