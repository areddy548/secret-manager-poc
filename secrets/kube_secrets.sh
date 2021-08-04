export API_KEY=$1
redisdevsouthpwd=$(./secrets_download.sh f1908db5-13d9-45c0-bd13-06a4224b44bc f96271f8-4d61-5cd4-ec94-b49f1d196630 us-south arbitrary $API_KEY "false" "false")

kubectl create secret generic redis-dev-south-pwd-copy --from-literal=retn_value=$redisdevsouthpwd -n monitor

redisdeveastpwd=$(./secrets_download.sh f1908db5-13d9-45c0-bd13-06a4224b44bc 1fbe9c2c-036f-3344-9c3e-ac5376cdcdde us-south arbitrary $API_KEY "false" "false")

kubectl create secret generic redis-dev-east-pwd-copy --from-literal=retn_value=$redisdeveastpwd -n monitor


rabitMQUsername=$(./secrets_download.sh f1908db5-13d9-45c0-bd13-06a4224b44bc 158d5616-1277-76b6-5ab3-81c453cd11f2 us-south arbitrary $API_KEY "false" "false")

kubectl create secret generic rabbitmq-username-copy --from-literal=retn_value=$rabitMQUsername -n monitor

rabitMQPassword=$(./secrets_download.sh f1908db5-13d9-45c0-bd13-06a4224b44bc c7f94485-f224-c6e0-b923-71e43de87efc us-south arbitrary $API_KEY "false" "false")

kubectl create secret generic rabbitmq-password-copy --from-literal=retn_value=$rabitMQPassword -n monitor

sysdigApiKey=$(./secrets_download.sh f1908db5-13d9-45c0-bd13-06a4224b44bc 0df55f71-4342-4513-fb2b-9ce54901b10c us-south arbitrary $API_KEY "false" "false")

kubectl create secret generic sysdig-apikey-copy --from-literal=retn_value=$sysdigApiKey -n monitor

sysdigSupertenantKey=$(./secrets_download.sh f1908db5-13d9-45c0-bd13-06a4224b44bc 2c9e426a-ade1-a81d-a74b-9ae076db15e4 us-south arbitrary $API_KEY "false" "false")

kubectl create secret generic sysdig-supertenant-key-copy --from-literal=retn_value=$sysdigSupertenantKey -n monitor

kpServiceApikey=$(./secrets_download.sh f1908db5-13d9-45c0-bd13-06a4224b44bc 7f7fe82c-2c1e-9726-e9c8-ea9997d94fda us-south arbitrary $API_KEY "false" "false")

kubectl create secret generic kp-service-apikey-copy --from-literal=retn_value=$kpServiceApikey -n monitor

edbApiKey=$(./secrets_download.sh f1908db5-13d9-45c0-bd13-06a4224b44bc 901d34ca-5f15-5e6e-9400-1838692bbebc us-south arbitrary $API_KEY "false" "false")

kubectl create secret generic edb-api-keyy-copy --from-literal=retn_value=$edbApiKey -n monitor

rabbitmqCaBase64=$(./secrets_download.sh f1908db5-13d9-45c0-bd13-06a4224b44bc ca600c02-ac57-feb7-9342-217f173eac0e us-south arbitrary $API_KEY "false" "false")

kubectl create secret generic rabbitmq-ca-base64-copy --from-literal=retn_value=$rabbitmqCaBase64 -n monitor


crDockerPassword=$(./secrets_download.sh f1908db5-13d9-45c0-bd13-06a4224b44bc 066e1a79-712c-7007-076e-90730e3d2831 us-south arbitrary $API_KEY "false" "false")

kubectl create secret docker-registry image-repo-secret-copy --docker-username='iamapikey' --docker-password=$crDockerPassword --docker-email='schmatic@in.ibm.com' --docker-server="us.icr.io" --namespace monitor --request-timeout 4m