
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


## Introduction

The use of Containerization has grown rapidly the last years, but have a long history behind closed doors. Major cloud vendors like google have orchestrated containers for a very long time internally. Many of the tools that are developed in the open today, are buildt on the knowledge that cloud vendors have gathered the last few decades. This have made it possible of the explotion of tools and usage of containers. An enabler of containers and serverless architecture movement is the cloud first and scalability needs that the large entities need to provide for their customers. This is called Cloud Native. We are starting to see contours of a "winning" stack wich consists of docker/Kubernetes and fluentd/promethious/jaeger/opentracing on logging/monitoring. The best example of this is cloud vendors goals of providing managed K8s clusters to their customers.

To support this small and large companies have formed an organisation to monitor and support promising and established tools in this technology space called [CNCF](https://www.cncf.io/) (Cloud Native Computing Foundation). To get an overView of projects that CNCF is working on check out https://landscape.cncf.io/. They have different tiers of projects they are working on, and a good requirements for a project to join the foundation. The goal is to promote promising technologies, and let them go if it does not work or something else gets more adoption. Therefore there might be more than one projects that have overlapping areas of expertise. 

For the .net world the amount of different tools and companies might feel offputting, because we are used to few known solutions that work, and that it generally is a good .net alternative from microsoft. We have begun to see changes here where json.net, xunit and serilog is used instead of microsoft tools by the .net core team, and generally alot of development is more open if not opensource. Microsoft joined CNCF [summer 2017](https://www.cncf.io/announcement/2017/07/26/microsoft-joins-cloud-native-computing-foundation-platinum-member/), and sits on the board together with other big players like Cisco, Google, Huwavei, Intel, RedHat, IBM, Oracle, Amazon.

## Installation of kubernetes

## useful minikube commands

* `minikube dashboard` opens K8s in browser

### Windows

The easiest way to install K8s and minikube on Windows is to use [chokolatey](https://chocolatey.org/install)

* `choco install minikube -y` will install both `kubectl` and `minikube`.
* Create a hyper-v virtual switch. Search for hyperv on your machine, and create a switch lie this:   
<img src="./docs/images/hyperv-createSwitch.png" alr="hyperv switch creation" width="700" />
* `minikube start --vm-driver hyperv --hyperv-virtual-switch "myhypervswitch"`

    If you get problems run `minikube delete`to start over.