*** Settings ***
Documentation    Resources needed to access the systems during the tests

Library    BuiltIn
Library    FakerLibrary     locale=pt_BR
Library    Screenshot
Library    SeleniumLibrary
Library    String

Resource    ${CURDIR}/variables.resource

*** Keywords ***
Iniciar Sessão
  Open browser            ${url}    ${chrome}
  Set Window Size         1920      1080
Encerrar Sessão
  Close Browser
Login Admin
  Go to    ${url}
  Wait Until Element Is Visible     ${input_login}
  Input Text                        ${input_login}    ${login}

  Wait Until Element Is Visible     ${input_pass}
  Input Text                        ${input_pass}     ${pass}
  
  Wait Until Element Is Visible     ${btnEntrar}
  Click button                      ${btnEntrar}

Login User
  Wait Until Element Is Visible     ${input_login}
  Input Text                        ${input_login}    ${email}
  Log    ${email}

  Wait Until Element Is Visible     ${input_pass}
  Input Text                        ${input_pass}     ${passuser}
  Log    ${passuser}
  
  Wait Until Element Is Visible     ${btnEntrar}
  Click Button                      ${btnEntrar}

  Wait Until Element Is Visible     ${homeUser}

  Click button    ${btnSair}

User Data
  Go to    ${url}
  Wait Until Element Is Visible     ${input_login}
  Input Text                        ${input_login}    ${userlogin}

  Wait Until Element Is Visible     ${input_pass}
  Input Text                        ${input_pass}     ${passuser}

  Wait Until Element Is Visible     ${btnEntrar}
  Click Button                      ${btnEntrar}

  Wait Until Element Is Visible     ${homeUser}

Login Admin - Campos Obrigatorios
  Go to    ${url}
  Wait Until Element Is Visible     ${input_login}
  Wait Until Element Is Visible     ${input_pass}
  
  Wait Until Element Is Visible     ${btnEntrar}
  Click button                      ${btnEntrar}

  Element should be visible         ${alertmail}
  Element should be visible         ${alertpass}

Login User - Campos Obrigatorios
  Go to    ${url}
  Wait Until Element Is Visible     ${input_login}
  Wait Until Element Is Visible     ${input_pass}
  
  Wait Until Element Is Visible     ${btnEntrar}
  Click button                      ${btnEntrar}

  Element should be visible         ${alertmail}
  Element should be visible         ${alertpass}

Login Admin - Email Incorreto
  Go to    ${url}
  Wait Until Element Is Visible     ${input_login}
  Input Text                        ${input_login}    ${errorlogin}         

  Wait Until Element Is Visible     ${input_pass}
  Input Text                        ${input_pass}     ${pass}
  
  Wait Until Element Is Visible     ${btnEntrar}
  Click button                      ${btnEntrar}
  
  Wait until element is visible     ${validmail}

Login User - Email Incorreto
  Go to    ${url}
  Wait Until Element Is Visible     ${input_login}
  Input Text                        ${input_login}    ${usererror}

  Wait Until Element Is Visible     ${input_pass}
  Input Text                        ${input_pass}     ${pass}
  
  Wait Until Element Is Visible     ${btnEntrar}
  Click button                      ${btnEntrar}
  
  Wait until element is visible     ${validmail}
Login Admin - Senha Incorreta
  Go to    ${url}
  Wait Until Element Is Visible     ${input_login}
  Input Text                        ${input_login}    ${login}

  Wait Until Element Is Visible     ${input_pass}
  Input Text                        ${input_pass}     ${errorpass}

  Wait Until Element Is Visible     ${btnEntrar}
  Click button                      ${btnEntrar}

  Wait until element is visible     ${validpass}

Login User - Senha Incorreta
  Go to    ${url}
  Wait Until Element Is Visible     ${input_login}
  Input Text                        ${input_login}    ${userlogin}

  Wait Until Element Is Visible     ${input_pass}
  Input Text                        ${input_pass}     ${errorpass}

  Wait Until Element Is Visible     ${btnEntrar}
  Click button                      ${btnEntrar}

  Wait until element is visible     ${validpass}
Acessa a home do QaCoders Academy
  Wait Until Element Is Visible    ${btnCad}
  Click Element                    ${btnCad}

  Wait Until Element Is Visible    ${btnUser}
  Click Element                    ${btnUser}

  Wait Until Element Is Visible    ${titleUser}

Cadastro de novo usuário
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}                          FakerLibrary.FirstName
  ${name}=        Remove string            ${name}        ´  `  ^  ~  ç  Sra  Srta  Sr  ${SPACE}
  ${lastname}                      FakerLibrary.LastName
  ${lastname}=    Remove string            ${lastname}    ´  `  ^  ~  ç  Sra  Srta  Sr  ${SPACE}
  Input Text                       ${fullName}    ${name} ${lastname}

  Wait Until Element Is Visible            css=label[for="mail"]

  ${email}=    Convert to Lower Case    ${name}${lastname}
  ${email}=    Catenate    SEPARATOR=   ${email}@qacoders.com
  Set test variable        ${email}
  Input Text                            ${mail}    ${email}

  Wait Until Element Is Visible    css=label[for="accessProfile"]
  Input Text                       ${profile}    ADMIN

  ${random_cpf}      Generate Random String    length=11    chars=[NUMBERS]
  Wait Until Element Is Visible    css=label[for="cpf"]
  Input Text                       ${cpf}    ${random_cpf}

  Wait Until Element Is Visible    css=label[for="password"]
  Input Text                       ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Text                       ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}

Cadastro - Campos Obrigatorios
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}

  Wait Until Element Is Visible    ${formUser}
  
  Input Text                       ${fullName}    ${EMPTY}
  Input Text                       ${mail}        ${EMPTY}
  Input Text                       ${profile}     ${EMPTY}
  Input Text                       ${cpf}         ${EMPTY}
  
  Click Button    ${btnSave}

  Element should be visible        ${alertFullNameRegister}
  Element should be visible        ${alertMailRegister}
  Element should be visible        ${alertprofileRegister}
  Element should be visible        ${alertCPFRegister}

  Capture page screenshot

Cadastro - Sem Nome Completo
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}                          FakerLibrary.FirstName
  # ${name}=        Remove string            ${name}        ´  `  ^  ~  ç  Sra  Srta  Sr  ${SPACE}
  ${lastname}                      FakerLibrary.LastName
  # ${lastname}=    Remove string            ${lastname}    ´  `  ^  ~  ç  Sra  Srta  Sr  ${SPACE}
  Input Text                       ${fullName}    ${name}

  Wait Until Element Is Visible            css=label[for="mail"]

  ${email}=    Convert to Lower Case    ${name}${lastname}
  ${email}=    Catenate    SEPARATOR=   ${email}@qacoders.com
  Set test variable        ${email}
  Input Text                            ${mail}    ${email}

  Wait Until Element Is Visible    css=label[for="accessProfile"]
  Input Text                       ${profile}    ADMIN

  ${random_cpf}      Generate Random String    length=11    chars=[NUMBERS]
  Wait Until Element Is Visible    css=label[for="cpf"]
  Input Text                       ${cpf}    ${random_cpf}

  Wait Until Element Is Visible    css=label[for="password"]
  Input Text                       ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Text                       ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}
Logout
  Click button    ${btnSair}