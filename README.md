# Webserver Ansible
Este projeto consiste em automatizar a criação e configuração de duas máquinas virtuais usando o Vagrant. 
As máquinas são baseadas na imagem do CentOS 7. Em seguida, o Ansible é usado para provisionar as máquinas virtuais, instalando o Node.js, o npm, o PM2, o Git e clonando um repositório do GitHub.
Além disso, uma porta de rede é aberta e a aplicação é exposta usando o PM2.

## Steps

> Criação das máquinas virtuais:

Usamos o Vagrant para criar duas máquinas virtuais web1 e web2. Essas máquinas são baseadas na imagem do CentOS 7 
e possuem endereços IP privados. A máquina "web1" é acessível na porta 8082 e a máquina "web2" é acessível na porta 8081.

> Provisionamento de software com o Ansible:

Depois que as máquinas virtuais são criadas, usamos o Ansible para provisioná-las. O Ansible executa uma série de tarefas em todas as máquinas virtuais definidas no inventário. As tarefas incluem:

- Remoção de um script de instalação do NodeSource, se existir.
- Download de um script de instalação do NodeSource.
- Execução do script de instalação do NodeSource para instalar o Node.js e o npm.
- Instalação do PM2 globalmente usando o npm.
- Instalação do Git.
- Clonagem de um repositório do GitHub.
- Abertura da porta 8080 no firewall.
- Exposição da aplicação clonada usando o PM2 na porta 8080.

> Configuração de chaves de autenticação:

O arquivo "provision.sh" contém uma chave pública SSH que é adicionada ao arquivo "authorized_keys" do usuário "vagrant" nas máquinas virtuais.
Isso permite a autenticação SSH sem senha entre a máquina host e as máquinas virtuais.

## How to use

Primeiramente deve usar o:
```sh
git clone https://github.com/Devilicht/Webserver-Ansible
```
Para ter os arquivos em seu diretorio. Em seguida voce precisa "subir" as maquinas virtuais com o comando:
```sh
vagrant up
```
Depois das maquinas "Subirem" voce ja consegue rodar o playbook com o comando:
```sh
ansible-playbook config-static-server.yaml
```
Ja consegue dar um GET nos ip's das maquinas com a porta ``8080``.
