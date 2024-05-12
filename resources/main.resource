*** Settings ***
Documentation    Resources needed to access the systems during the tests

Library    BuiltIn
Library    FakerLibrary    locale=pt_BR
Library    Screenshot
Library    SeleniumLibrary
Library    String
Library    ./strings_utils.py

Resource    ${CURDIR}/variables.resource

*** Keywords ***
Iniciar Sessão
  Open browser            ${url}    ${headlessfirefox}
  Set Window Size         1366      768
Encerrar Sessão
  Close Browser
Login Admin
  Go to    ${url}
  Wait Until Element Is Visible     ${input_login}
  Input Text                        ${input_login}    ${login}

  Wait Until Element Is Visible     ${input_pass}
  Input Password                    ${input_pass}     ${pass}
  
  Wait Until Element Is Visible     ${btnEntrar}
  Click button                      ${btnEntrar}

Login User
  Wait Until Element Is Visible     ${input_login}
  Input Text                        ${input_login}    ${email}
  Log    ${email}

  Wait Until Element Is Visible     ${input_pass}
  Input Password                    ${input_pass}     ${passuser}
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
  Input Password                    ${input_pass}     ${passuser}

  Wait Until Element Is Visible     ${btnEntrar}
  Click Button                      ${btnEntrar}

  Wait Until Element Is Visible     ${homeUser}

Login Admin - Campos Obrigatorios
  Go to    ${url}
  Wait Until Element Is Visible     ${input_login}
  Wait Until Element Is Visible     ${input_pass}
  
  Wait Until Element Is Visible     ${btnEntrar}
  Click button                      ${btnEntrar}

  Element should be visible         ${alertMail}
  Element should be visible         ${alertPass}

Login User - Campos Obrigatorios
  Go to    ${url}
  Wait Until Element Is Visible     ${input_login}
  Wait Until Element Is Visible     ${input_pass}
  
  Wait Until Element Is Visible     ${btnEntrar}
  Click button                      ${btnEntrar}

  Element should be visible         ${alertMail}
  Element should be visible         ${alertPass}

Login Admin - Email Incorreto
  Go to    ${url}
  Wait Until Element Is Visible     ${input_login}
  Input Text                        ${input_login}    ${errorlogin}         

  Wait Until Element Is Visible     ${input_pass}
  Input Password                    ${input_pass}     ${pass}
  
  Wait Until Element Is Visible     ${btnEntrar}
  Click button                      ${btnEntrar}
  
  Wait until element is visible     ${validMail}

Login User - Email Incorreto
  Go to    ${url}
  Wait Until Element Is Visible     ${input_login}
  Input Text                        ${input_login}    ${usererror}

  Wait Until Element Is Visible     ${input_pass}
  Input Password                    ${input_pass}     ${pass}
  
  Wait Until Element Is Visible     ${btnEntrar}
  Click button                      ${btnEntrar}
  
  Wait until element is visible     ${validMail}
Login Admin - Senha Incorreta
  Go to    ${url}
  Wait Until Element Is Visible     ${input_login}
  Input Text                        ${input_login}    ${login}

  Wait Until Element Is Visible     ${input_pass}
  Input Password                    ${input_pass}     ${errorpass}

  Wait Until Element Is Visible     ${btnEntrar}
  Click button                      ${btnEntrar}

  Wait until element is visible     ${validPass}

Login User - Senha Incorreta
  Go to    ${url}
  Wait Until Element Is Visible     ${input_login}
  Input Text                        ${input_login}    ${userlogin}

  Wait Until Element Is Visible     ${input_pass}
  Input Password                    ${input_pass}     ${errorpass}

  Wait Until Element Is Visible     ${btnEntrar}
  Click button                      ${btnEntrar}

  Wait until element is visible     ${validPass}
Acessa a home do QaCoders Academy
  Wait Until Element Is Visible    ${btnCad}
  Click Element                    ${btnCad}

  Wait Until Element Is Visible    ${btnUser}
  Click Element                    ${btnUser}

  Wait Until Element Is Visible    ${titleUser}

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
  Element should be visible        ${alertProfileRegister}
  Element should be visible        ${alertCPFRegister}

  Capture page screenshot
Cadastro de novo usuário
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    Sr.    Sra.    Srta.    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name} ${lastname}

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
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}
  Capture page screenshot

