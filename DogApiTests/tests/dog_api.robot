*** Settings ***
Resource    ../variables/libraries_variables.robot

*** Test Cases ***

Listagem completa de raças caninas
    Dado que faco um GET no endpoint List all breeds
    Então me é retornado uma lista de raças caninas

Listagem de imagens de cães por filtro de raça
    Dado que faco um GET no endpoint By Breed com a raca  basenji
    Então me é retornado uma lista de imagens da raca escolhida


Listagem de imagem aleatoria do cão por filtro de raca
    Dado que faco um GET no endpoint Random Image com a raca  hound
    Então me é retornado uma imagem aleatoria da raca escolhida

Listagem dinamica de imagem aleatoria de cão por filtro de raca
    Dado que faco um GET com no endpoint Random Image com a lista de racas  @{BREEDS}
    Então me é retornado uma imagem aleatoria da raca escolhida

#-------------------- CENARIOS DE ERRO -------------------- #

Listagem de imagens de cães por filtro de uma raca inexistente
    Dado que faco um GET no endpoint By Breed com a raca  xxx
    Então não me é retornado uma lista de imagens da raca

Listagem de imagem aleatoria de cão por filtro da raça inexistente
    Dado que faco um GET no endpoint Random Image com a raca  yyy
    Então não me é retornado uma imagem aleatoria da raca escolhida