# DevOps Excercise: Kubernetes & Helm

## Exercise

1. Create a 3-nodes cluster with kind or minikube and push the cluster configuration file of your chosen tool here

2. Create the kubernetes templates to deploy the exercise 1.  
You don't have to manage persistence right now

3. Convert the templates to an Helm chart

## Delivery

1. I have created the 3 nodes cluster with kind with `kind-config.yml` configuration,  command used
   ```shell
   kind create cluster --name k8s-exercise3 --config kind-config.yml
   ```
2. yaml files for deployment
   ```shell
   kubectl apply -f 00-namespace.yml -f 01-secrets.yml -f 02-deploy-db.yml -f 03-deploy-web.yml
   ```
3. In folder `helm_exercise3` , please first create namespace and secrets
   ```shell
   # creating helm template structure
   helm create helm_exercise3
   ```
   ```shell
   kubectl create ns exercise3 # or take it from 00-namespace.yml
   ```
   ```shell
   kubectl create -n exercise3 secrets... # or take it from 01-secerts.yml
   ```
   ```shell
   # from helm_exercise3 folder
   helm install exercise3-web -n exercise3 . -f exercise3-web-values.yaml
   ```
   ```shell
   # from helm_exercise3 folder
   helm install exercise3-db -n exercise3 . -f exercise3-db-values.yaml
   ```
   

   