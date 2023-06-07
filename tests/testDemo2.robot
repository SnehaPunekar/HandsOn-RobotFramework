*** Settings ***
#Documentation   To validate the Login form
Library    SeleniumLibrary
Library    Collections
Test Setup       open the browser with the Mortgage payment url
#Test Teardown    Close Browser Session
Resource         resource.robot


*** Variables ***
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}      css:.nav-link

*** Test Cases ***
Validate Successful Login

    Fill the login Form     ${user_name}    ${invalid_password}
    wait until Element Is located In The Page   ${Error_Message_Login}
    verify error message is correct

Validate Cards display in the shopping page
    Fill The Login Form    ${user_name}     ${valid_password}
    Wait Until Element Is Visible       ${Shop_page_load}
    Verify Card Titles In The Shop Page
    Select The Card    Nokia Edge


Select the Form and navigate to Child window

    Fill the Login Details and select the User option


*** Keywords ***

Fill the login form
    [Arguments]     ${username}   ${password}
    Input Text        id:username   ${username}
    Input Password    id:password   ${password}
    Click Button      signInBtn

wait until Element is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible   ${element}

verify error message is correct
    ${result}=  Get Text    ${Error_Message_Login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Verify Card titles in the Shop page
    @{expectedList} =   Create List  iphone X  Samsung Note 8  Nokia Edge  Blackberry
    ${elements} =     Get Webelements    css:.card-title
    @{actualList} =   Create List

    FOR     ${element}     IN   @{elements}
            Log     ${element.text}
            Append To List      ${actualList}   ${element.text}
    END

    Lists Should Be Equal    ${expectedList}    ${actualList}

Select the Card
    [Arguments]    ${cardName}
    ${elements} =     Get Webelements    css:.card-title
    ${index}=   Set Variable    1
    FOR     ${element}     IN   @{elements}
            Exit For Loop If    '${cardname}' == '${element.text}'
            ${index}=  Evaluate     ${index} + 1
    END

  Click Button   xpath:(//*[@class='card-footer'])[${index}]/button

Fill the Login Details and select the User option

        Input Text        id:username   rahulshettyacademy
        Input Password    id:password   learning
        Click Element     css:input[value='user']
        Wait Until Element Is Visible    css:.modal-body
        Click Element     okayBtn
        Wait Until Element Is Not Visible  css:.modal-body
        Select From List By Value       css:select.form-control     teach
        Select Checkbox    terms
        Checkbox Should Be Selected    terms





