
# STEPS TO AUTOSCALING GROUP
# launch_configuration

resource "aws_launch_configuration" "Wimble6-ltp" {
  name_prefix   = "Launch_Template"
  image_id      = "ami-0d3c032f5934e1b41"
  instance_type = "t2.micro"

 # Key name below = Key-pair
 # key_name = "EC2 PRACTICE"

  lifecycle {
      create_before_destroy = true
  }
}

