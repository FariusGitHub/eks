# AWS ELASTIC KUBERNETES SERVICE (EKS)

AWS EKS (Amazon Elastic Kubernetes Service) is a managed service provided by Amazon Web Services (AWS) for running Kubernetes on AWS. It simplifies the process of deploying, managing, and scaling containerized applications using Kubernetes. EKS eliminates the need for managing the underlying infrastructure and allows users to focus on their applications. It provides features such as automatic scaling, high availability, and security for Kubernetes clusters. EKS integrates with other AWS services, making it easier to build and deploy applications on AWS infrastructure.

| Feature          | AWS EKS                                      | GCP GKE                                      | Azure AKS                                    |
|------------------|----------------------------------------------|----------------------------------------------|----------------------------------------------|
| Managed Service  | Yes                                          | Yes                                          | Yes                                          |
| Kubernetes       | Supports latest version of Kubernetes         | Supports latest version of Kubernetes         | Supports latest version of Kubernetes         |
| Scalability      | Auto-scaling capabilities                     | Auto-scaling capabilities                     | Auto-scaling capabilities                     |
| Availability     | High availability with multiple availability zones | High availability with multiple availability zones | High availability with multiple availability zones |
| Networking       | VPC networking                                | VPC networking                                | VNet networking                              |
| Load Balancing   | Integrated with AWS Load Balancer             | Integrated with GCP Load Balancer             | Integrated with Azure Load Balancer           |
| Monitoring       | Integration with CloudWatch for monitoring    | Integration with Stackdriver for monitoring   | Integration with Azure Monitor for monitoring |
| Security         | IAM integration for access control            | IAM integration for access control            | Azure Active Directory integration for access control |
| Pricing          | Pay for EC2 instances and EKS control plane   | Pay for GCE instances and GKE control plane   | Pay for AKS nodes and Azure resources         |


There are two ways to launch EKS cluster

|**with eksctl create cluster**|**with eksctl create cluster -f cluster.yaml**|
|:----|:----|
| $ eksctl create cluster --region=us-east-1 --name=eks-farius2 <br> 2024-02-07 19:27:38 [ℹ]  eksctl version 0.170.0 <br> 2024-02-07 19:27:38 [ℹ]  using region us-east-1 <br> 2024-02-07 19:27:39 [ℹ]  setting availability zones to [us-east-1c us-east-1a] <br> 2024-02-07 19:27:39 [ℹ]  subnets for us-east-1c - public:192.168.0.0/19 private:192.168.64.0/19 <br> 2024-02-07 19:27:39 [ℹ]  subnets for us-east-1a - public:192.168.32.0/19 private:192.168.96.0/19 <br> 2024-02-07 19:27:39 [ℹ]  nodegroup "ng-3fdf95db" will use "" [AmazonLinux2/1.27] <br> 2024-02-07 19:27:39 [ℹ]  using Kubernetes version 1.27 <br> 2024-02-07 19:27:39 [ℹ]  creating EKS cluster "eks-farius2" in "us-east-1" region with managed nodes <br> 2024-02-07 19:27:39 [ℹ]  will create 2 separate CloudFormation stacks for cluster itself and the initial managed nodegroup <br> 2024-02-07 19:27:39 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-1 --cluster=eks-farius2' <br> 2024-02-07 19:27:39 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "eks-farius2" in "us-east-1" <br> 2024-02-07 19:27:39 [ℹ]  CloudWatch logging will not be enabled for cluster "eks-farius2" in "us-east-1" <br> 2024-02-07 19:27:39 [ℹ]  you can enable it with 'eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=us-east-1 --cluster=eks-farius2' <br> 2024-02-07 19:27:39 [ℹ]  <br> 2 sequential tasks: { create cluster control plane "eks-farius2",  <br>     2 sequential sub-tasks: {  <br>         wait for control plane to become ready, <br>         create managed nodegroup "ng-3fdf95db", <br>     } <br> } <br>2024-02-07 19:27:39 [ℹ]  building cluster stack "eksctl-eks-farius2-cluster" <br> 2024-02-07 19:27:39 [ℹ]  deploying stack "eksctl-eks-farius2-cluster" <br> 2024-02-07 19:28:09 [ℹ]  waiting for CloudFormation stack "eksctl-eks-farius2-cluster" <br> 2024-02-07 19:40:15 [ℹ]  to cleanup resources, run 'eksctl delete cluster --region=us-east-1 --name=eks-farius2' <br> | $ eksctl create cluster -f cluster.yaml <br> 2024-02-07 19:53:50 [ℹ]  eksctl version 0.170.0 <br> 2024-02-07 19:53:50 [ℹ]  using region eu-north-1 <br> 2024-02-07 19:53:52 [ℹ]  setting availability zones to [eu-north-1c eu-north-1b eu-north-1a] <br> 2024-02-07 19:53:52 [ℹ]  subnets for eu-north-1c - public:192.168.0.0/19 private:192.168.96.0/19 <br> 2024-02-07 19:53:52 [ℹ]  subnets for eu-north-1b - public:192.168.32.0/19 private:192.168.128.0/19 <br> 2024-02-07 19:53:52 [ℹ]  subnets for eu-north-1a - public:192.168.64.0/19 private:192.168.160.0/19 <br> 2024-02-07 19:53:54 [ℹ]  nodegroup "ng-1" will use "ami-08e44f1e4c28c4d00" [AmazonLinux2/1.27] <br> 2024-02-07 19:53:54 [ℹ]  nodegroup "ng-2" will use "ami-08e44f1e4c28c4d00" [AmazonLinux2/1.27] <br> 2024-02-07 19:53:54 [ℹ]  using Kubernetes version 1.27 <br> 2024-02-07 19:53:54 [ℹ]  creating EKS cluster "basic-cluster" in "eu-north-1" region with un-managed nodes <br> 2024-02-07 19:53:54 [ℹ]  2 nodegroups (ng-1, ng-2) were included (based on the include/exclude rules) <br> 2024-02-07 19:53:54 [ℹ]  will create a CloudFormation stack for cluster itself and 2 nodegroup stack(s) <br> 2024-02-07 19:53:54 [ℹ]  will create a CloudFormation stack for cluster itself and 0 managed nodegroup stack(s) <br> 2024-02-07 19:53:54 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=eu-north-1 --cluster=basic-cluster' <br>
2024-02-07 19:53:54 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "basic-cluster" in "eu-north-1" <br> 2024-02-07 19:53:54 [ℹ]  CloudWatch logging will not be enabled for cluster "basic-cluster" in "eu-north-1" <br> 2024-02-07 19:53:54 [ℹ]  you can enable it with 'eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=eu-north-1 --cluster=basic-cluster' <br> 2024-02-07 19:53:54 [ℹ]  <br> 2 sequential tasks: { create cluster control plane "basic-cluster",  <br>     2 sequential sub-tasks: { <br>         wait for control plane to become ready, <br>         2 parallel sub-tasks: {  <br>             create nodegroup "ng-1", <br>             create nodegroup "ng-2", <br>         }, <br>     }  <br> } <br> 2024-02-07 19:53:54 [ℹ]  building cluster stack "eksctl-basic-cluster-cluster" <br> 2024-02-07 19:53:57 [ℹ]  deploying stack "eksctl-basic-cluster-cluster" <br> 2024-02-07 19:54:27 [ℹ]  waiting for CloudFormation stack "eksctl-basic-cluster-cluster" <br>

