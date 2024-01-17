env = "dev"
bastion_cidr = ["172.31.46.34/32"]
default_vpc_id = "vpc-0720427b639d38611"
default_vpc_cidr = "172.31.0.0/16"
default_vpc_rtid = "rtb-0bc0b225ac5a47752"
//kms_arn = "arn:aws:kms:us-east-1:132179088792:key/ede7aa6b-ba36-497f-8811-1a4e2b338294"
//domain_name = "rdevopsb72.store"
//domain_id = "Z0321851320OIGMG455PE"
vpc = {
  main = {
    cidr_block = "10.0.0.0/16"
    subnets = {
      public = {
        name = "public"
        cidr_block = ["10.0.0.0/24", "10.0.1.0/24" ]
        azs        =  ["us-east-1a", "us-east-1b"]
      }
      web = {
        name = "web"
        cidr_block = ["10.0.2.0/24", "10.0.3.0/24" ]
        azs        =  ["us-east-1a", "us-east-1b"]
      }
      app = {
        name = "app"
        cidr_block = ["10.0.4.0/24", "10.0.5.0/24" ]
        azs        =  ["us-east-1a", "us-east-1b"]
      }

      db = {
        name = "db"
        cidr_block = ["10.0.6.0/24", "10.0.7.0/24" ]
        azs        =  ["us-east-1a", "us-east-1b"]
      }
    }
  }
}
app = {
  frontend = {
    name = "frontend"
    instance_type = "t3.micro"
    max_size = 10
    min_size = 1
    desired_capacity = 1
    subnet_name = "web"
    allow_app_cidr = "public"
    app_port = 8080
  }
  backend = {
    name = backend
    instance_type = "t3.micro"
    max_size = 10
    min_size = 1
    desired_capacity = 1
    subnet_name = "app"
    allow_app_cidr = "app"
    app_port = 8080

  }
}

