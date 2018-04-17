
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
    
## Ideer/backlog
- Bibliotek av ulike tjenester (Elastic, Epi, .Net, ...)?
- Sikkerhet, f.eks. TLS-terminering med Træfik? https://medium.com/@patrickeasters/using-traefik-with-tls-on-kubernetes-cb67fb43a948

## Funn

## Installation of kubernetes

## useful minikube commands

* `minikube dashboard` opens K8s in browser

### Windows

The easiest way to install K8s and minikube on Windows is to use [chokolatey](https://chocolatey.org/install)

> hyperv, docker-machine and minikube have some bugs. If you get powershell module not found on minikube v0.26+.
> downgrade to minikube 0.25: `choco install minikube --version 0.25.0 --allow-downgrade -y`

* `choco install minikube -y` will install both `kubectl` and `minikube`.
* Create a hyper-v virtual switch. Search for hyperv on your machine, and create a switch lie this:   
<img src="./docs/images/hyperv-createSwitch.png" alr="hyperv switch creation" width="700" />
* `minikube start --vm-driver hyperv --hyperv-virtual-switch "myhypervswitch"`

    If you get problems run `minikube delete`to start over.