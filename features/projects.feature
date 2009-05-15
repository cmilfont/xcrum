Feature: Criar projeto
    As a gerente de projetos
    I want criar um projetos
    So that eu possa gerencia-los

    Scenario: Criar um novo projeto
        Given um projeto com nome Xcrum
        When solicitar a criação de um projetos
        Then que um projeto com o nome Xcrum exista

