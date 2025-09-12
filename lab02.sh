#1. Instalando openSSH
sudo apt-get update
sudo apt-get install openssh-server
#verificar status
sudo systemctl status ssh
#output
enable

#2. accesar usuario
ssh usuario@ip
#confirmar
yes
#digite a senha
senha

#3. configurando
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bkp
#configurar arquivo
sudo nano /etc/ssh/sshd_config
#alterar porta
Port 2244
#desabilitar login de root
PermitRootLogin no
#salvar e fechar arquivo
Ctrl + O, Enter, Ctrl + X

#4. Teste e validação
#reniciar serviço ssh
sudo systemctl restart sshd
#testar serviço na porta
ssh usuario@ip -p 2244
#exemplo
ssh roberto@10.0.2.15 -p 2244
#output
connect to host 10.0.2.15 port 2244: connection refused
#testar bloqueio do root
ssh root@ip -p 2244
connect to host 10.0.2.15 port 2244: connection refused
