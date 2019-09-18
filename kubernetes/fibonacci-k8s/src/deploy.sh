docker build -t aishpra/multi-client:latest -t aishpra/multi-client:$SHA -f ./clientDockerfile ./client 
docker build -t aishpra/multi-server:latest -t aishpra/multi-server:$SHA -f ./server/Dockerfile ./server 
docker build -f aishpra/multi-worker:latest -t aishpra/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push aishpra/multi-client:latest
docker push aishpra/multi-server:latest
docker push aishpra/multi-worker:latest

docker push aishpra/multi-client:$SHA
docker push aishpra/multi-server:$SHA
docker push aishpra/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=aishpra/multi-server:$SHA
kubectl set image deployments/client-deployment client=aishpra/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=aishpra/multi-worker:$SHA 