<br><br>

## eksctl create cluster
To start and stop EKS cluster is a long process. It could take 15 minutes. Look at below exercise.

Start at 2024-02-07 20:18:56 <br>
Finish at 2024-02-07 20:34:35 <br>
Duration 16 minutes <br>

 ```sh
 eksctl create cluster \
--name ${CLUSTER_NAME} \
--version 1.28 \
--region ${CLUSTER_REGION} \
--nodegroup-name linux-nodes \
--node-ami-family AmazonLinux2 \
--node-type m5.xlarge \
--nodes 3 \
--nodes-min 1 \
--nodes-max 10 \
--managed \
--with-oidc \
--ssh-access \
--asg-access \
--ssh-public-key ~/.ssh/id_rsa.pub
2024-02-07 20:18:56 [ℹ]  eksctl version 0.170.0
2024-02-07 20:18:56 [ℹ]  using region us-east-1
2024-02-07 20:18:58 [ℹ]  skipping us-east-1e from selection because it doesn't support the following instance type(s): m5.xlarge
2024-02-07 20:18:58 [ℹ]  setting availability zones to [us-east-1a us-east-1c]
2024-02-07 20:18:58 [ℹ]  subnets for us-east-1a - public:192.168.0.0/19 private:192.168.64.0/19
2024-02-07 20:18:58 [ℹ]  subnets for us-east-1c - public:192.168.32.0/19 private:192.168.96.0/19
2024-02-07 20:18:58 [ℹ]  nodegroup "linux-nodes" will use "" [AmazonLinux2/1.28]
2024-02-07 20:18:58 [ℹ]  using SSH public key "/home/devops/.ssh/id_rsa.pub" as "eksctl-farius-eks-nodegroup-linux-nodes-a8:26:c0:c3:7e:7a:7a:b3:d0:86:56:87:32:a4:59:71" 
2024-02-07 20:18:59 [ℹ]  using Kubernetes version 1.28
2024-02-07 20:18:59 [ℹ]  creating EKS cluster "farius-eks" in "us-east-1" region with managed nodes
2024-02-07 20:18:59 [ℹ]  will create 2 separate CloudFormation stacks for cluster itself and the initial managed nodegroup
2024-02-07 20:18:59 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-1 --cluster=farius-eks'
2024-02-07 20:18:59 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "farius-eks" in "us-east-1"
2024-02-07 20:18:59 [ℹ]  CloudWatch logging will not be enabled for cluster "farius-eks" in "us-east-1"
2024-02-07 20:18:59 [ℹ]  you can enable it with 'eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=us-east-1 --cluster=farius-eks'
2024-02-07 20:18:59 [ℹ]  
2 sequential tasks: { create cluster control plane "farius-eks", 
    2 sequential sub-tasks: { 
        4 sequential sub-tasks: { 
            wait for control plane to become ready,
            associate IAM OIDC provider,
            2 sequential sub-tasks: { 
                create IAM role for serviceaccount "kube-system/aws-node",
                create serviceaccount "kube-system/aws-node",
            },
            restart daemonset "kube-system/aws-node",
        },
        create managed nodegroup "linux-nodes",
    } 
}
2024-02-07 20:18:59 [ℹ]  building cluster stack "eksctl-farius-eks-cluster"
2024-02-07 20:19:00 [ℹ]  deploying stack "eksctl-farius-eks-cluster"
2024-02-07 20:19:30 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-cluster"
2024-02-07 20:20:00 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-cluster"
2024-02-07 20:21:01 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-cluster"
2024-02-07 20:22:01 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-cluster"
2024-02-07 20:23:01 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-cluster"
2024-02-07 20:24:01 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-cluster"
2024-02-07 20:25:02 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-cluster"
2024-02-07 20:26:02 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-cluster"
2024-02-07 20:27:02 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-cluster"
2024-02-07 20:28:03 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-cluster"
2024-02-07 20:30:05 [ℹ]  building iamserviceaccount stack "eksctl-farius-eks-addon-iamserviceaccount-kube-system-aws-node"
2024-02-07 20:30:06 [ℹ]  deploying stack "eksctl-farius-eks-addon-iamserviceaccount-kube-system-aws-node"
2024-02-07 20:30:06 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-addon-iamserviceaccount-kube-system-aws-node"
2024-02-07 20:30:36 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-addon-iamserviceaccount-kube-system-aws-node"
2024-02-07 20:30:37 [ℹ]  serviceaccount "kube-system/aws-node" already exists
2024-02-07 20:30:37 [ℹ]  updated serviceaccount "kube-system/aws-node"
2024-02-07 20:30:37 [ℹ]  daemonset "kube-system/aws-node" restarted
2024-02-07 20:30:37 [ℹ]  building managed nodegroup stack "eksctl-farius-eks-nodegroup-linux-nodes"
2024-02-07 20:30:38 [ℹ]  deploying stack "eksctl-farius-eks-nodegroup-linux-nodes"
2024-02-07 20:30:38 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-nodegroup-linux-nodes"
2024-02-07 20:31:08 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-nodegroup-linux-nodes"
2024-02-07 20:31:53 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-nodegroup-linux-nodes"
2024-02-07 20:33:02 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-nodegroup-linux-nodes"
2024-02-07 20:34:28 [ℹ]  waiting for CloudFormation stack "eksctl-farius-eks-nodegroup-linux-nodes"
2024-02-07 20:34:28 [ℹ]  waiting for the control plane to become ready
2024-02-07 20:34:31 [✔]  saved kubeconfig as "/home/devops/.kube/config"
2024-02-07 20:34:31 [ℹ]  no tasks
2024-02-07 20:34:31 [✔]  all EKS cluster resources for "farius-eks" have been created
2024-02-07 20:34:31 [ℹ]  nodegroup "linux-nodes" has 3 node(s)
2024-02-07 20:34:31 [ℹ]  node "ip-192-168-40-20.ec2.internal" is ready
2024-02-07 20:34:31 [ℹ]  node "ip-192-168-54-187.ec2.internal" is ready
2024-02-07 20:34:31 [ℹ]  node "ip-192-168-9-51.ec2.internal" is ready
2024-02-07 20:34:31 [ℹ]  waiting for at least 1 node(s) to become ready in "linux-nodes"
2024-02-07 20:34:31 [ℹ]  nodegroup "linux-nodes" has 3 node(s)
2024-02-07 20:34:31 [ℹ]  node "ip-192-168-40-20.ec2.internal" is ready
2024-02-07 20:34:31 [ℹ]  node "ip-192-168-54-187.ec2.internal" is ready
2024-02-07 20:34:31 [ℹ]  node "ip-192-168-9-51.ec2.internal" is ready
2024-02-07 20:34:35 [ℹ]  kubectl command should work with "/home/devops/.kube/config", try 'kubectl get nodes'
2024-02-07 20:34:35 [✔]  EKS cluster "farius-eks" in "us-east-1" region is ready
 ```