Cadastro - Campo Nome Vazio
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}                          FakerLibrary.FirstName
  ${lastname}                      FakerLibrary.LastName
  Input Text                       ${fullName}    ${EMPTY}

  Wait Until Element Is Visible    css=label[for="mail"]

  ${email}=    Convert to Lower Case    ${name}${lastname}
  ${email}=    Catenate    SEPARATOR=   ${email}@qacoders.com
  Input Text                            ${mail}    ${email}

  Wait Until Element Is Visible    css=label[for="accessProfile"]
  Input Text                       ${profile}    ADMIN

  ${random_cpf}      Generate Random String    length=11    chars=[NUMBERS]
  Wait Until Element Is Visible    css=label[for="cpf"]
  Input Text                       ${cpf}    ${random_cpf}

  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}

  Element should be visible        ${alertFullNameRegister}
  Capture element screenshot       ${alertFullNameRegister}

Cadastro - Campo Nome Incompleto
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]

  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name}

  Wait Until Element Is Visible    css=label[for="mail"]

  ${email}=    Convert to Lower Case    ${name}${lastname}
  ${email}=    Catenate    SEPARATOR=   ${email}@qacoders.com
  Input Text                            ${mail}    ${email}

  Wait Until Element Is Visible    css=label[for="accessProfile"]
  Input Text                       ${profile}    ADMIN

  ${random_cpf}      Generate Random String    length=11    chars=[NUMBERS]
  Wait Until Element Is Visible    css=label[for="cpf"]
  Input Text                       ${cpf}    ${random_cpf}

  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}

  Wait Until Element Is Visible    ${alertNameCharSpec}
  Capture element screenshot       ${alertNameCharSpec}

Cadastro - Campo Nome Caracter Especial
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  Input Text      ${fullName}      $ampaio Corr&@

  Wait Until Element Is Visible         css=label[for="mail"]
  ${email}=    Convert to Lower Case    SampaioCorrea
  ${email}=    Catenate    SEPARATOR=   ${email}@qacoders.com
  Input Text                            ${mail}    ${email}

  Wait Until Element Is Visible    css=label[for="accessProfile"]
  Input Text                       ${profile}    ADMIN

  ${random_cpf}      Generate Random String    length=11    chars=[NUMBERS]
  Wait Until Element Is Visible    css=label[for="cpf"]
  Input Text                       ${cpf}    ${random_cpf}

  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}

  Wait until element is visible    ${alertNameCharSpec}
  Capture element screenshot       ${alertNameCharSpec}  

Cadastro - Campo Nome com Letras Minúsculas
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    ${SPACE}
  ${name}=        Remover Acentos          ${name}
  ${name}=        Convert to lower case    ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}
  ${lastname}=    Convert to lower case    ${lastname}

  ${nameComplete}=    Remove String   ${name} ${lastname}    ${SPACE}
  Input Text          ${fullName}     ${nameComplete}

  Wait Until Element Is Visible         css=label[for="mail"]
  ${email}=    Convert to Lower Case    ${name}${lastname}
  ${email}=    Catenate    SEPARATOR=           ${email}@qacoders.com
  Remove String            ${email}   ${SPACE}
  Input Text               ${mail}    ${email}

  Wait Until Element Is Visible    css=label[for="accessProfile"]
  Input Text                       ${profile}    ADMIN

  ${random_cpf}      Generate Random String    length=11    chars=[NUMBERS]
  Wait Until Element Is Visible    css=label[for="cpf"]
  Input Text                       ${cpf}    ${random_cpf}

  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}
  
  Wait until element is visible    ${alertNameCharSpec}
  Capture element screenshot       ${alertNameCharSpec}

Cadastro - Campo Nome com Números
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    ${SPACE}
  ${name}=        Remover Acentos          ${name}
  ${name}=        Convert to lower case    ${name}

  ${numbers}=    Generate Random String    length=4    chars=[NUMBERS]

  ${nameComplete}=    Remove String   ${name} ${numbers}    ${SPACE}
  Input Text          ${fullName}     ${nameComplete}

  Wait Until Element Is Visible         css=label[for="mail"]
  ${email}=    Convert to Lower Case    ${name}
  ${email}=    Catenate    SEPARATOR=           ${email}@qacoders.com
  Remove String            ${email}   ${SPACE}
  Input Text               ${mail}    ${email}

  Wait Until Element Is Visible    css=label[for="accessProfile"]
  Input Text                       ${profile}    ADMIN

  ${random_cpf}      Generate Random String    length=11    chars=[NUMBERS]
  Wait Until Element Is Visible    css=label[for="cpf"]
  Input Text                       ${cpf}    ${random_cpf}

  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}
  
  Wait until element is visible    ${nameWithNum}
  Capture element screenshot       ${nameWithNum}

