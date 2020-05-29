#!/bin/bash
RAMAL=$1
IP=$2
LOG=/tmp/log_geoip.txt

echo "" >> $LOG
echo "Ramal: $RAMAL" >> $LOG
IP=`(echo $IP | awk -F":" '{print $1}')`

echo "EnderecoIP: $IP" >> $LOG

res=`(/usr/bin/mmdblookup --file /etc/asterisk/GeoLite2-City.mmdb --ip $IP city names en)`
status=$?
if [ $status -eq 0 ];
        then
                res=`(echo $res |awk -F'"' '{print $2}' | awk 'NF > 0' )`
                echo "Cidade: " $res >> $LOG
                if grep -q "$res" "/etc/asterisk/cidades_autorizadas.txt";
                        then
                                echo "Cidade Autorizada" >> $LOG
                                exit 0
                        else
                                echo "Cidade Nao Autorizada" >> $LOG
                                exit 1
                        fi
        else
                echo "Cidade Nao Encontrada no Geoip" >> $LOG
                exit 0 # Caso a Cidade nao exista, permitir
                #exit 1 # Caso a Cidade nao exista, negar
fi
exit 0
