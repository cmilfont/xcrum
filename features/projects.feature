# http://www.pivotaltracker.com/story/show/781409
Feature: Criar projeto
    Como um gerente de projetos
    Eu quero criar um projetos
    Para que eu possa gerencia-los

    Cenário: Criar um novo projeto
        Dado um projeto com nome Xcrum
        Quando solicitar a criação de um projetos
        Então que um projeto com o nome Xcrum exista

