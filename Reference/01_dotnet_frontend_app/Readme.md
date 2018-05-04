
### .Net Core App 

A very simple load-balanced service that runs .Net Core app with an external IP and 3 backend pods. 

To run locally (prerequisites: minicube and kubectl installed)

```bash
minikube start
kubectl config use-context minikube
kubectl apply -f dotnet_frontend.yaml
```

Useful commands: 
```bash
# Visit service 
minikube service dotnet-frontend-service

# List services
minikube service list

#View Kubernetes dashboard
minikube dashboard
```

