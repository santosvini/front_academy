*** Settings ***
Documentation    Step de 

Resource         ../resources/main.resource

Test Setup       Iniciar Sessão
Test Teardown    Encerrar Sessão

*** Test Cases ***
TC00 - Login Admin - Sucesso
  [Tags]    login_admin
  Login Admin
  Acessa a home do QaCoders Academy
  Logout

TC01 - Login Admin - Campos Obrigatorios
  [Tags]    login    admin    fields
  Login Admin - Campos Obrigatorios

TC02 - Loogin admin - Email Incorreto
  [Tags]    login    admin    email_incorrect
  Login Admin - Email incorreto

TC03 - Login admin - Senha Incorreta
  [Tags]    login    admin    pass_incorrect
  Login Admin - Senha incorreta