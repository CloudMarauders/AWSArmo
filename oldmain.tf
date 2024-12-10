
module "tokyo" {
  source = "./01-Tokyo"
  
}


module "california" {
  source = "./02-California"
  providers = {
    aws = aws.california
  }
}




module "newyork" {
    source = "./03-New-York"
    providers = {
      aws = aws.newyork
    }
}

module "aus" {
  source = "./04-Australia"
  providers = {
    aws = aws.australia
  }
  
}

module "hongkong" {
  source = "./05-Hong-Kong"
  providers = {
    aws = aws.hongkong
  }
  
}

module "london" {
  source = "./06-London"
  providers = {
    aws = aws.london
  }
  
}

module "saopaulo" {
  source = "./07-Sao-Paulo"
  providers = {
    aws = aws.saopaulo
  }
  
}

module "peering_tokyo_to_california" {
  source = "./modules/vpc_peering"

  name                          = "Tokyo-California-Peering"
  requester_vpc_id              = module.tokyo.vpc_id
  accepter_vpc_id               = module.california.vpc_id
  requester_cidr_block          = module.tokyo.cidr_block
  accepter_cidr_block           = module.california.cidr_block
  requester_subnet_route_table_ids = module.tokyo.route_table_id
  accepter_subnet_route_table_ids  = module.california.route_table_id
  accepter_region               = "us-west-1"

  providers = {
    aws.requester = aws
    aws.accepter  = aws.california
  }
}

module "peering_tokyo_to_newyork" {
  source = "./modules/vpc_peering"

  name                          = "Tokyo-NewYork-Peering"
  requester_vpc_id              = module.tokyo.vpc_id
  accepter_vpc_id               = module.newyork.vpc_id
  requester_cidr_block          = module.tokyo.cidr_block
  accepter_cidr_block           = module.newyork.cidr_block
  requester_subnet_route_table_ids = module.tokyo.route_table_id
  accepter_subnet_route_table_ids  = module.newyork.route_table_id
  accepter_region               = "us-east-1"

  providers = {
    aws.requester = aws
    aws.accepter  = aws.newyork
  }

}

module "peering_tokyo_to_aus" {
  source = "./modules/vpc_peering"

  name                          = "Tokyo-Australia-Peering"
  requester_vpc_id              = module.tokyo.vpc_id
  accepter_vpc_id               = module.aus.vpc_id
  requester_cidr_block          = module.tokyo.cidr_block
  accepter_cidr_block           = module.aus.cidr_block
  requester_subnet_route_table_ids = module.tokyo.route_table_id
  accepter_subnet_route_table_ids  = module.aus.route_table_id
  accepter_region               = "ap-southeast-2"

  providers = {
    aws.requester = aws
    aws.accepter  = aws.australia
  }

}

module "peering_tokyo_to_hongkong" {
  source = "./modules/vpc_peering"

  name                          = "Tokyo-HongKong-Peering"
  requester_vpc_id              = module.tokyo.vpc_id
  accepter_vpc_id               = module.hongkong.vpc_id
  requester_cidr_block          = module.tokyo.cidr_block
  accepter_cidr_block           = module.hongkong.cidr_block
  requester_subnet_route_table_ids = module.tokyo.route_table_id
  accepter_subnet_route_table_ids  = module.hongkong.route_table_id
  accepter_region               = "ap-east-1"

  providers = {
    aws.requester = aws
    aws.accepter  = aws.hongkong
  }


}



module "peering_tokyo_to_london" {
  source = "./modules/vpc_peering"

  name                          = "Tokyo-London-Peering"
  requester_vpc_id              = module.tokyo.vpc_id
  accepter_vpc_id               = module.london.vpc_id
  requester_cidr_block          = module.tokyo.cidr_block
  accepter_cidr_block           = module.london.cidr_block
  requester_subnet_route_table_ids = module.tokyo.route_table_id
  accepter_subnet_route_table_ids  = module.london.route_table_id
  accepter_region               = "eu-west-2"

  providers = {
    aws.requester = aws
    aws.accepter  = aws.london
  }

}

module "peering_tokyo_to_saopaulo" {
  source = "./modules/vpc_peering"

  name                          = "Tokyo-SaoPaulo-Peering"
  requester_vpc_id              = module.tokyo.vpc_id
  accepter_vpc_id               = module.saopaulo.vpc_id
  requester_cidr_block          = module.tokyo.cidr_block
  accepter_cidr_block           = module.saopaulo.cidr_block
  requester_subnet_route_table_ids = module.tokyo.route_table_id
  accepter_subnet_route_table_ids  = module.saopaulo.route_table_id
  accepter_region               = "sa-east-1"

  providers = {
    aws.requester = aws
    aws.accepter  = aws.saopaulo
  }


}

