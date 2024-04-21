*** Settings ***
Documentation    Resources needed to access the systems during the tests

Resource         ../resources/main.resource

Test Setup       Iniciar Sessão
Test Teardown    Encerrar Sessão

*** Test Cases ***
TC00 - Realizar login com usuário
  [Tags]    login_user 
  Login Admin
  Acessa a home do QaCoders Academy
  Cadastro de novo usuário
  Logout
  Login User

TC01 - Login User - Campos Obrigatorios
  [Tags]    login    user    fields
  Login User - Campos Obrigatorios

TC02 - Loogin admin - Email Incorreto
  [Tags]    login    user    email_incorrect
  Login User - Email Incorreto

TC03 - Login admin - Senha Incorreta
  [Tags]    login    user    pass_incorrect
  Login User - Senha Incorreta