## eksctl create cluster -f cluster.yaml
Start at 2024-02-07 20:40:47 <br>
Finish at 2024-02-07 20:54:37 <br>
Duration 14 minutes <br>

```sh
$ cat cluster.yaml
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig

metadata:
  name: basic-cluster
  region: eu-north-1

nodeGroups:
  - name: ng-1
    instanceType: m5.large
    desiredCapacity: 10
  - name: ng-2
    instanceType: m5.xlarge
    desiredCapacity: 2


$ eksctl create cluster -f cluster.yaml
2024-02-07 20:40:47 [ℹ]  eksctl version 0.170.0
2024-02-07 20:40:47 [ℹ]  using region us-east-1
2024-02-07 20:40:47 [ℹ]  skipping us-east-1e from selection because it doesn't support the following instance type(s): m5.xlarge
2024-02-07 20:40:47 [ℹ]  setting availability zones to [us-east-1f us-east-1a]
2024-02-07 20:40:47 [ℹ]  subnets for us-east-1f - public:192.168.0.0/19 private:192.168.64.0/19
2024-02-07 20:40:47 [ℹ]  subnets for us-east-1a - public:192.168.32.0/19 private:192.168.96.0/19
2024-02-07 20:40:47 [ℹ]  nodegroup "linux-nodes" will use "" [AmazonLinux2/1.28]
2024-02-07 20:40:47 [ℹ]  using SSH public key "/home/devops/.ssh/id_rsa.pub" as "eksctl-EKS-Lab-nodegroup-linux-nodes-a8:26:c0:c3:7e:7a:7a:b3:d0:86:56:87:32:a4:59:71" 
2024-02-07 20:40:47 [ℹ]  using Kubernetes version 1.28
2024-02-07 20:40:47 [ℹ]  creating EKS cluster "EKS-Lab" in "us-east-1" region with managed nodes
2024-02-07 20:40:47 [ℹ]  1 nodegroup (linux-nodes) was included (based on the include/exclude rules)
2024-02-07 20:40:47 [ℹ]  will create a CloudFormation stack for cluster itself and 0 nodegroup stack(s)
2024-02-07 20:40:47 [ℹ]  will create a CloudFormation stack for cluster itself and 1 managed nodegroup stack(s)
2024-02-07 20:40:47 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-1 --cluster=EKS-Lab'
2024-02-07 20:40:47 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "EKS-Lab" in "us-east-1"
2024-02-07 20:40:47 [ℹ]  CloudWatch logging will not be enabled for cluster "EKS-Lab" in "us-east-1"
2024-02-07 20:40:47 [ℹ]  you can enable it with 'eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=us-east-1 --cluster=EKS-Lab'
2024-02-07 20:40:47 [ℹ]  
2 sequential tasks: { create cluster control plane "EKS-Lab", 
    2 sequential sub-tasks: { 
        4 sequential sub-tasks: { 
            wait for control plane to become ready,
            associate IAM OIDC provider,
            2 sequential sub-tasks: { 
                create IAM role for serviceaccount "kube-system/aws-node",
                create serviceaccount "kube-system/aws-node",
            },
            restart daemonset "kube-system/aws-node",
        },
        create managed nodegroup "linux-nodes",
    } 
}
2024-02-07 20:40:47 [ℹ]  building cluster stack "eksctl-EKS-Lab-cluster"
2024-02-07 20:40:48 [ℹ]  deploying stack "eksctl-EKS-Lab-cluster"
2024-02-07 20:41:18 [ℹ]  waiting for CloudFormation stack "eksctl-EKS-Lab-cluster"
2024-02-07 20:41:48 [ℹ]  waiting for CloudFormation stack "eksctl-EKS-Lab-cluster"
2024-02-07 20:42:49 [ℹ]  waiting for CloudFormation stack "eksctl-EKS-Lab-cluster"
2024-02-07 20:43:51 [ℹ]  waiting for CloudFormation stack "eksctl-EKS-Lab-cluster"
2024-02-07 20:44:51 [ℹ]  waiting for CloudFormation stack "eksctl-EKS-Lab-cluster"
2024-02-07 20:45:51 [ℹ]  waiting for CloudFormation stack "eksctl-EKS-Lab-cluster"
2024-02-07 20:46:52 [ℹ]  waiting for CloudFormation stack "eksctl-EKS-Lab-cluster"
2024-02-07 20:47:52 [ℹ]  waiting for CloudFormation stack "eksctl-EKS-Lab-cluster"
2024-02-07 20:48:52 [ℹ]  waiting for CloudFormation stack "eksctl-EKS-Lab-cluster"
2024-02-07 20:50:55 [ℹ]  building iamserviceaccount stack "eksctl-EKS-Lab-addon-iamserviceaccount-kube-system-aws-node"
2024-02-07 20:50:55 [ℹ]  deploying stack "eksctl-EKS-Lab-addon-iamserviceaccount-kube-system-aws-node"
2024-02-07 20:50:55 [ℹ]  waiting for CloudFormation stack "eksctl-EKS-Lab-addon-iamserviceaccount-kube-system-aws-node"
2024-02-07 20:51:26 [ℹ]  waiting for CloudFormation stack "eksctl-EKS-Lab-addon-iamserviceaccount-kube-system-aws-node"
2024-02-07 20:51:26 [ℹ]  serviceaccount "kube-system/aws-node" already exists
2024-02-07 20:51:26 [ℹ]  updated serviceaccount "kube-system/aws-node"
2024-02-07 20:51:26 [ℹ]  daemonset "kube-system/aws-node" restarted
2024-02-07 20:51:26 [ℹ]  building managed nodegroup stack "eksctl-EKS-Lab-nodegroup-linux-nodes"
2024-02-07 20:51:27 [ℹ]  deploying stack "eksctl-EKS-Lab-nodegroup-linux-nodes"
2024-02-07 20:51:27 [ℹ]  waiting for CloudFormation stack "eksctl-EKS-Lab-nodegroup-linux-nodes"
2024-02-07 20:51:57 [ℹ]  waiting for CloudFormation stack "eksctl-EKS-Lab-nodegroup-linux-nodes"
2024-02-07 20:52:41 [ℹ]  waiting for CloudFormation stack "eksctl-EKS-Lab-nodegroup-linux-nodes"
2024-02-07 20:54:35 [ℹ]  waiting for CloudFormation stack "eksctl-EKS-Lab-nodegroup-linux-nodes"
2024-02-07 20:54:35 [ℹ]  waiting for the control plane to become ready
2024-02-07 20:54:35 [✔]  saved kubeconfig as "/home/devops/.kube/config"
2024-02-07 20:54:35 [ℹ]  no tasks
2024-02-07 20:54:35 [✔]  all EKS cluster resources for "EKS-Lab" have been created
2024-02-07 20:54:36 [ℹ]  nodegroup "linux-nodes" has 3 node(s)
2024-02-07 20:54:36 [ℹ]  node "ip-192-168-23-136.ec2.internal" is ready
2024-02-07 20:54:36 [ℹ]  node "ip-192-168-36-219.ec2.internal" is ready
2024-02-07 20:54:36 [ℹ]  node "ip-192-168-42-187.ec2.internal" is ready
2024-02-07 20:54:36 [ℹ]  waiting for at least 1 node(s) to become ready in "linux-nodes"
2024-02-07 20:54:36 [ℹ]  nodegroup "linux-nodes" has 3 node(s)
2024-02-07 20:54:36 [ℹ]  node "ip-192-168-23-136.ec2.internal" is ready
2024-02-07 20:54:36 [ℹ]  node "ip-192-168-36-219.ec2.internal" is ready
2024-02-07 20:54:36 [ℹ]  node "ip-192-168-42-187.ec2.internal" is ready
2024-02-07 20:54:37 [ℹ]  kubectl command should work with "/home/devops/.kube/config", try 'kubectl get nodes'
2024-02-07 20:54:37 [✔]  EKS cluster "EKS-Lab" in "us-east-1" region is ready
```

