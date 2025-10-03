resource "aws_security_group" "new-sg" {
    name = "test-sg"
    vpc_id = aws_vpc.vpc1.id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

  



resource "aws_instance" "ec2" {
    ami = "ami-0a116fa7c861dd5f9"
    instance_type = "t2.micro"
    key_name = "key"
    vpc_security_group_ids = [aws_security_group.new-sg.id]
    subnet_id              = aws_subnet.subnet01.id 
    tags = {
        Name = "Deployment"
    }
}