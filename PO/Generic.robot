*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...
...              The system specific keywrds created here from our own
...              domain specific language. They utilize keywords provided
...              by the imported SeleniumLibrary.
Library          SeleniumLibrary

*** Variables ***
${user_name}            rahulshettyacademy
${invalid_password}     11223344
${valid_password}       learning

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome  executable_path=C:\browswedrivers\chromedriver
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Close browser session
    Close Browser