### REVIEW THE NEWLY CREATED EC2
The costly part of EKS is EC2. Let's see these automated resources when the cluster just created.

$ aws ec2 describe-instances --query 'Reservations[].Instances[].{Name: Tags[?Key==Name].Value | [0], InstanceId: InstanceId, InstanceType: InstanceType, AvailabilityZone: Placement.AvailabilityZone, PublicIPv4: PublicIpAddress, PrivateIpAddress: PrivateIpAddress}' --output table

| AvailabilityZone |     InstanceId       | InstanceType  | Name  | PrivateIpAddress   |   PublicIPv4    |
|------------------|----------------------|---------------|-------|--------------------|-----------------|
|  us-east-1a      |  i-01ee9579707e90e61 |  m5.xlarge    |  None |  192.168.36.219    |  3.88.35.118    |
|  us-east-1a      |  i-0d851d0df932fef68 |  m5.xlarge    |  None |  192.168.42.187    |  54.158.42.234  |
|  us-east-1f      |  i-008efc8bcb5bf0ecb |  m5.xlarge    |  None |  192.168.23.136    |  3.235.228.233  |

```txt
$ kubectl get nodes 
NAME                             STATUS   ROLES    AGE    VERSION
ip-192-168-23-136.ec2.internal   Ready    <none>   107m   v1.28.5-eks-5e0fdde
ip-192-168-36-219.ec2.internal   Ready    <none>   107m   v1.28.5-eks-5e0fdde
ip-192-168-42-187.ec2.internal   Ready    <none>   107m   v1.28.5-eks-5e0fdde
```

