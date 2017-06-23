*** Settings ***
Resource          ../resources.robot

*** Test Cases ***
Send A GET Requests Without Suppressing WWW-Authenticate
    Create Session                    rest	                ${HTTP}
    ${resp}=	                      Get Request	        rest                /private/?children=true
    Should Be Equal As Strings	      ${resp.status_code}	401
    Should Contain	                  ${resp.headers}	    WWW-Authenticate    case_insensitive=False

*** Test Cases ***
Send A GET Requests With Suppress WWW-Authenticate Header
    ${headers}=                       Create Dictionary        Suppress-WWW-Authenticate=Suppress
    Create Session                    rest	                   ${HTTP}
    ${resp}=	                      Get Request	           rest                                  /private/?children=true      headers=${headers}
    Should Be Equal As Strings	      ${resp.status_code}	   401
    Should Not Contain	              ${resp.headers}	       WWW-Authenticate                      case_insensitive=False
    Should Contain	                  ${resp.headers}	       Suppress-WWW-Authenticate             case_insensitive=False

*** Test Cases ***
Send A GET Requests Without Suppressing WWW-Authenticate with HTTPS
    Create Session                    rest	                ${HTTPS}
    ${resp}=	                      Get Request	        rest                /private/?children=true
    Should Be Equal As Strings	      ${resp.status_code}	401
    Should Contain	                  ${resp.headers}	    WWW-Authenticate    case_insensitive=False

*** Test Cases ***
Send A GET Requests With Suppress WWW-Authenticate Header with HTTPS
    ${headers}=                       Create Dictionary        Suppress-WWW-Authenticate=Suppress
    Create Session                    rest	                   ${HTTPS}
    ${resp}=	                      Get Request	           rest                                  /private/?children=true      headers=${headers}
    Should Be Equal As Strings	      ${resp.status_code}	   401
    Should Not Contain	              ${resp.headers}	       WWW-Authenticate                      case_insensitive=False
    Should Contain	                  ${resp.headers}	       Suppress-WWW-Authenticate             case_insensitive=False


*** Test Cases ***
Send A GET Requests Without Suppressing WWW-Authenticate To NA Site
    Create Session                    rest	                ${HTTPS_NA}
    ${resp}=	                      Get Request	        rest                /?children=true
    Should Be Equal As Strings	      ${resp.status_code}	401
    Should Contain	                  ${resp.headers}	    WWW-Authenticate    case_insensitive=False

*** Test Cases ***
Send A GET Requests With Suppress WWW-Authenticate Header To NA Site
    ${headers}=                       Create Dictionary        Suppress-WWW-Authenticate=Suppress
    Create Session                    rest	                   ${HTTPS_NA}
    ${resp}=	                      Get Request	           rest                                  /?children=true           headers=${headers}
    Should Be Equal As Strings	      ${resp.status_code}	   401
    Should Not Contain	              ${resp.headers}	       WWW-Authenticate                      case_insensitive=False
    Should Contain	                  ${resp.headers}	       Suppress-WWW-Authenticate             case_insensitive=False