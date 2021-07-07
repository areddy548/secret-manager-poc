
retn_value=$(./secrets_download.sh $1 $2 $3 $4 $5 $6 $7)

kubectl create secret generic rabbitmq-password4 --from-literal=retn_value=$retn_value -n schematics