Generate CircleCI badge:
[![tacarsten](https://circleci.com/gh/tacarsten/EKS.ML.Microservice.svg?style=svg)](https://app.circleci.com/pipelines/github/tacarsten/EKS.ML.Microservice)

Some info about the project: 
I did very, very little locally.  This is an AWS + DevOps course.  I oriented the whole thing around making this project run in AWS / EKS from the first.  

Thusly, I need to call your attention to some things.  

I have used kubernetes namespaces, because there are many similarities between this project and the capstone.  So.  Much is shared between them, and a namespace was a pretty efficient way of sharing what's shared, and separating what's separate.  Mission accomplished, I think.  

This is relevant for multiple objectives in the project.  

- My SKlearn web service can be verified by visiting the following outside load balance address:
acae3afecfbd54caba1f62caf1f35683-1544322362.us-west-2.elb.amazonaws.com
The output is simply "Sklearn Prediction Home", but it does verify a number of basic operations.  

- I have used port 80, not what was originally called out in the project.  8080 or something.  I cannot recall.  

- The outside load balancer address must be reflected in the code.  Specifically in the "make_prediction.sh" script.  I understand that hard coding a value into scripts like this is sub-optimal.  But you're going to have a hard time convincing that it's a WORSE option than RUNNING EVERYTHING LOCALLY in a DevOps course.  

- The outside loadbalancer address is discovered at the terminal of the EC2 instance called "Jenkins" by running the following command:
# kubectl get svc -n microservice

Here is my output:
# kubectl get svc -n microservice
NAME                   TYPE           CLUSTER-IP       EXTERNAL-IP                                                               PORT(S)        AGE
microservice-service   LoadBalancer   10.100.197.100   acae3afecfbd54caba1f62caf1f35683-1544322362.us-west-2.elb.amazonaws.com   80:32591/TCP   21h

Finally, the outputs requested from the instructor code can be found at: 
https://github.com/tacarsten/EKS.ML.Microservice/tree/main/output_txt_files
