*** Settings ***

Library    SeleniumLibrary
Library    String
Library    RequestsLibrary


Variables  environment.py

Resource    elements.robot
Resource    ../resources/helpers/actions.robot
Resource    ../resources/helpers/hooks.robot
Resource    ../resources/helpers/routes.robot