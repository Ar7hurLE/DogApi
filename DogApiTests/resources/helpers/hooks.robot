*** Settings ***
Documentation  Aqui ficam as configs de start do teste 
Resource  ../../variables/libraries_variables.robot

*** Keywords ***

Criar Sessao DogApi
    Evaluate    urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)    modules=urllib3
    &{SESSION}    Create Dictionary        alias=Environment
    ...                                    url=${Environment.urlDogApi}

    Create Session        &{SESSION}
    Set Suite Variable    &{SESSION}