## CloudFormation Review

```sh
~$ aws cloudformation list-stacks --query 'StackSummaries[*].[StackName, StackStatus, CreationTime]' --output table
```

|Stack Name | Stack Status | Creation Time |
|--- | --- | --- |
|  eksctl-EKS-Lab-nodegroup-linux-nodes                           |  CREATE_COMPLETE |  2024-02-08T01:51:27.254000+00:00  |
|  eksctl-EKS-Lab-addon-iamserviceaccount-kube-system-aws-node    |  CREATE_COMPLETE |  2024-02-08T01:50:55.587000+00:00  |
|  eksctl-EKS-Lab-cluster                                         |  CREATE_COMPLETE |  2024-02-08T01:40:48.345000+00:00  |
|  eksctl-farius-eks-nodegroup-linux-nodes                        |  CREATE_COMPLETE |  2024-02-08T01:30:38.291000+00:00  |
|  eksctl-farius-eks-addon-iamserviceaccount-kube-system-aws-node |  CREATE_COMPLETE |  2024-02-08T01:30:06.294000+00:00  |
|  eksctl-farius-eks-cluster                                      |  CREATE_COMPLETE |  2024-02-08T01:19:00.263000+00:00  |
|  eksctl-eks-farius2-nodegroup-ng-3fdf95db                       |  DELETE_COMPLETE |  2024-02-08T00:39:45.335000+00:00  |
|  eksctl-eks-farius2-cluster                                     |  DELETE_COMPLETE |  2024-02-08T00:27:39.437000+00:00  |
|  eksctl-eks-farius-cluster                                      |  DELETE_COMPLETE |  2024-02-08T00:25:32.835000+00:00  |
|  eksctl-beautiful-hideout-1707348349-cluster                    |  DELETE_COMPLETE |  2024-02-07T23:25:50.629000+00:00  |
|  GitHubActionsExample                                           |  DELETE_COMPLETE |  2024-01-18T00:40:18.600000+00:00  |
|  dawei                                                          |  DELETE_COMPLETE |  2024-01-17T16:20:08.245000+00:00  |
|  Infra-ECS-Cluster-testECS2-ec2f41a6                            |  DELETE_COMPLETE |  2023-12-22T15:10:08.732000+00:00  |
|  Infra-ECS-Cluster-testECS-51080fed                             |  DELETE_COMPLETE |  2023-12-22T14:53:35.332000+00:00  |

