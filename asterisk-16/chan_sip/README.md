Patches para chan_sip

*patch_chan_sip_register_external_auth.patch*

Tipo: Funcionalidade

Descricao: Delega a aplicação externa o controle do REGISTER do Asterisk.
A aplicação externa pode ser desenvolvida em qualquer linguagem.

Aplicação: Controle de REGISTER por GeoIP, Quantidade máxima de usuários simultâneos, etc.

Asterisk: 16.10.0
Sistema Operacional: CentOS 7

Instalacao:

yum install -y epel-release
yum install -y libmaxminddb-devel

cd /usr/src

wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16.10.0.tar.gz

tar xfz asterisk-16.10.0.tar.gz

cd asterisk-16.10.0

wget https://raw.githubusercontent.com/neimaravila/AsteriskPatches/master/asterisk-16/chan_sip/patch_chan_sip_register_external_auth.patch

patch -p0 < patch_chan_sip_register_external_auth.patch

./configure

make

make install

make samples

make config

cd /etc/asterisk

wget https://raw.githubusercontent.com/neimaravila/AsteriskPatches/master/asterisk-16/chan_sip/sip_auth.sh

chmod +x sip_auth.sh

Baixar o Arquivo GeoLite2-City.mmdb em https://dev.maxmind.com/geoip/geoip2/geolite2/ (Necessário Cadastro)
para a pasta /etc/asterisk/

Criar o arquivo /etc/asterisk/cidades_autorizadas.txt com as cidades autorizadas a Logar
