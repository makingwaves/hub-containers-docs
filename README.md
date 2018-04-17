
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

## Installering av kubernetes

### Windows

Den enkleste måten å installere K8s og minikube på windows er å bruke [chokolatey](https://chocolatey.org/install)

> hyperv, docker-machine og minikube har noen bugs. minikube v0.26.0 hvis en får error powershell module ...
> installer minikube 0.25: `choco install minikube --version 0.25.0 --allow-downgrade -y`

* `choco install minikube -y` installerere både `kubectl` og `minikube`.
* Opprette en hyper-v nettverksswitsj. Søk etter hyperv på maskinen og lag en ny switch:   
<img src="./docs/images/hyperv-createSwitch.png" alr="hyperv switch creation" width="700" />
* `minikube start --vm-driver hyperv --hyperv-virtual-switch "myhypervswitch"`

    Hvis en får problemer kjør `minikube delete` og prøv på nytt