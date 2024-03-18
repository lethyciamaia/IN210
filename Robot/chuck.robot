*** Settings ***
Library               RequestsLibrary

Suite Setup    Create Session  chuck  ${endPoint}      disable_warnings=True        

*** Variables ***
${motAVerifier}    Chuck
${endPoint}    https://api.chucknorris.io
${BlaguesAuHasard}    /jokes/random
${categorie}    /jokes/categories

*** Test Cases ***
hello world
    Log To Console    hello world
    Log To Console    b onjour

toto
    afficher    bonjour

afficher une blague
    ${reponse}    GET On Session    chuck    ${BlaguesAuHasard}    expected_status=200
    Log To Console    ${reponse.json()}[value]

verifie blague 
    ${blague}    recuperer blague au hazard 
    verifier la blague contient    ${motAVerifier}    ${blague}

afficher les categories
    @{cat}    recuperer les categories
    FOR    ${categorie}    IN    @{cat}
        Log To Console    ${categorie}
    END

*** Keywords ***
afficher
    [Arguments]    ${var}
    Log To Console    ${var}

recuperer blague au hazard
    ${reponse}     GET On Session    chuck    ${BlaguesAuHasard}    expected_status=200
    RETURN    ${reponse.json()}[value]

verifier la blague contient
    [Arguments]    ${item}    ${blague}
    Should Contain    ${blague}    ${item}

recuperer les categories
    ${reponse}     GET On Session    chuck    ${categorie}    expected_status=200
    RETURN    ${reponse.json()}

