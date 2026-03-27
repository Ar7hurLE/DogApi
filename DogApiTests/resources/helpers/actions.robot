*** Settings ***
Documentation  Aqui ficam as configs de start do teste 
Resource  ../../variables/libraries_variables.robot

*** Keywords ***
Dado que faco um GET no endpoint List all breeds
    GET ALL BREEDS
    Log To Console    LISTAGEM DE TODAS AS RACAS


Então me é retornado uma lista de raças caninas
    
    IF   ${RESPONSE.status_code} == 200
        Log To Console    STATUS CODE ESPERADO NA CHAMADA GET:200
        Log To Console    STATUS CODE RECEBIDO NA CHAMADA GET:${RESPONSE.status_code}
        Should Be Equal As Strings    ${RESPONSE.json()}[status]    success

    ELSE IF    ${RESPONSE.status_code} =! 200
        Log To Console    Error
        Log To Console    ${RESPONSE.json()}
        Fail
    ELSE
        Log To Console    ${RESPONSE.json()}
    END

Dado que faco um GET no endpoint By Breed com a raca
    [Arguments]    ${breed}
    GET BREED BY ID    ${breed}
    Log To Console    RACA ESCOLHIDA:${breed}



Então me é retornado uma lista de imagens da raca escolhida
    IF  ${RESPONSE.status_code} == 200
        Log To Console    STATUS CODE ESPERADO NA CHAMADA GET:200
        Log To Console    STATUS CODE RECEBIDO NA CHAMADA GET:${RESPONSE.status_code}
        #${DATA}=        Set Variable    ${RESPONSE.json()}
        ${IMAGES}=    Set Variable    ${RESPONSE.json()}[message]
        Should Not Be Empty    ${IMAGES}        
        FOR    ${IMG}    IN    @{IMAGES}
        Should Start With     ${IMG}    https://
        Should Contain        ${IMG}    images.dog.ceo
        Should End With       ${IMG}    .jpg
        Should Be Equal As Strings    ${RESPONSE.json()}[status]    success
        END
    ELSE IF    ${RESPONSE.status_code} =! 200
        Log To Console    Error
        Log To Console    ${RESPONSE.json()}
        Fail
    ELSE
        Log To Console    ${RESPONSE.json()}
    END

Dado que faco um GET no endpoint Random Image com a raca
    [Arguments]    ${breed}
    GET RANDOM IMAGE BREED BY ID    ${breed}
    Log To Console    RACA ESCOLHIDA:${breed}

Então me é retornado uma imagem aleatoria da raca escolhida
    IF   ${RESPONSE.status_code} == 200
        Log To Console    STATUS CODE ESPERADO NA CHAMADA GET:200
        Log To Console    STATUS CODE RECEBIDO NA CHAMADA GET:${RESPONSE.status_code}
        Should Start With     ${RESPONSE.json()}[message]    https://
        Should Contain        ${RESPONSE.json()}[message]    images.dog.ceo
        Should End With       ${RESPONSE.json()}[message]    .jpg
        Should Be Equal As Strings    ${RESPONSE.json()}[status]    success


    ELSE IF    ${RESPONSE.status_code} =! 200
        Log To Console    Error
        Log To Console    ${RESPONSE.json()}
        Fail
    ELSE
        Log To Console    ${RESPONSE.json()}
    END
Então não me é retornado uma lista de imagens da raca
    IF   ${RESPONSE.status_code} == 404
        Log To Console    STATUS CODE ESPERADO NA CHAMADA GET:404
        Log To Console    STATUS CODE RECEBIDO NA CHAMADA GET:${RESPONSE.status_code}
        Should Be Equal As Strings    ${RESPONSE.json()}[message]    Breed not found (main breed does not exist)

    ELSE IF    ${RESPONSE.status_code} =! 404
        Log To Console    Error
        Log To Console    GET:${RESPONSE.json()}[code]
        Log To Console    ${RESPONSE.json()}
    ELSE
        Log To Console    ${RESPONSE.json()}
    END

Então não me é retornado uma imagem aleatoria da raca escolhida
    IF   ${RESPONSE.status_code} == 404
        Log To Console    STATUS CODE ESPERADO NA CHAMADA GET:404
        Log To Console    STATUS CODE RECEBIDO NA CHAMADA GET:${RESPONSE.status_code}
        Should Be Equal As Strings    ${RESPONSE.json()}[message]    Breed not found (main breed does not exist)

    ELSE IF    ${RESPONSE.status_code} =! 404
        Log To Console    Error
        Log To Console    GET:${RESPONSE.json()}[code]
        Log To Console    ${RESPONSE.json()}
    ELSE
        Log To Console    ${RESPONSE.json()}
    END

Dado que faco um GET no endpoint By Breed com a lista de racas
    [Arguments]    @{breed}
    FOR  ${breed}  IN  @{BREEDS}
        GET RANDOM IMAGE BREED BY ID    ${breed}
        Log To Console    RACA ESCOLHIDA:${breed}
    END

Dado que faco um GET com no endpoint Random Image com a lista de racas
    [Arguments]    @{breed}
    FOR  ${breed}  IN  @{BREEDS}
        GET RANDOM IMAGE BREED BY ID    ${breed}
        Log To Console    RACA ESCOLHIDA:${breed}
    END