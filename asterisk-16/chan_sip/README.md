Patches para chan_sip

*patch_chan_sip_register_external_auth.patch*

Tipo: Funcionalidade

Descricao: Delega a aplicação externa o controle do REGISTER do Asterisk.
A aplicação externa pode ser desenvolvida em qualquer linguagem.

Aplicação: Controle de REGISTER por GeoIP, Quantidade máxima de usuários simultâneos, etc.

Asterisk: 16.10.0

Instalacao:

cd /usr/src

wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16.10.0.tar.gz

tar xfz asterisk-16.10.0.tar.gz

cd asterisk-16.10.0

wget https://raw.githubusercontent.com/neimaravila/AsteriskPatches/master/asterisk-16/chan_sip/patch_chan_sip_register_external_auth.patch

patch -p0 < patch_chan_sip_register_external_auth.patch

echo "exit 0" > /etc/asterisk/sip_auth.sh

chmod +x /etc/asterisk/sip_auth.sh

