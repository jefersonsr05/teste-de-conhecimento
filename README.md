# Teste de conhecimento
Teste de conhecimento de programação para candidatos iniciantes da MC Sistemas

Para clonar o repositório:

	git clone https://github.com/jefersonsr05/teste-de-conhecimento.git
	
Após o clone, entrar no diretório e criar nova Branch:

	cd teste-de-conhecimento/
	git checkout -b {{nova-branch}}
	
Agora é só trabalhar e depois para subir a primeira versão de seu código, envie seu git para o adm do projeto para que este lhe adicione como colaborador e assim você possa criar sua nova branch no repositório, para isso use:

	git add .
	git commit -m "descrição das melhorias realizadas"
	git push --set-upstream origin {{nova-branch}}

OBS: trocar o {{nova-branch}} pelo nome de sua branch criada!


## Proposta do desafio:

### Cadastros:
Clientes | Produtos | Venda

1) Desenvolva um CRUD básico (inclusão / alterar / excluir / consultar) com o cadastro de Clientes e Produtos que em ambos possam ser consultados e organizados por codigo e nome.
2) Desenvolva um CRUD (inclusão / excluir / consultar) onde possa se realizar as operações de Orçamento, Pré-venda e Venda (OPERACAO_VENDA) , deve ser utilizado os cliente e produtos criados anteriormente, na tela de consulta deve ter no minimo as opções de ordenação por Data, Número da venda e cliente, deverá também poder filtrar por periodo, data especifica, cliente e numeração. 
Considerar o tipo de venda (TIPO_VENDA) como (A) = A Vista e (P) = A Prazo.
Ao incluir ou excluir uma venda deve realizar a movimentação de estoque do produto de acordo com a situação.
3) Possibilitar o usuario imprimir o pedido da venda
4) Criar um relatório para cada um dos CRUD, dê preferência para o relatório de venda.
	
OBS: Não será necessário ter uma tela de login, fique a vontade para criar novos recursos e ousar na usabilidade. Os campos necessários devem ser preenchidos de acordo com a base de dados disponibilizada.
