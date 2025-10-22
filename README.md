# dio - Script de Criação de Estrutura de Usuários e Diretórios — Ubuntu 22.04

# Descrição
O script iacl.sh automatiza a criação de diretórios, grupos e usuários no sistema Linux (Ubuntu 22.04+), atribuindo permissões específicas a cada grupo.
Ele foi adaptado para versões recentes do Ubuntu, onde a criação de usuários difere dos exemplos usados em versões anteriores (como Ubuntu 20.04).

# Funcionalidades
Cria os diretórios:
/publico
/adm
/ven
/sec

Cria os grupos:
GRP_ADM, GRP_VEN, GRP_SEC

Cria usuários e associa-os aos grupos correspondentes.
Define senha padrão Senha123 e força troca no primeiro login.

Define permissões:
/adm, /ven, /sec → acesso restrito aos grupos (770)
/publico → acesso livre a todos (777)

Estrutura de Usuários
Grupo	Usuários
GRP_ADM	carlos, maria, joao
GRP_VEN	debora, sebastiana, roberto
GRP_SEC	josefina, amanda, rogerio

Execução
Dê permissão de execução:
chmod +x iacl.sh

Execute como root:
sudo ./iacl.sh


ou

sudo bash iacl.sh