Select eksctl-EKS-Lab-cluster from AWS Console Cloudformation TEMPLATE tab and click View in Designer.
![](/09-image02.png)

The Template should looks like below

![](/09-image03.png)

On the top left it is basically VPC with the security groups. To the right there are some route tables. Below it there are private subnets. To the left , there is private route table. On the bottom left there is public subnet. On the middle right we can see an EKS cluster.

In this exercise, we have three cloudformations. The first one eksctl-EKS-Lab-cluster was about VPC and EKS Cluster. 

The second one eksctl-EKS-Lab-addon-iamserviceaccount-kube-system-aws-node is a role.
![](/09-image04.png)
![](/09-image05.png)
which has AmazonEKS_CNI_Policy. CNI is container network interface which allows pods in different servers in the clusters to communicate with each other.

The third one eksctl-EKS-Lab-nodegroup-linux-nodes has five resources.

```sh
$ aws cloudformation describe-stack-resources --stack-name eksctl-EKS-Lab-nodegroup-linux-nodes --query 'StackResources[*].[LogicalResourceId, ResourceType, ResourceStatus]' --output table
----------------------------------------------------------------------
|                       DescribeStackResources                       |
+-------------------+----------------------------+-------------------+
|  LaunchTemplate   |  AWS::EC2::LaunchTemplate  |  CREATE_COMPLETE  |
|  ManagedNodeGroup |  AWS::EKS::Nodegroup       |  CREATE_COMPLETE  |
|  NodeInstanceRole |  AWS::IAM::Role            |  CREATE_COMPLETE  |
|  PolicyAutoScaling|  AWS::IAM::Policy          |  CREATE_COMPLETE  |
|  SSH              |  AWS::EC2::SecurityGroup   |  CREATE_COMPLETE  |
+-------------------+----------------------------+-------------------+
```
LaunchTemplate is for launching EC2 instances. ManagedNodeGroup is basically for AutoScalingGroup. Let's take a look at NodeInstanceRole which has 4 policies like below.
![](/09-image06.png)

- AmazonEKSWorkerNodePolicy: provides access to EC2 and EKS from remote
- AmazonEC2ContainerRegistryReadOnly: provides permission of Container
Registry. It works when you pull images from AWS ECR
- AmazonSSMManagedInstanceCore: The policy for Amazon EC2 Role to enable
AWS Systems Manager service core functionality.
- eksctl-EKS-Lab-nodegroup-linux-nodes-PolicyAutoScaling: Full Cluster
Autoscaler Features Policy

### EKS Clusters

See the EKS-Lab cluster below which reflects all the information inherited from cluster.yaml such as metadata name (EKS-Lab), version (1.28)

