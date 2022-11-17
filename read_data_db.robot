*** Settings ***
Documentation  API Testing in Robot Framework
Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Test Cases ***
Do a GET Request and validate the response code and response body
    [documentation]  This test case verifies that the response code of the GET Request should be 200,
    [tags]  Read API data
    Create Session  mysession  https://jsonplaceholder.typicode.com  verify=true
    ${response}=  GET On Session  mysession  /todos  params=query=london
    Status Should Be  200  ${response}  #Check Status as 200

    @{todos} =  Get Value From Json     ${response.json()}    $
    FOR     ${todo}     IN      @{todos}[0]
        @{todo_title} =  Get Value From Json     ${todo}    $..title
        Log To Console      ${todo_title}[0]
    END
 
Login with email and password
    Open Browser  https://uat.myhealthandwellbeinghw.nhs.uk/users/login  Chrome
    Wait Until Element Is Visible  id:login_email  timeout=5
    Input Text  id:login_email  avinash+clinician1@mindwaveventures.com
    Input Password  id:login_password  Test@123
    Click Element  id:loginBtn
