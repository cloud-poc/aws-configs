#! /bin/sh
yum update -y
amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user
chkconfig docker on

docker run -d -p 80:8080 --name health-check public.ecr.aws/a0i4s5a9/utilities-healthcheck:1.0.1
