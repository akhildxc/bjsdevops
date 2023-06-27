provider "aws" {
  region = "eu-west-2"
}

resource "aws_eks_cluster" "example_cluster" {
  name     = "eks-cluster"
  role_arn = aws_iam_role.cluster_role.arn
  version  = "1.27"

  vpc_config {
    subnet_ids = ["subnet-0ccdb798c45270901", "subnet-0676bf8712f035a22"] 
  }
}

resource "aws_iam_role" "cluster_role" {
  name = "example-cluster-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "cluster_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster_role.name
}

