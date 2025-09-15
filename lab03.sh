#1. Instalar do SAMBA
sudo apt-get update
sudo apt-get install samba

#2. adicionar usuarios ao SAMBA
sudo smbpasswd -a dev_senior
sudo smbpasswd -a dev_junior

#3. Criar diretorios para compartilhamento
sudo mkdir -p /srv/samba/publico
sudo chown nobody:nogroup /srv/samba/publico 
sudo chmod 777 /srv/samba/publico

#4. Configurar e compartilhar
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bkp
sudo nano /etc/samba/smb.conf

#adicionar

[Publico]
comment = Compartilhamento publico de  arquivos
path = /srv/samba/publico
browsable = yes
writable =  yes
guest ok = yes
read only = no

[Projetos]
comment =  Acesso restrito para a equipe de desenvolvimento
path = /srv/projetos
valid users = @desenvolvimento
read only = no
browsable = yes
writable = yes

#5. Reniciar e testar

sudo systemctl restart smbd
sudo systemctl restart nmbd
testparm

#output
active (running)

[Publico]
	comment = Compartilhamento public de arquivos
	guest ok = Yes
	path = /srv/samba/publico
	read only = No


[Projetos]
	comment = acesso restrito para a equipe de desenvolvimento
	path = /srv/projetos
	read only = No
	valid users = @desenvolvedores

