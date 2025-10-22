#!/bin/bash 
# iacl.sh - criação de diretórios, grupos e usuários (ubtu 22.04) 

# Arquivo ficou um pouco diferente do professor pq a versão do ubutu difere na criação do usuário do exemplo da aula

# executar como sudo su 

# executar ./iacl.sh # iacl.sh — criação de diretórios, grupos e usuários (Ubuntu 22.04+) # Executar como root: sudo bash iacl.sh 

# dar permissão no arquivo chmod +x iacl.sh


echo ">>> Criando diretórios..."
mkdir -p /publico /adm /ven /sec

echo ">>> Criando grupos de usuários..."
groupadd GRP_ADM 2>/dev/null || true
groupadd GRP_VEN 2>/dev/null || true
groupadd GRP_SEC 2>/dev/null || true

# Função utilitária para criar usuário no Ubuntu 22.04:
# - cria home (-m), shell bash (-s)
# - coloca no grupo informado (-G)
# - define senha via chpasswd
# - força troca de senha no primeiro login (chage -d 0)
add_user() {
  local usuario="$1"
  local grupo="$2"
  local senha="${3:-Senha123}"

  if id "$usuario" &>/dev/null; then
    echo "Usuário $usuario já existe. Ajustando grupo/senha..."
    usermod -aG "$grupo" "$usuario"
  else
    useradd -m -s /bin/bash -G "$grupo" "$usuario"
  fi

  echo "${usuario}:${senha}" | chpasswd
  chage -d 0 "$usuario"
}

echo ">>> Criando usuários..."
# GRP_ADM
add_user carlos    GRP_ADM
add_user maria     GRP_ADM
add_user joao      GRP_ADM

# GRP_VEN
add_user debora    GRP_VEN
add_user sebastiana GRP_VEN
add_user roberto   GRP_VEN

# GRP_SEC
add_user josefina  GRP_SEC
add_user amanda    GRP_SEC
add_user rogerio   GRP_SEC

echo ">>> Especificando permissões dos diretórios..."
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

# /publico normalmente é aberto a todos nesse exercício
chmod 777 /publico

echo ">>> Concluído!"

