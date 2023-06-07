*** Settings ***
Documentation   To validate the Login form
Library    SeleniumLibrary
Library    Collections
Library    ../customLibraries/Shop.py
Test Setup       open the browser with the Mortgage payment url
#Test Teardown    Close Browser Session
Resource            ../PO/Generic.robot
Resource            ../PO/LandingPage.robot
Resource            ../PO/ShopPage.robot


*** Variables ***

@{listOfProducts}      Nokia Edge   Blackberry

*** Test Cases ***
Validate Successful Login
    LandingPage.Fill The Login Form    ${user_name}     ${invalid_password}
    LandingPage.wait until Element Is located In The Page
    LandingPage.verify error message is correct

Validate Cards display in the shopping page
   LandingPage.Fill The Login Form    ${user_name}     ${valid_password}
   ShopPage.wait until Element is located in the page
   ShopPage.Verify Card Titles In The Shop Page
   Add Items To Card And Checkout         ${listofProducts}
#  ShopPage.Select The Card    Nokia Edge


Select the Form and navigate to Child window
   LandingPage.Fill the Login Details and select the User option






