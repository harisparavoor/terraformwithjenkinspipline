resource "aws_alb" "TF_alb_internal" {
  name               = var.alb_name
  #internal           = true
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.TF-alb-sg.id}"]
  subnets            = [var.private_subnet_a_id, var.private_subnet_b_id]
  enable_deletion_protection = false
 # access_logs {
 #   bucket  = 
 #   prefix  = "internal_alb-logs"
  #  enabled = true
 # }
 
  tags = {
    Name = "${var.alb_name}"
    Owner = "${var.owner}"
 }
}
resource "aws_alb_target_group" "TF_target_group" {
 #name = format("${var.alb_name}-target_group")
  #application port on server
  port     = "80"
  protocol = "HTTP"
  vpc_id   = var.vpc_id


  health_check {
   healthy_threshold   = 3
   unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = "80"
  }
    tags = {
  Name = format("${var.alb_name}-target_group")
  Owner = "${var.owner}"
 }
}
resource "aws_alb_listener" "alb_listener_80" {
 load_balancer_arn = aws_alb.TF_alb_internal.arn
 port              = "80"
 protocol          = "HTTP"
 depends_on        = [aws_alb_target_group.TF_target_group]
 default_action {
   target_group_arn = "${aws_alb_target_group.TF_target_group.arn}"
   type             = "forward"
 }
}

#resource "aws_alb_listener" "alb_listener_443" {
 # load_balancer_arn = aws_alb.TF_alb_internal.arn
 # port              = "443"
 # protocol          = "HTTPS"
 # depends_on        = [aws_alb_target_group.TF_target_group]
 # default_action {
  #  target_group_arn = "${aws_alb_target_group.TF_target_group.arn}"
   # type             = "forward"
 # }
#}

resource "aws_lb_target_group_attachment" "TF_Web-02" {
 target_group_arn = "${aws_alb_target_group.TF_target_group.arn}"
 port = "80"
 target_id = aws_instance.web2[0].id
}
