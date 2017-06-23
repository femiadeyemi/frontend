*** Settings ***
Resource          ../resources.robot
Suite Setup       Run Keywords
...               Get Username    AND
...               Get Password    AND
...               Get Basic Authentication Credential

*** Test Cases ***
Login With Basic Authentication Credentials - HTTP Read ONLY site
    Log          ${auth}
    Create Session                    rest	                   ${HTTP}       auth=${auth}
    ${resp}=	                      Get Request	           rest                           /private?children=true
    Log        ${resp.request.headers}
    Should Be Equal As Strings	      ${resp.status_code}	   200

*** Test Cases ***
Login With Basic Authentication Credentials - HTTPS Read ONLY site
    Create Session                    rest	                   ${HTTPS}       auth=${auth}
    ${resp}=	                      Get Request	           rest                           /private?children=true
    Should Be Equal As Strings	      ${resp.status_code}	   200

*** Test Cases ***
Login With Basic Authentication Credentials - HTTPS NA site
    Create Session                    rest	                   ${HTTPS_NA}      auth=${auth}
    ${resp}=	                      Get Request	           rest                           /
    Should Be Equal As Strings	      ${resp.status_code}	   200

*** Keywords ***
Get Basic Authentication Credential
    ${auth}=        Create List              ${username}   ${password}
    Set Suite Variable       ${auth}