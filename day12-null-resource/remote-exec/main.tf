provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_secretsmanager_secret" "rds_secret" {
  name = "your-secret-name-new"
}


resource "aws_secretsmanager_secret_version" "rds_secret_value" {
  secret_id     = aws_secretsmanager_secret.rds_secret.id
  secret_string = jsonencode({
    username = "admin",
    password = "Password123!"
  })
}


# Example EC2 instance (replace with yours if already existing)
resource "aws_instance" "sql_runner" {
  ami                    = "ami-0081f0d5081b58505" # Amazon Linux 2
  instance_type          = "t2.micro"
  key_name               = "TEST"                # Replace with your key pair name
  associate_public_ip_address = true

  tags = {
    Name = "SQL Runner"
  }
}

# Create the RDS instance
resource "aws_db_instance" "mysql_rds" {
  identifier              = "my-mysql-db"
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  username                = "admin"
  password                = "Password123!"
  db_name                 = "dev"
  allocated_storage       = 20
  skip_final_snapshot     = true
  publicly_accessible     = true
}

# Deploy SQL remotely using null_resource + remote-exec
resource "null_resource" "remote_sql_exec" {
  depends_on = [aws_db_instance.mysql_rds, aws_instance.sql_runner]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/TEST.pem")   # Replace with your PEM file path
    host        = aws_instance.sql_runner.public_ip
  }

  provisioner "file" {
    source      = "init.sql"
    destination = "/tmp/init.sql"
  }

  provisioner "remote-exec" {
    inline = [   "sudo apt-get update",
      "sudo dnf install -y mariadb105", ]
    
  }


  provisioner "remote-exec" {
    inline = [
      "mysql -h ${aws_db_instance.mysql_rds.address} -u ${jsondecode(aws_secretsmanager_secret_version.rds_secret_value.secret_string)["username"]} -p${jsondecode(aws_secretsmanager_secret_version.rds_secret_value.secret_string)["password"]} < /tmp/init.sql"
    ]
    
  }

  triggers = {
    always_run = timestamp() #trigger every time apply 
  }
}





# ADD RDS creation script only accessbale interanlly si disable public access 
# Remote provisioner server also should create insame vpc 
# enable secrets fro secret manager and call secrets into RDS for this process vpc endpoint is require or nat gateway is required to access secrets to rds internall as secremanger is not in side VPC sefrvice 