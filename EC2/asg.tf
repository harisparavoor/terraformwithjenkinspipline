resource "aws_launch_template" "app-asg-lc" {
  name                 = format("${var.project}_${var.env}_asg_lc")
  description          = "update user data"
 # default_version     =  "$Latest"
  update_default_version   = true
  image_id             = var.amazon_linux_ami
  instance_type        = var.instance_type
  iam_instance_profile { 
                  name = var.instance_iam_profile 
                  }
                   block_device_mappings {
    device_name = "/dev/sda1"
                   ebs {
      volume_size = 15
    }
                   }
  #iam_instance_profile = [var.instance_iam_profile]
  key_name              = var.public_key
  vpc_security_group_ids = ["${aws_security_group.TF-web-sg.id}"]
  user_data = filebase64 ("EC2/app.sh")
  lifecycle {
    create_before_destroy = true
  }
}
#Auto Scaling Group Configurations
resource "aws_autoscaling_group" "app-asg" {
  name                 = format("${var.project}_${var.env}_asg_config")
 # launch_configuration = [aws_launch_configuration.app-asg-lc]
 launch_template { 
                 id   = "${aws_launch_template.app-asg-lc.id}"
            version = "$Latest"
                 }
  #aws_launch_template = format("${var.project}_${var.env}_asg_lc")
  min_size             = 0
  max_size             = 4
  desired_capacity     = 0
  vpc_zone_identifier  = [var.private_subnet_a_id, var.private_subnet_b_id]
  #health_check_type    = "ELB"
  target_group_arns    = ["${aws_alb_target_group.TF_target_group.arn}"]
  lifecycle {
    create_before_destroy = true
  }
}