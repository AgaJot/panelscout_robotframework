*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGINURL}      https://scouts.futbolkolektyw.pl/en/
${BROWSER}        Firefox
${EMAILINPUT}      xpath=//*[@id='login']
${PASSWORDINPUT}       xpath=//*[@id='password']
${SIGNINBUTTON}        xpath=//*[text()='Sign in']
${PAGELOGO}        xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${ADDPLAYERBUTTON}      xpath=//*[text()='Add player']
${ADDPLAYERURL}     https://scouts.futbolkolektyw.pl/en/players/add
${NAMEINPUT}        xpath=//input[@name='name']
${SURNAMEINPUT}     xpath=//input[@name='surname']
${AGEINPUT}     xpath=//input[@name='age']
${MAINPOSITIONINPUT}        xpath=//input[@name='mainPosition']
${SUBMITBUTTON}     xpath=//*[text()='Submit']
${ADDLINKTOYOUTUBEBUTTON}       xpath=//*[text()='Add link to Youtube']
${YOUTUBE}      xpath=//input[@name='webYT[0]']
${PIOTRKOWALSKIBUTTON}      xpath=//*[@id="__next"]/div[1]/main/div[3]/div[3]/div/div/a[1]/button/span[1]
${REMINDPASSWORDHYPERLINK}      xpath=//*[text()='Remind password']

*** Test Cases ***

Login to the system
    Open login page
    Type in email
    Type in password
    Click On The Sign In Button
    Assert Dashboard 1
    [Teardown]   Close Browser

Add plyer to the system
    Open login page
    Type in email
    Type in password
    Click On The Sign In Button
    Click On The Add Player Button
    Type in name
    Type in surname
    Type in age
    Type in main position
    Click On The Submit Button
    Go to Dashboard
    Assert Dashboard 2
    [Teardown]   Close Browser

Add youtube
    Open login page
    Type in email
    Type in password
    Click On The Sign In Button
    Click On The Add Player Button
    Type in name
    Type in surname
    Type in age
    Type in main position
    Click On The Add Link to Youtube Button
    Type In Youtube
    Click On The Submit Button
    Go to Dashboard
    Click On The Piotr Kowalski Button
    Assert Player Form
    [Teardown]   Close Browser

Transfer to the password reminder
    Open login page
    Click On The Remind Password Hyperlink
    Assert Remind Password Page
    [Teardown]   Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGINURL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text   ${EMAILINPUT}   user01@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}  Test-1234
Click on the sign in button
    Click Element   ${SIGNINBUTTON}
Click on the Add player button
    Wait Until Element Is Visible   ${ADDPLAYERBUTTON}
    Capture Element Screenshot  ${ADDPLAYERBUTTON}
    Click Element    ${ADDPLAYERBUTTON}
Type in name
    Wait Until Element Is Visible   ${NAMEINPUT}
    Input Text  ${NAMEINPUT}    Piotr
Type in surname
    Input Text  ${SURNAMEINPUT}    Kowalski
Type in age
    Input Text  ${AGEINPUT}    1999-10-01
Type in main position
    Input Text  ${MAINPOSITIONINPUT}    goalkeeper
Click on the Add link to youtube Button
    Click Element    ${ADDLINKTOYOUTUBEBUTTON}
Type in youtube
    Input Text  ${YOUTUBE}  https: // www.youtube.com / watch?v = MI_gFi_Zd8c
Click on the Submit Button
    Click Element   ${SUBMITBUTTON}
Go to Dashboard
    Go to    ${LOGINURL}
Click on the Piotr Kowalski Button
    Click Element    ${PIOTRKOWALSKIBUTTON}
Click on the remind password hyperlink
    Click Element    ${REMINDPASSWORDHYPERLINK}
Assert Dashboard 1
    Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be    Scouts panel - sign in
Assert Dashboard 2
    Wait Until Page Contains    Piotr Kowalski
    Capture Page Screenshot  alert.png
Assert Player Form
    Wait Until Element Is Visible    ${YOUTUBE}
    Capture Element Screenshot    ${YOUTUBE}
Assert Remind Password Page
    Title Should Be    Remind password