```sh
$ aws eks list-clusters --output table
------------------
|  ListClusters  |
+----------------+
||   clusters   ||
|+--------------+|
||  EKS-Lab     ||
||  farius-eks  ||
|+--------------+|


$ aws eks describe-cluster --name EKS-Lab --output text
CLUSTER arn:aws:eks:us-east-1:390924080865:cluster/EKS-Lab      2024-02-07T20:41:13.896000-05:00        https://3B86C30EF7156D2EB0F8B2C803FC9934.gr7.us-east-1.eks.amazonaws.com        EKS-Lab eks.7   arn:aws:iam::390924080865:role/eksctl-EKS-Lab-cluster-ServiceRole-4XzD9OAILRSs        ACTIVE  1.28
ACCESSCONFIG    API_AND_CONFIG_MAP
CERTIFICATEAUTHORITY    LS0...LS0K
OIDC    https://oidc.eks.us-east-1.amazonaws.com/id/3B86C30EF7156D2EB0F8B2C803FC9934
KUBERNETESNETWORKCONFIG ipv4    10.100.0.0/16
CLUSTERLOGGING  False
TYPES   api
TYPES   audit
TYPES   authenticator
TYPES   controllerManager
TYPES   scheduler
RESOURCESVPCCONFIG      sg-0a98f79874c57bdf1    False   True    vpc-00a7829b732f1455c
PUBLICACCESSCIDRS       0.0.0.0/0
SECURITYGROUPIDS        sg-09ae8cea27ef14dc7
SUBNETIDS       subnet-08e98772a14cffa60
SUBNETIDS       subnet-0a2f93d539197e0c3
SUBNETIDS       subnet-06b78f360470ea87a
SUBNETIDS       subnet-0afcc783f4c15e8e1
TAGS    eksctl-EKS-Lab-cluster/ControlPlane     EKS-Lab true    0.170.0 ControlPlane    arn:aws:cloudformation:us-east-1:390924080865:stack/eksctl-EKS-Lab-cluster/158be9f0-c623-11ee-ab9c-12d9ef47aa19 eksctl-EKS-Lab-cluster  EKS-Lab
```

Let's see the EKS Cluster below.
![](/09-image07.png)

```txt
Context: iam-root-account@EKS-Lab.us-east-1.eksc… <c>      Cordon     <u> Uncordon                                                                                                                                                  ____  __.________        
 Cluster: EKS-Lab.us-east-1.eksctl.io              <ctrl-d> Delete     <y> YAML                                                                                                                                                     |    |/ _/   __   \______ 
 User:    iam-root-account@EKS-Lab.us-east-1.eksct <d>      Describe                                                                                                                                                                |      < \____    /  ___/ 
 K9s Rev: v0.31.7 ⚡️v0.31.8                        <r>      Drain                                                                                                                                                                   |    |  \   /    /\___ \  
 K8s Rev: v1.28.5-eks-5e0fdde                      <e>      Edit                                                                                                                                                                    |____|__ \ /____//____  > 
 CPU:     n/a                                      <?>      Help                                                                                                                                                                            \/            \/  
 MEM:     n/a                                                                                                                                                                                                                                                 
┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── Nodes(all)[3] ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ NAME↑                                                  STATUS                        ROLE                           TAINTS                         VERSION                                                              PODS AGE                           │
│ ip-192-168-23-136.ec2.internal                         Ready                         <none>                         0                              v1.28.5-eks-5e0fdde                                                     4 89m                           │
│ ip-192-168-36-219.ec2.internal                         Ready                         <none>                         0                              v1.28.5-eks-5e0fdde                                                     2 89m                           │
│ ip-192-168-42-187.ec2.internal                         Ready                         <none>                         0                              v1.28.5-eks-5e0fdde                                                     2 89m                           │
└────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
  <node>                                                
```

```txt

```

Next we will update the kubeconfig

$ aws eks update-kubeconfig --name EKS-Lab --region us-east-1 
    Added new context arn:aws:eks:us-east-1:390924080865:cluster/EKS-Lab to /home/devops/.kube/config


## AUTOSCALING
When EKS was launched an ASG was automatically created, see below

```txt
$ aws autoscaling describe-auto-scaling-groups --query 'AutoScalingGroups[*].[AutoScalingGroupName, DesiredCapacity,MinSize,MaxSize]' --output table
--------------------------------------------------------------------------
|                        DescribeAutoScalingGroups                       |
+--------------------------------------------------------+----+----+-----+
|  eks-linux-nodes-90c6c335-002b-892e-e165-f8217aa7f398  |  3 |  1 |  10 |
+--------------------------------------------------------+----+----+-----+
```

We may need to download 
https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml
and make some changes.

