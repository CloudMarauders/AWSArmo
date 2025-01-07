
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




############################## Transit Gateway ################################

module "transit_gateway" {
  source = "./modules/transit_gateway"
}







############################## Peering Attachment #########################################



module "peering_tokyo_to_california" {
  source = "./modules/transit_gateway_peering"

  providers = {
    aws.requester = aws
    aws.accepter  = aws.california
  }

  requester_transit_gateway_id = module.transit_gateway.tokyo_transit_gateway_id
  accepter_transit_gateway_id  = module.transit_gateway.california_transit_gateway_id
  requester_region             = "ap-northeast-1"
  accepter_region              = "us-west-1"
  name                         = "Tokyo-to-California"
}

module "peering_tokyo_to_newyork" {
  source = "./modules/transit_gateway_peering"

  providers = {
    aws.requester = aws
    aws.accepter  = aws.newyork
  }

  requester_transit_gateway_id = module.transit_gateway.tokyo_transit_gateway_id
  accepter_transit_gateway_id  = module.transit_gateway.newyork_transit_gateway_id
  requester_region             = "ap-northeast-1"
  accepter_region              = "us-east-1"
  name                         = "Tokyo-to-NewYork"
}

module "peering_tokyo_to_aus" {
  source = "./modules/transit_gateway_peering"

  providers = {
    aws.requester = aws
    aws.accepter  = aws.australia
  }

  requester_transit_gateway_id = module.transit_gateway.tokyo_transit_gateway_id
  accepter_transit_gateway_id  = module.transit_gateway.aus_transit_gateway_id
  requester_region             = "ap-northeast-1"
  accepter_region              = "ap-southeast-2"
  name                         = "Tokyo-to-Australia"
}

module "peering_tokyo_to_hongkong" {
  source = "./modules/transit_gateway_peering"

  providers = {
    aws.requester = aws
    aws.accepter  = aws.hongkong
  }

  requester_transit_gateway_id = module.transit_gateway.tokyo_transit_gateway_id
  accepter_transit_gateway_id  = module.transit_gateway.hongkong_transit_gateway_id
  requester_region             = "ap-northeast-1"
  accepter_region              = "ap-east-1"
  name                         = "Tokyo-to-HongKong"
}

module "peering_tokyo_to_london" {
  source = "./modules/transit_gateway_peering"

  providers = {
    aws.requester = aws
    aws.accepter  = aws.london
  }

  requester_transit_gateway_id = module.transit_gateway.tokyo_transit_gateway_id
  accepter_transit_gateway_id  = module.transit_gateway.london_transit_gateway_id
  requester_region             = "ap-northeast-1"
  accepter_region              = "eu-west-2"
  name                         = "Tokyo-to-London"
}

module "peering_tokyo_to_saopaulo" {
  source = "./modules/transit_gateway_peering"

  providers = {
    aws.requester = aws
    aws.accepter  = aws.saopaulo
  }

  requester_transit_gateway_id = module.transit_gateway.tokyo_transit_gateway_id
  accepter_transit_gateway_id  = module.transit_gateway.saopaulo_transit_gateway_id
  requester_region             = "ap-northeast-1"
  accepter_region              = "sa-east-1"
  name                         = "Tokyo-to-SaoPaulo"
}