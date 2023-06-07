*** Settings ***
Documentation    All the page objects and keywords of landing page.
Library          SeleniumLibrary
Library          Collections


*** Variables ***
${Shop_page_load}      css:.nav-link

*** Keywords ***

wait until Element is located in the page
    Wait Until Element Is Visible   ${Shop_page_load}

Verify Card Titles In The Shop Page
    @{expectedList} =   Create List    iphone X     Sanmsung Note 8     Nokia Edge      Blackberry
    ${elements} =       Get Webelements    css:.card-title
    @{actualList} =     Create List
    FOR    ${element}   IN      ${elements}:
        Append To List      ${actualList}       ${element.text}
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
