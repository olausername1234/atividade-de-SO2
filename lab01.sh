# 1.Criacao de grupos
sudo groupadd desenvolvedores
sudo groupadd testadores

#verificacao de grupos criados
cat /etc/group | grep -E `desenvolvedores|testadores`

#output
desenvolvedores:x:1002:
testadores:x:1003:

# 2.criacao de usuarios

sudo useradd -m -g desenvolvedores dev_senior
sudo useradd -m -g desenvolvedores dev_junior
sudo useradd -m -g testadores qa_analyst
sudo usermod -aG testadores dev_senior

#verificacao de usuarios criados
cat /etc/passwd | grep -E `dev_senior|dev_junior|qa_analyst`

#output
dev_senior:x:1002:1002::/home/dev_senior:/bin/sh
dev_junior:x:1003:1002::/home/dev_junior:/bin/sh
qa_analyst:x:1004:1003::/home/qa_analyst:/bin/sh

# 3.definicao de senha
sudo passwd <nome_de_usuarios>

# 4.Estrutura de diretorios
sudo mkdir -p /srv/projetos/backend
sudo mkdir -p /srv/projetos/frontend

# 5.Gerenciamento de permissoes
sudo chown -R dev_senior:desenvolvedores /srv/projetos
sudo chmod -R 750 /srv/projetos

#verificacao
ls -l /srv/

#output
total 0
drwxr-x--- 4 dev_senior desenvolvedores 80 Sep  8 18:44 projetos

# 6.Controle de processos
sudo login dev_junior
sleep 500 &

#verificar PID
ps aux | grep sleep

#ou
jobs

#output
[1] + Running                    sleep 500

#adicionar usuario na lista de sudo

#finalizar processo
sudo kill <PID>

# 7.ShellScript de boas-vindas

#!/bin/bash
echo '==========================='
echo 'Bem-vindo ao servidor de desenvolvimento'
echo 'Data e hora atual: $(date)'
echo '==========================='


# 7.1.Permissao de execucao
sudo chmod 755 /usr/local/bin/boasvindas.sh