1. Replacing the  <YOUR CLUSTER NAME>  placeholder with our cluster name.
2. Appending the option - --scale-down-unneeded-time=3m after --expander=least-waste
. This option sets the duration before the AWS autoscaling group terminates
the unneeded nodes. By default an unneeded node is removed after 10 mins
3. Updating the version number of registry.k8s.io/autoscaling/clusterautoscaler:v1.26.2 according to the version of your EKS cluster. Availables
versions of cluster-autoscaler can be found [here](https://github.com/kubernetes/autoscaler/releases). In our case, we need to make 1.28 with 1.28.2 as available from link above.

and now we are ready to run this yaml file

```txt
$ kubectl apply -f cluster-autoscaler-autodiscover.yaml
    serviceaccount/cluster-autoscaler created
    clusterrole.rbac.authorization.k8s.io/cluster-autoscaler created
    role.rbac.authorization.k8s.io/cluster-autoscaler created
    clusterrolebinding.rbac.authorization.k8s.io/cluster-autoscaler created
    rolebinding.rbac.authorization.k8s.io/cluster-autoscaler created
    deployment.apps/cluster-autoscaler created
```
And you can see the autoscaler below from K9s for example.
![](/09-image10.png)

For demo purpose, we set - --scale-down-unneeded-time=3m from 3 minute into 1 minutes as follow

And you can see the autoscaler below from K9s for example.
![](/09-image13.png)

That make the other EC2 was shut down after one minute
![](/09-image11.png)
<br><br>
![](/09-image12.png)

```txt
Context: iam-root-account@EKS-Lab.us-east-1.eksc… <c>      Cordon     <u> Uncordon                                                                                                                                                  ____  __.________         Cluster: EKS-Lab.us-east-1.eksctl.io              <ctrl-d> Delete     <y> YAML                                                                                                                                                     |    |/ _/   __   \______  User:    iam-root-account@EKS-Lab.us-east-1.eksct <d>      Describe                                                                                                                                                                |      < \____    /  ___/  K9s Rev: v0.31.7 ⚡️v0.31.8                        <r>      Drain                                                                                                                                                                    |    |  \   /    /\___ \   K8s Rev: v1.28.5-eks-5e0fdde                      <e>      Edit                                                                                                                                                                    |____|__ \ /____//____  >  CPU:     n/a                                      <?>      Help                                                                                                                                                                            \/            \/   MEM:     n/a                                                                                                                                                                                                                                                 ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ NAME↑                                                  STATUS                        ROLE                           TAINTS                        VERSION                                                              PODS AGE                            │
| ip-192-168-36-219.ec2.internal                         Ready                         <none>                         0                             v1.28.5-eks-5e0fdde                                                     5 155m                                                                                          │
└────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
  <node>
```

## TESTING AUTOSCALER TO SCALE UP

Let's take a look at below nginx.yaml file below

As the replicas were scaled up to 20 and each node need 100% capacity (cpu: 1000m) AutoScale will start to spin up 20 pods which scattered within 7 nodes (7 x 3 > 20). 

```txt
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 20
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 1000m
            memory: 128Mi
---
apiVersion: v1
kind: Service
metadata:
  name: nginx
  labels:
    app: nginx
spec:
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: nginx
  type: LoadBalancer
```

Let's see how the pod in default namespace progressing as above deployment was kicked in.

```txt
$ kubectl apply -f nginx.yaml
    deployment.apps/nginx created
    service/nginx created

$ kubectl get deploy -n default
    NAME    READY   UP-TO-DATE   AVAILABLE   AGE
    nginx   3/20    20           3           42s

$ kubectl get deploy -n default
    NAME    READY   UP-TO-DATE   AVAILABLE   AGE
    nginx   3/20    20           3           48s

$ kubectl get deploy -n default
    NAME    READY   UP-TO-DATE   AVAILABLE   AGE
    nginx   20/20   20           20          73s
```

As we can see as soon as the deployment started, autoscaling will start to adjust the number of pods.

![](/09-image14.png)

## HORIZONTAL POD AUTOSCALER
Using the same nginx we will tweak the replicas down to 1 and 10% of the CPU (cpu: 1000m).

This process will definite reduce the number of EC2 and pods accordingly. 

Let's try to get a new metric below, if it is not yet install.

```txt
$ kubectl get deployment metrics-server -n kube-system
    Error from server (NotFound): deployments.apps "metrics-server" not found

$ kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
    serviceaccount/metrics-server created
    clusterrole.rbac.authorization.k8s.io/system:aggregated-metrics-reader created
    clusterrole.rbac.authorization.k8s.io/system:metrics-server created
    rolebinding.rbac.authorization.k8s.io/metrics-server-auth-reader created
    clusterrolebinding.rbac.authorization.k8s.io/metrics-server:system:auth-delegator created
    clusterrolebinding.rbac.authorization.k8s.io/system:metrics-server created
    service/metrics-server created
    deployment.apps/metrics-server created
    apiservice.apiregistration.k8s.io/v1beta1.metrics.k8s.io created

$ kubectl get deployment metrics-server -n kube-system
    NAME             READY   UP-TO-DATE   AVAILABLE   AGE
    metrics-server   0/1     1            0           27s
```

For the last exercise we will tweak the nginx.yaml file again, says to make CPU usage down to 5% (CPU: 50m) and we will also introduce a stress test with test.sh below

```txt
for i in $(seq 1 10000)
do
 curl curl http://afc11f29a46b141568b262415eeaa8bb-1752241156.us-east-1.elb.amazonaws.com/
done
```

that url above was given by EKS automatically as found in below DNS name found in EC2  > Load balancers

![](/09-image15.png)

By running stress.sh and HPA.yaml
```txt
kubectl apply -f HPA.yaml
bash test.sh
```
we will see the pods increase rapidly

![](/09-image16.png)
<br><br>
![](/09-image17.png)

# SUMMARY
Horizontal Autoscaling could be done within Multipass environment but not for regular Autoscaling. Cloud resource such as EKS would be necessary.

For lightweight Kubernetes Cluster (K3s and Docker-Desktop single node K8S) they are commonly using HPA for load balancing. <br>

You can do below to shutdown all the cluster
```txt
kubectl delete -f nginx.yaml
eksctl delete cluster -f cluster.yaml
```
