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

TC06 - Cadastrar usuário - Nome com Números
  [Tags]    register    number
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Nome com Números

TC07 - Cadastrar usuário - Campo Email Vazio
  [Tags]    register    without_mail
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Email Vazio

TC08 - Cadastrar usuário - Campo Email Incompleto
  [Tags]    register    incompleted_mail
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Email Incompleto

TC09 - Cadastrar usuário - Campo Email Incorreto
  [Tags]    register    inc_mail
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Email Incorreto

TC10 - Cadastrar usuário - Campo Perfil de Acesso Incorreto
  [Tags]    register    inc_profile
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Perfil Incorreto

TC11 - Cadastrar usuário - Campo Perfil de Acesso Vazio
  [Tags]    register    without_profile
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Perfil de Acesso Vazio

TC12 - Cadastrar usuário - Campo CPF com Máscara
  [Tags]    register    mask_cpf
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo CPF com Máscara

TC13 - Cadastrar usuário - Campo CPF Vazio
  [Tags]    register    without_cpf
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo CPF Vazio

TC14 - Cadastrar usuário - Campo Senha Incorreto
  [Tags]    register    inc_pass
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Senha Incorreto

TC15 - Cadastrar usuário - Campo Senha Numérica
  [Tags]    register    number_pass
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Senha com Numeros

TC16 - Cadastrar usuário - Campo Senha Alfab[etica
  [Tags]    register    alfa_pass
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Senha com Letras

TC17 - Cadastrar usuário - Campo Senha Vazio
  [Tags]    register    without_pass
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Senha Vazio

TC18 - Cadastrar usuário - Campo Senha com 12 caracteres
  [Tags]    register    length_pass
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Senha acima de 12 caracteres

TC19 - Cadastrar usuário - Campo Confirmação de Senha Incorreto
  [Tags]    register    inc_pass_confirm
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Confirmação de Senha Incorreto

TC20 - Cadastrar usuário - Campo Confirmação de Senha Vazio
  [Tags]    register    without_pass_confirm
  User Data
  Acessa a home do QaCoders Academy
  Cadastro - Campo Confirmação de Senha Vazio