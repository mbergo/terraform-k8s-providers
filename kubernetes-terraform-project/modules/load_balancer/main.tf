# Load Balancer module main configuration

resource "aws_lb" "kubernetes" {
  count              = var.cloud_provider == "aws" ? 1 : 0
  name               = "kubernetes-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb[0].id]
  subnets            = var.public_subnet_ids

  tags = {
    Name = "kubernetes-load-balancer"
  }
}

resource "aws_lb_target_group" "kubernetes" {
  count    = var.cloud_provider == "aws" ? 1 : 0
  name     = "kubernetes-tg"
  port     = 6443
  protocol = "HTTPS"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/healthz"
    port                = 6443
    protocol            = "HTTPS"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "kubernetes" {
  count             = var.cloud_provider == "aws" ? 1 : 0
  load_balancer_arn = aws_lb.kubernetes[0].arn
  port              = 6443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.ssl_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.kubernetes[0].arn
  }
}

resource "aws_security_group" "lb" {
  count  = var.cloud_provider == "aws" ? 1 : 0
  name   = "kubernetes-lb-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Add similar resources for GCP and VMware
# For GCP, use google_compute_global_forwarding_rule and google_compute_target_http_proxy
# For VMware, you may need to use a third-party load balancer solution
