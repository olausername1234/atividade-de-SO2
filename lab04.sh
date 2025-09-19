#1. instalar apache
sudo apt-get update sudo
sudo apt-get install apache2

#1.2 criar uma pagina de teste simples
echo "<h1>Bem-vindo ao Servidor Web da Empresa!<h1>" | sudo tee /var/www/html/index.html

#output
Bem-vindo ao Servidor Web da Empresa!

#1.3 testar acesso no navegador
http://ip_da_maquina

#2. instalar e configurar o DNS
#instalar bind9
sudo apt-get install bind9

#2.1 configurar uma zona no BIND
sudo nano /etc/bind/named.conf.local

#Adicionar
zone "empresa.local" {
type master;
file "etc/bind/db.empresa.local";
};

#2.2 criar o arquivo da zona de pesquisa direta
sudo nano /etc/bind/db.empresa.local

#Adicionar
  GNU nano 7.2                            /etc/bind/db.empresa.local                                      
$TTL604800
@IN SOA ns1.empresa.local. root.empresa.local.
(2 ; Serial
604800 ; Refresh
86400 ; Retry
2419200 ; Expire
604800 ) ; Negative Cache TTL
:
@IN NS ns1.empresa.local.
ns1 IN A ip_da_maquina
www IN A ip_da_maquina

#3 Reniciar, configurar cliente e testar

#3.1 reniciar o bind
sudo systemctl restart bind9

#3.2 configurar o DNS da maquina
sudo nano /etc/resolv.conf:

#Adicionar
nameserver 127.0.0.1

#3.3 testar a resolucao de nome
dig www.empresa.local

#3.4 Teste final
curl http://www.empresa.local






