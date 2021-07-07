export SECRET_INSTANCE_ID=$1
export SECRET_ID=$2
export REGION=$3
export SECRETS_MANAGER_URL=https://$SECRET_INSTANCE_ID.$REGION.secrets-manager.appdomain.cloud
export SECRET_TYPE=$4
export API_KEY=$5
export USERNAME=$6
export PASSWORD=$7
export IAM_TOKEN=`curl -X POST   "https://iam.cloud.ibm.com/identity/token"   -H "Content-Type: application/x-www-form-urlencoded"   -H "Accept: application/json"   -d "grant_type=urn%3Aibm%3Aparams%3Aoauth%3Agrant-type%3Aapikey&apikey=$API_KEY" | jq -r ".access_token"`;

resource=$(curl -X GET "$SECRETS_MANAGER_URL/api/v1/secrets/$SECRET_TYPE/$SECRET_ID"   -H "Authorization: Bearer $IAM_TOKEN"   -H "Accept: application/json" | jq -r '.resources[0]')

if [ $SECRET_TYPE == "username_password" ] && [ $USERNAME == "true" ]; then
    export rabitmqusername=$(echo $resource | jq -r '.secret_data.username') 
    echo $rabitmqusername
elif [ $SECRET_TYPE == "username_password" ] && [ $PASSWORD == "true" ]; then
    export rabitmqpassword=$(echo $resource | jq -r '.secret_data.password')  
    echo $rabitmqpassword    
elif [ $SECRET_TYPE == "arbitrary" ]; then 
    export value=$(echo $resource | jq -r '.secret_data.payload')
    echo $value
elif [ $SECRET_TYPE == "iam_credentials" ]; then 
    export APIKEY=$(echo $resource | jq -r '.api_key')
    echo $APIKEY  
fi    

# echo "Creating rabbitmq secrets in schematics namespace...."
# kubectl create secret generic rabbitmq-password1 --from-literal=rabbitmq-password=$rabitmqpassword -n schematics
# kubectl create secret generic rabbitmq-username1 --from-literal=rabbitmq-username=$rabitmqusername -n schematics


