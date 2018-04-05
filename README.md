
# Velkommen til huben om Containerteknologi

## Stikkord
- Best practice
- Docker
- Kubernetes ([k8s](https://kubernetes.io/))
- Debugging
- Mikrotjenester
- Infrastructure as code ([Terraform](https://www.terraform.io/))
- Logging ([fluentD](https://www.fluentd.org/) -> [Promethius](https://prometheus.io/))
- Autoscaling
- Håndtering av secrets ([hashicorp Vault](https://www.vaultproject.io/))
- ServiceMesh ([istion](https://istio.io/))

## Ressurser
- Slack kanal: #hub-container
- MW repo: https://github.com/makingwaves/hub-containers-docs.git
- Azure: spør Pål Rønning om tilgang
- Microsoft writeup for kubernetes arkitektur https://docs.microsoft.com/nb-no/azure/architecture/microservices/
- Kubernetes app som vi kan bruke i bunn så vi slipper å skrive kode selv https://github.com/mspnp/microservices-reference-implementation


## Mål
### delmål 1:
    Sette opp Kubernetes-kluster med noen noder, med database og persistant storage.
    CD med deploy uten nedetid.
    Kubernetes instansen skal kunne rives og settes opp mellom hvert hub møte
    
### Ideer/backlog
    Bibliotek av ulike tjenester (Elastic, Epi, .Net, ...)?
    Sikkerhet, f.eks. TLS-terminering med Træfik? https://medium.com/@patrickeasters/using-traefik-with-tls-on-kubernetes-cb67fb43a948

## Funn
