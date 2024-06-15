set -a
source ./.env
set +a

aws ecr get-login-password --region ${AWS_ECR_REGION} --profile soni | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_ECR_REGION}.amazonaws.com

docker-compose -f docker-compose.build.yml build

docker tag hardhome-frontend-service-image-prod:latest ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_ECR_REGION}.amazonaws.com/hardhome-frontend-service-image-prod:latest
docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_ECR_REGION}.amazonaws.com/hardhome-frontend-service-image-prod:latest