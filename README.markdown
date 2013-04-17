VRaptor Issue Tracker Project
=============================

Projeto simples de uma aplicação de Issue Tracker com `VRaptor 3.4.1`, `Spring 3.x` e `Hibernate 3.6.x` com o objetivo de explanar as principais features de cada tecnologia e como integra-las de maneira produtiva em um projeto real. O projeto é construído durante os cursos e treinamentos de **VRaptor, Spring e Hibernate** ministrados pela [TriadWorks](http://www.triadworks.com.br).

Caso tenha interesse ou alguma dúvida nos nossos cursos e treinamentos, por favor, [deixe-nos saber](http://www.triadworks.com.br/contatos.html).

Configurando o projeto e banco de dados.
----------------------------------------

Por padrão o projeto está configurado para o banco de dados `PostgreSQL`, mas já que se trata de uma aplicação com `Hibernate`, você pode simplesmente configura-lo para trabalhar com qualquer outro banco.

Os passos básicos são:

1. Importe o projeto no [Eclipse Java EE IDE for Web Developers (Juno)](http://www.eclipse.org/downloads/) ou superior; 
2. Adicione o JDBC Driver no diretório `/WebContent/WEB-INF/lib` caso não pretenda utilizar o `PostgreSQL`;
3. Configure as informações do banco no arquivo `src/jdbc.properties`;
4. Crie o banco de dados `issuetracker` com a ferramenta de sua preferência (como o `PGAdmin`, no caso do `PostgreSQL`);
5. Faça o deploy no `Apache Tomcat 7.x` e inicie o servidor;
6. Insira um novo usuário no banco (tabela `USUARIO`) para que seja possível logar na aplicação;
7. Acesse a aplicação através da url [http://localhost:8080/vraptor-issuetracker](http://localhost:8080/vraptor-issuetracker) ;
8. Faça o login com o usuário criado;

Gerando .war da aplicação
------------------------
1. Para gerar o `.war` da aplicação basta executar o ant script (`build.xml`) no Eclipse ou na linha de comando:

		$ ant

2. Após ter executado o ant script o `.war` será gerado em `/target/war/snapshot/vraptor-issuetracker.war`;

Informações adicionais
------------------------

* O schema do banco de dados, `issuetracker`, será criado pelo `Hibernate` ao iniciar a aplicação pela primeira vez;
* Dentro do diretório `/etc/lib` você encontra todas as libs e dependências organizadas de cada framework;
* Dentro do diretório `/etc/lib/jdbc-drivers` é possível encontrar alguns drivers já disponíveis, como `MySQL`, `PostgreSQL` e `Oracle`;
* Dentro do diretório `/etc/mockups` você encontra os mockups (esboços) das telas da aplicação;
* O design da aplicação foi construído e totalmente baseado no [Bootstrap v2.2.1 do Twitter](http://twitter.github.io/bootstrap/)

Mais informações
----------------

**TriadWorks**
- http://www.triadworks.com.br
- http://www.triadworks.com.br/servico.html

**Rafael Ponte**
- Meu [blog](http://www.rponte.com.br)
- Meu Twitter [@rponte](http://twitter.com/#!/rponte)

**JavaCE Group**
- https://groups.google.com/forum/?fromgroups#!forum/javace