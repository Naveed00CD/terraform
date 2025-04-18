output "ip" {
    value = aws_instance.testk1.public_ip

  
}

output "private_ip" {
    value = aws_instance.testk1.private_ip
  
}