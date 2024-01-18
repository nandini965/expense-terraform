env = "dev"
bastion_cidr = ["172.31.46.34/32"]
default_vpc_id = "vpc-0720427b639d38611"
default_vpc_cidr = "172.31.0.0/16"
default_vpc_rtid = "rtb-0bc0b225ac5a47752"
kms_arn = "arn:aws:kms:us-east-1:115099330984:key/7a96f332-25cc-4f74-8991-bfc6694ad974"
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
    app_port = 80
  }
  backend = {
    name = "backend"
    instance_type = "t3.micro"
    max_size = 10
    min_size = 1
    desired_capacity = 1
    subnet_name = "app"
    allow_app_cidr = "app"
    app_port = 8080

  }
}

alb {
  public = {
    name = public
    subnet_name = "public"
    allow_lb_cidr = "null"
    internal = false
  }
  private = {
    name = private
    subnet_name = "app"
    allow_lb_cidr = "web"
    internal = true
  }
}
rds {
  main = {
    subnet_name = db
    allow_db_cidr = "app"
  instance_class  = "db.t3.small"
  engine_version  = "5.7.mysql_aurora.2.03.2"
  instance_count = 1

}