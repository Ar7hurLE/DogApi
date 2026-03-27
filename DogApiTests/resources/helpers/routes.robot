*** Settings ***
Documentation  Aqui ficam as configs de start do teste 
Resource  ../../variables/libraries_variables.robot

*** Keywords ***

GET ALL BREEDS

    Criar Sessao DogApi

    ${RESPONSE}    GET On Session            alias=${SESSION.alias}
    ...                                     url=${Environment.urlDogApi}/breeds/list/all
    ...                                     expected_status=anything
    Set Global Variable    ${RESPONSE}

GET BREED BY ID
    [Arguments]  ${breed}
    Criar Sessao DogApi

    ${RESPONSE}    GET On Session            alias=${SESSION.alias}
    ...                                     url=${Environment.urlDogApi}/breed/${breed}/images
    ...                                     expected_status=anything
    Set Global Variable    ${RESPONSE}

GET RANDOM IMAGE BREED BY ID
    [Arguments]  ${breed}
    Criar Sessao DogApi

    ${RESPONSE}    GET On Session            alias=${SESSION.alias}
    ...                                     url=${Environment.urlDogApi}/breed/${breed}/images/random
    ...                                     expected_status=anything
    Set Global Variable    ${RESPONSE}