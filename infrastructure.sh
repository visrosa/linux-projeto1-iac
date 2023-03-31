#!/bin/bash
if (( $EUID != 0 )); then
    echo "Execute como administrador."
    exit
fi

# Criando grupos
			groupadd GRP_ADMIN
groupadd GRP_VEN
groupadd GRP_SEC

# Criando pastas e permissões
mkdir -m 770 /{adm,ven,sec}
mkdir -m 777 /publico
chown root:GRP_ADMIN /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

# Adicionando usuários.
# Opção -crypt não disponível no OpenSSL 3.0.2 padrão no meu sistema.
useradd -s /bin/bash -p $(openssl passwd senha123) -m -G GRP_ADMIN carlos; passwd carlos -e
useradd -s /bin/bash -p $(openssl passwd senha123) -m -G GRP_ADMIN maria; passwd maria -e
useradd -s /bin/bash -p $(openssl passwd senha123) -m -G GRP_ADMIN joao_; passwd joao_ -e

useradd -s /bin/bash -p $(openssl passwd senha123) -m -G GRP_VEN debora; passwd debora -e
useradd -s /bin/bash -p $(openssl passwd senha123) -m -G GRP_VEN sebastiana; passwd sebastiana -e
useradd -s /bin/bash -p $(openssl passwd senha123) -m -G GRP_VEN roberto; passwd roberto -e

useradd -s /bin/bash -p $(openssl passwd senha123) -m -G GRP_SEC josefina; passwd josefina -e
useradd -s /bin/bash -p $(openssl passwd senha123) -m -G GRP_SEC amanda; passwd amanda -e
useradd -s /bin/bash -p $(openssl passwd senha123) -m -G GRP_SEC rogerio; passwd rogerio -e
