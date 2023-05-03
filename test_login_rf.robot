*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Firefox
${EMAILINPUT}      xpath=//*[@id='login']
${PASSWORDINPUT}       xpath=//*[@id='password']
${SIGNINBUTTON}        xpath=//*[text()='Sign in']
${PAGELOGO}        xpath=/html/body/div/form/div/div[1]/h5
${ADDPLAYERBUTTON}      xpath=//*[text()='Add player']
${NAMEINPUT}        xpath=//input[@name='name']
${SURNAMEINPUT}     xpath=//input[@name='surname']
${AGEINPUT}     xpath=//input[@name='age']
${MAINPOSITIONINPUT}        xpath=//input[@name='mainPosition']
${SUBMITBUTTON}     xpath=//*[text()='Submit']

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click On The Sign In Button
    Assert dashboard
    [Teardown]   Close Browser

Add plyer to the system
    Open login page
    Type in email
    Type in password
    Click On The Sign In Button
    Click On the Add player Button
    Type in name
    Type in surname
    Type in age
    Type in main position
    Click On The Submit Button
    Assert Dashboard
    Test step 1
    Test step 2
    [Teardown]   Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text   ${EMAILINPUT}   user01@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}  Test-1234
Click on the sign in button
    Click Element   xpath=//*[text()='Sign in']
Click on the Add player button
    Click Button    xpath=//*[text()='Add player']
Type in name
    Input Text  ${NAMEINPUT}    Piotr
Type in surname
    Input Text  ${SURNAMEINPUT}    Kowalski
Type in age
    Input Text  ${AGEINPUT}    01101999
Type in main position
    Input Text  ${MAINPOSITIONINPUT}    goalkeeper
Click on the Submit button
    Click Element   xpath=//*[text()='Submit']
Assert dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot  alert.png