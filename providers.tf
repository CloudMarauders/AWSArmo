provider "aws" {
  region = "ap-northeast-1"
}



provider "aws" {
  alias = "california"
  region = "us-west-1"
}

provider "aws" {
  alias = "newyork"
  region = "us-east-1"
}

provider "aws" {
  alias = "australia"
  region = "ap-southeast-2"
}

provider "aws" {
  alias = "hongkong"
  region = "ap-east-1"
}

provider "aws" {
  alias = "london"
  region = "eu-west-2"
}

provider "aws" {
  alias = "saopaulo"
  region = "sa-east-1"
}
