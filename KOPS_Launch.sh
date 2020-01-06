#!/bin/bash
export AWS_REGION=ca-central-1
export NODE_SIZE=${NODE_SIZE:-t2.micro}
export MASTER_SIZE=${MASTER_SIZE:-t2.micro}
export ZONES=${ZONES:-"ca-central-1a"}
export MASTER_ZONES=${MASTER_ZONES:-"ca-central-1a"}
export KOPS_STATE_STORE="s3://kops-bucket-l2net"
export MASTER_COUNT=${MASTER_COUNT:-"1"}
export NODE_COUNT=${NODE_COUNT:-"1"}
export TOPOLOGY=public
export PROVIDER=aws
export KUBER_VERSION=1.15.6
export IMAGE_AMI=ami-0b85d4ff00de6a225
export ELB=${ELB:-"public"}
export LABELS=${LABELS:-"owner=Leonid,Project=K8S_KOPS_trian"}
export VPCID=${VPCID:-"vpc-03c7946f5729eb6d2"}
export NETWORK_CIDR=10.0.0.0/16
export SUBNET_IDS=${SUBNET_IDS:-"subnet-0bf159df9dfe5e83d"}
export SUBNET_CIDR=${SUBNET_CIDR:-"10.0.10.0/24"}
export UTILITY_SUBNETS=${UTILITY_SUBNETS:-"subnet-0132c23c86a15ed0a"}
export UTILITY_CIDRS=${UTILITY_CIDRS:-"10.0.20.0/24"}
export NAME=gsuite.pp.ua
kops create cluster \
--cloud $PROVIDER \
--master-count=$MASTER_COUNT \
--node-count=$NODE_COUNT \
--image=$IMAGE_AMI \
--kubernetes-version=$KUBER_VERSION \
--dns $TOPOLOGY \
--zones $ZONES \
--api-loadbalancer-type $ELB \
--topology $TOPOLOGY \
--networking weave \
--network-cidr $NETWORK_CIDR \
--vpc ${VPCID} \
--node-size $NODE_SIZE \
--master-size $MASTER_SIZE \
--master-zones $MASTER_ZONES \
--cloud-labels "$LABELS" \
--authorization AlwaysAllow \
--subnets $SUBNET_IDS \
--utility-subnets $UTILITY_SUBNETS \
--name ${NAME}
