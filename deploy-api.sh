aws ecr get-login-password --region us-east-1 --profile harshil-hardhome | docker login --username AWS --password-stdin ACCOUNTID.dkr.ecr.us-east-1.amazonaws.com

docker-compose -f docker-compose.build.yml build

docker tag hardhome-api-service-image-build:latest ACCOUNTID.dkr.ecr.us-east-1.amazonaws.com/hardhome-api-service-image-prod:latest
docker push ACCOUNTID.dkr.ecr.us-east-1.amazonaws.com/hardhome-api-service-image-prod:latest