*** Settings ***
Documentation     Neste arquivo estão localizadas as variaveis para automacao do projeto

*** Variables ***

## Browser Options 
${chrome}                  chrome
${headlesschrome}          headlesschrome
${firefox}                 firefox
${headlessfirefox}         headlessfirefox
${edge}                    edge

## Login Admin
${url}                     https://automacao.qacoders-academy.com.br/login
${login}                   sysadmin@qacoders.com
${userlogin}               iansilveira@qacoders.com
${usererror}               iansqacoders.com
${errorlogin}              sysadminqacoders
${pass}                    1234@Test
${passuser}                Test#9876
${confirmpass}             9@876
${errorpass}               12#ts
${input_login}             email
${input_pass}              password

## Alerts Errors user e admin
${validPass}                   (//div[contains(.,'E')])[1]
${invalidmail}                 //p[contains(.,'Email inválido')]
${validMail}                   //p[contains(.,'Digite um email válido')]
${alertMail}                   //p[contains(.,'O email é obrigatório')]
${alertPass}                   //p[contains(.,'A senha é obrigatória')]

${alertFullNameRegister}       //p[contains(.,'O campo nome completo é obrigatório')]
${alertMailRegister}           //p[contains(.,'O campo email é obrigatório')]
${alertProfileRegister}        //p[contains(.,'O campo perfil de acesso é obrigatório')]
${alertCPFRegister}            //p[contains(.,'O campo CPF é obrigatório')]
${alertPasswordRegister}       //div[contains(.,'O campo senha é obrigatório')]
${confirmPasswordRegister}     //div[contains(.,'O campo de confirmação de senha é obrigatório.')]

${nameWithNum}                 //div[contains(.,'O campo nome completo não deve conter números')]
${alertNameCharSpec}           //div[contains(.,'Informe o nome e sobrenome com as iniciais em letra maiúscula e sem caracteres especiais.')]
${mandMail}                    //div[contains(.,'O e-mail informado é inválido. Informe um e-mail no formato [nome@domínio.com].')]
${alertNum}
${alertMailValid}              //div[contains(.,'O e-mail informado é inválido. Informe um e-mail no formato [nome@domínio.com].')]
${invalidProfile}              //div[contains(.,'O campo perfil de acesso deve ser preenchido de acordo com o seu cargo exemplo: ADMIN.')]
${invalidCPF}                  //div[contains(.,'Deve preencher o CPF com 11 dígitos')]
${defaultPass}                 //div[contains(.,'Senha precisa ter: uma letra maiúscula, uma letra minúscula, um número, um caractere especial(@#$%) e tamanho entre 8-12.')]
${diferencePass}               //div[contains(.,'As senhas não conferem.')]

## Buttons and Elements
${btnEntrar}               login
${btnSave}                 save
${novoCad}                 Novo Cadastro
${btnCad}                  css=div#Cadastros
${btnUser}                 css=div#Usuários
${btnSair}                 css=button.css-1nvbq2d

## Data Form User
${fullName}                fullName   
${mail}                    mail
${profile}                 accessProfile  
${cpf}                     cpf
${password}                password
${confirmPassword}         confirmPassword
${homeUser}                css=div.css-1e1mzyu
${titleUser}               css=h2.css-1khw8ow
${formUser}                css=div.css-1gibqcr