Cadastro - Campo Email Vazio
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    Sr.    Sra.    Srta.    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name} ${lastname}

  Wait Until Element Is Visible    css=label[for="mail"]
  ${email}=    Convert to Lower Case    ${name}${lastname}
  ${email}=    Catenate    SEPARATOR=   ${email}@qacoders.com
  Input Text                            ${mail}    ${EMPTY}

  Wait Until Element Is Visible    css=label[for="accessProfile"]
  Input Text                       ${profile}    ADMIN

  ${random_cpf}      Generate Random String    length=11    chars=[NUMBERS]
  Wait Until Element Is Visible    css=label[for="cpf"]
  Input Text                       ${cpf}    ${random_cpf}

  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}

  Element should be visible        ${alertMailRegister}
  Capture element screenshot       ${alertMailRegister}

Cadastro - Campo Email Incompleto
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    Sr.    Sra.    Srta.    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name} ${lastname}

  Wait Until Element Is Visible    css=label[for="mail"]

  ${email}=    Convert to Lower Case    ${name}${lastname}
  ${email}=    Catenate    SEPARATOR=   ${email}@qacoders
  Input Text                            ${mail}    ${email}

  Wait Until Element Is Visible    css=label[for="accessProfile"]
  Input Text                       ${profile}    ADMIN

  ${random_cpf}      Generate Random String    length=11    chars=[NUMBERS]
  Wait Until Element Is Visible    css=label[for="cpf"]
  Input Text                       ${cpf}    ${random_cpf}

  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}

  Wait Until Element Is Visible    ${alertMailValid}
  Capture element screenshot       ${alertMailValid}

Cadastro - Campo Email Incorreto
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    Sr.    Sra.    Srta.    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name} ${lastname}

  Wait Until Element Is Visible            css=label[for="mail"]

  ${email}=    Convert to Lower Case    ${name}${lastname}
  ${email}=    Catenate    SEPARATOR=   ${email}@qacoders
  Set test variable        ${email}
  Input Text                            ${mail}    ${email}

  Wait Until Element Is Visible    css=label[for="accessProfile"]
  Input Text                       ${profile}    ADMIN

  ${random_cpf}      Generate Random String    length=11    chars=[NUMBERS]
  Wait Until Element Is Visible    css=label[for="cpf"]
  Input Text                       ${cpf}    ${random_cpf}

  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}

  Wait Until Element Is Visible    ${mandMail}    
  Capture element screenshot       ${mandMail}

Cadastro - Campo Perfil Incorreto
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    Sr.    Sra.    Srta.    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name} ${lastname}

  Wait Until Element Is Visible            css=label[for="mail"]

  ${email}=    Convert to Lower Case    ${name}${lastname}
  ${email}=    Catenate    SEPARATOR=   ${email}@qacoders.com
  Set test variable        ${email}
  Input Text                            ${mail}    ${email}

  Wait Until Element Is Visible    css=label[for="accessProfile"]
  Input Text                       ${profile}    ADM

  ${random_cpf}      Generate Random String    length=11    chars=[NUMBERS]
  Wait Until Element Is Visible    css=label[for="cpf"]
  Input Text                       ${cpf}    ${random_cpf}

  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}
  
  Wait Until Element Is Visible    ${invalidProfile}
  Capture element screenshot       ${invalidProfile}

Cadastro - Campo Perfil de Acesso Vazio
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    Sr.    Sra.    Srta.    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name} ${lastname}

  Wait Until Element Is Visible            css=label[for="mail"]

  ${email}=    Convert to Lower Case    ${name}${lastname}
  ${email}=    Catenate    SEPARATOR=   ${email}@qacoders.com
  Set test variable        ${email}
  Input Text                            ${mail}    ${email}

  Wait Until Element Is Visible    css=label[for="accessProfile"]
  Input Text                       ${profile}    ${EMPTY}

  ${random_cpf}      Generate Random String    length=11    chars=[NUMBERS]
  Wait Until Element Is Visible    css=label[for="cpf"]
  Input Text                       ${cpf}    ${random_cpf}

  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}

  Wait Until Element Is Visible    ${alertProfileRegister}
  Capture element screenshot       ${alertProfileRegister}
