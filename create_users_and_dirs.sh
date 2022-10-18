#!/bin/bash

echo "Criando diretórios..."

for dir in publico adm ven sec
do
    mkdir /$dir
done

echo "Criando grupos..."

for group in GRP_ADM GRP_VEN GRP_SEC
do
    groupadd $group
done

echo "Criando usuarios..."

for user in carlos maria joao debora sebastiana roberto josefina amanda rogerio
do
    useradd $user -m -s /bin/bash -p $(openssl passwd -crypt Senha123)
done

echo "Adicionando usuarios aos grupos..."

for grpuser in carlos maria joao
do
    usermod -aG GRP_ADM $grpuser
done

for grpuser in debora sebastiana roberto
do
    usermod -aG GRP_VEN $grpuser
done

for grpuser in josefina amanda rogerio
do
    usermod -aG GRP_SEC $grpuser
done

echo "Especificando propriedade dos diretorios..."

chown root:root /publico
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

echo "Especificando permissoes nos diretorios..."

chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "Tudo pronto."
