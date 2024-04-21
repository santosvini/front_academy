*** Settings ***
Documentation     Neste arquivo estão localizadas as variaveis para automacao do projeto

*** Variables ***

## Browser Options 
${chrome}                  chrome
${firefox}                 firefox
${edge}                    edge

## Login Admin
${url}                     https://automacao.qacoders-academy.com.br/login
${login}                   sysadmin@qacoders.com
${userlogin}               iansilveira@qacoders.com
${usererror}               iansqacoders.com
${errorlogin}              sysadminqacoders
${pass}                    1234@Test
${passuser}                Test#9876
${errorpass}               12#ts
${input_login}             email
${input_pass}              password

## Alerts Errors
${alertmail}               //p[contains(.,'O email é obrigatório')]
${validmail}               //p[contains(.,'Digite um email válido')]
${alertpass}               //p[contains(.,'A senha é obrigatória')]
${validpass}               (//div[contains(.,'E')])[1]
${alertFullNameRegister}   //p[contains(.,'O campo nome completo é obrigatório')]
${alertMailRegister}       //p[contains(.,'O campo email é obrigatório')]                     
${alertprofileRegister}    //p[contains(.,'O campo perfil de acesso é obrigatório')]
${alertCPFRegister}        //p[contains(.,'O campo CPF é obrigatório')]


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