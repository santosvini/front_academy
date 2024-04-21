*** Settings ***
Documentation    Resources needed to access the systems during the tests

Resource         ../resources/main.resource

Test Setup       Iniciar Sessão
Test Teardown    Encerrar Sessão

*** Test Cases ***
TC00 - Cadastrar usuário - Sucesso
  [Tags]    register    success
  Login Admin
  Acessa a home do QaCoders Academy
  Cadastro de novo usuário
  Logout

TC01 - Cadastrar usuário - Campos Obrigatorios
  [Tags]    register    data
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campos Obrigatorios

TC02 - Cadastrar usuário - Sem Nome Completo
  [Tags]    register    name_incompleted
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Sem Nome Completo