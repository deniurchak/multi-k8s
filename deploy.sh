docker build -t deniurchak/multi-client -f ./client/Dockerfile ./client
docker build -t deniurchak/multi-server -f ./server/Dockerfile ./server
docker build -t deniurchak/multi-worker -f ./worker/Dockerfile ./worker
docker push deniurchak/multi-client
docker push deniurchak/multi-server
docker push deniurchak/multi-worker
kubectl apply -f k8s
kubectl rollout restart deployments/server-deployment 
kubectl rollout restart deployments/worker-deployment 
kubectl rollout restart deployments/client-deployment 