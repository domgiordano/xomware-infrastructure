terraform {
  backend "remote" {
    organization = "Domjgiordano"

    workspaces {
      name = "xomware-infrastructure"
    }
  }
}

data "aws_caller_identity" "web_app_account" {
  provider = aws
}
