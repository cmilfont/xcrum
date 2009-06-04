Funcionalidade: Montar Product Backlog
    Como um product owner
    Eu quero montar um product backlog
    Para que eu possa adicionar itens de negócio que eu desejo no produto

    Cenário: Iniciar um product backlog
        Dado um projeto com nome Xcrum
		E um item com descrição "Exemplo de funcionalidade"
        Quando inserir o item que desejo
        Então o item será inserido numa lista conhecida como product backlog
		E o item não estará atribuído a nenhum sprint
		E receberei a mensagem "Item incluído no Backlog"

	Cenário: Acrescentar outro item ao product backlog
		Dado um projeto com nome Xcrum
		E um novo item com descrição "Outro exemplo de funcionalidade"
		Quando inserir o item que desejo
		Então o item será inserido numa lista conhecida como product backlog
		E o item não estará atribuído a nenhum sprint
		E receberei a mensagem "Item incluído no Backlog"