Cadastro - Campo CPF com Máscara
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    Sr.    Sra.    Srta.    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name} ${lastname}

  Wait Until Element Is Visible            css=label[for="mail"]

  ${email}=    Convert to Lower Case    ${name}${lastname}
  ${email}=    Catenate    SEPARATOR=   ${email}@qacoders.com
  Set test variable        ${email}
  Input Text                            ${mail}    ${email}

  Wait Until Element Is Visible    css=label[for="accessProfile"]
  Input Text                       ${profile}    ADMIN

  ${random_cpf}         FakerLibrary.cpf
  Set test variable     ${random_cpf}
  Wait Until Element Is Visible    css=label[for="cpf"]
  Input Text                       ${cpf}    ${random_cpf}

  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}

  Wait Until Element Is Visible    ${invalidCPF}
  Capture element screenshot       ${invalidCPF}

Cadastro - Campo CPF Vazio
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    Sr.    Sra.    Srta.    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name} ${lastname}

  Wait Until Element Is Visible            css=label[for="mail"]

  ${email}=    Convert to Lower Case    ${name}${lastname}
  ${email}=    Catenate    SEPARATOR=   ${email}@qacoders.com
  Set test variable        ${email}
  Input Text                            ${mail}    ${email}

  Wait Until Element Is Visible    css=label[for="accessProfile"]
  Input Text                       ${profile}    ADMIN

  ${random_cpf}      Generate Random String    length=11    chars=[NUMBERS]
  Wait Until Element Is Visible    css=label[for="cpf"]
  Input Text                       ${cpf}    ${EMPTY}

  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}
  
  Wait Until Element Is Visible    ${alertCPFRegister}
  Capture element screenshot       ${alertCPFRegister}

Cadastro - Campo Senha Incorreto
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    Sr.    Sra.    Srta.    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name} ${lastname}

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

  ${passuser}      Generate Random String    length=7    chars=[NUMBERS][LETTERS]
  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}

  Wait until element is visible    ${defaultPass}
  Capture element screenshot       ${defaultPass}

Cadastro - Campo Senha com Numeros
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    Sr.    Sra.    Srta.    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name} ${lastname}

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
  
  ${passuser}      Generate Random String    length=5    chars=[NUMBERS]
  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}

  Wait until element is visible    ${defaultPass}
  Capture element screenshot       ${defaultPass}
Cadastro - Campo Senha com Letras
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    Sr.    Sra.    Srta.    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name} ${lastname}

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

  ${passuser}      Generate Random String    length=5    chars=[LETTERS]
  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}

  Wait until element is visible    ${defaultPass}
  Capture element screenshot       ${defaultPass}
Cadastro - Campo Senha Vazio
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    Sr.    Sra.    Srta.    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name} ${lastname}

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
  Input Password                   ${password}    ${EMPTY}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}

  Wait until element is visible    ${alertPasswordRegister}
  Capture element screenshot       ${alertPasswordRegister}
Cadastro - Campo Senha acima de 12 caracteres
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    Sr.    Sra.    Srta.    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name} ${lastname}

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

  ${passuser}      Generate Random String    length=13    chars=[LETTERS]@[NUMBERS]
  Wait Until Element Is Visible    css=label[for="password"]
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${passuser}

  Click Button    ${btnSave}

  Wait until element is visible    ${defaultPass}
  Capture element screenshot       ${defaultPass}
Cadastro - Campo Confirmação de Senha Incorreto
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    Sr.    Sra.    Srta.    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name} ${lastname}

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
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${confirmpass}

  Click Button    ${btnSave}

  Wait until element is visible    ${diferencePass}
  Capture element screenshot       ${diferencePass}
Cadastro - Campo Confirmação de Senha Vazio
  Wait Until Element Is Visible    ${novoCad}
  Click button                     ${novoCad}
  Wait Until Element Is Visible    ${formUser}

  Wait Until Element Is Visible    css=label[for="fullName"]
  ${name}         FakerLibrary.FirstName
  ${name}=        Remove String            ${name}    Sr.    Sra.    Srta.    ${SPACE}
  ${name}=        Remover Acentos          ${name}

  ${lastname}     FakerLibrary.LastName
  ${lastname}=    Remove String            ${lastname}    ${SPACE}
  ${lastname}=    Remover Acentos          ${lastname}

  Input Text      ${fullName}    ${name} ${lastname}

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
  Input Password                   ${password}    ${passuser}

  Wait Until Element Is Visible    css=label[for="confirmPassword"]
  Input Password                   ${confirmPassword}    ${EMPTY}

  Click Button    ${btnSave}

  Wait until element is visible    ${confirmPasswordRegister}
  Capture element screenshot       ${confirmPasswordRegister}
Logout
  Click button    ${btnSair}