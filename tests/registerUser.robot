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

TC02 - Cadastrar usuário - Campo Nome Vazio
  [Tags]    register    without_name
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Nome Vazio

TC03 - Cadastrar usuário - Nome Incompleto
  [Tags]    register    name_incompleted
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Nome Incompleto
TC04 - Cadastrar usuário - Nome com Caracter Especial
  [Tags]    register    chars_specs
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Nome Caracter Especial

TC05 - Cadastrar usuário - Nome com Letras Minúsculas
  [Tags]    register    lower_case
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Nome com Letras Minúsculas