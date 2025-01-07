Hello this is our submission for part 1 part 2 is below.

We where able to get everything up and running but we did come across and error with getting the VPC peering to connect via Terraform. Sadly we had to do this via the console.

We tried three options to get the Syslogs to Tokyo. First we tried using S3 CRR then have the contents in the regions be set to auto delete after replication but that wasn't a viable option.
Second we thought about transit gateways but as we did more research we relized you would still need to peer them. So we just went with the option of VPC peering.


Here is the screenshot of our Terraform output before attemping the peering

![Screenshot 2024-12-10 at 3 01 38 AM](https://github.com/user-attachments/assets/0a09c4e2-b819-4f50-ac26-fc45c9c72472)

Now after we added the module for the vpc peering this is what showed in the console

![Image](https://github.com/user-attachments/assets/be8891c8-6d9a-4ab9-b546-90f720ec3d5d)


We understand that in the main.tf for vpc_peering there is no "auto_accept = true" As recommeneded as show in this photo

![Screenshot 2024-12-10 at 4 53 30 AM](https://github.com/user-attachments/assets/d7d53e8d-a654-498e-bdf6-35eb22e11f2c)

When we add that argument everything is in the folder was having issues.


But we did learn that the way of setting this up in AWS is MUCH different than GCP.

Lastly the request to have New York as a zone. We did found out from our research that new you does have az AZ nestled inside of North Virgina but you currently allowed to launch instances there.





###################################################################################################################################################################################################


Here is our submission for part 2.


Our first change was to use Transit Gateway peering which we got up and running!
![Screenshot 2025-01-06 at 2 21 43 PM](https://github.com/user-attachments/assets/807aa5eb-765f-4c8a-96c5-1f5a7daceff4)

The whole code up and running:
![Screenshot 2025-01-06 at 2 22 55 PM](https://github.com/user-attachments/assets/4609195d-50f7-4fcf-bc2d-a984ec9b4714)

We did encounter a few issues that should be brought up to the client. The instructions that they have given for their business and technical requirements need to be adjusted.

1. AZ containing syslog data must be limited to a private subnet. Limited means this AZ CANNOT have a Public Subnet.
  This can only be done in the N.VA region as it has 6 AZ's. Tokyo shows 4,  but currently only 3 are available. The remainder of the regions have only 2-3 AZs.
  We are attaching photos and a link to the AWS resources to confirm. We would advise that we make some changes to the architecture.
######################################################################################################################
![Screenshot 2025-01-06 at 7 04 27 PM](https://github.com/user-attachments/assets/fcfc57e8-29f0-4ced-8cb6-80234bd151ca)
![Screenshot 2025-01-06 at 7 04 46 PM](https://github.com/user-attachments/assets/fbc452be-00b1-4f06-9c9c-49e48aefaa54)
![Screenshot 2025-01-06 at 7 05 13 PM](https://github.com/user-attachments/assets/9afb6675-e7df-48f8-a484-6236c64e98e9)
![Screenshot 2025-01-06 at 7 05 36 PM](https://github.com/user-attachments/assets/10068f09-3aec-4bb2-afa3-4e38886aaa1d)

We could use Oregon instead of California to meet the requirement in that region. The others don't have options with 4 AZs, which would be needed to meet the requirement, plus the 2 others to come.

https://aws.amazon.com/about-aws/global-infrastructure/


2. AZ Containing DB with PII must be limited to a Private Subnet. A) Limited means this AZ cannot have a public subnet.
    This falls into the same restraints as above based off the requirements because in order to make a DB in Terraform an "aws_db_subnet_group" resource block in order to put it in a desired VPC. This argument requires 2 subnets (It     
    wouldnt be wise to put it in the same AZ). If this argument is not used, it will be created in the DEFAULT VPC, which is a security and compliance issue.

#######################################################################################################################
![Screenshot 2025-01-06 at 7 19 48 PM](https://github.com/user-attachments/assets/8dd0d15c-13c8-4a59-b48e-52a2bb1668f0)
![Screenshot 2025-01-06 at 7 20 26 PM](https://github.com/user-attachments/assets/cf98148b-4450-4431-be02-5123033ac02e)
![Screenshot 2025-01-06 at 7 20 44 PM](https://github.com/user-attachments/assets/453fcef9-7c66-47b4-a9b2-71fcfbd7975f)

Link to hashicorp documentation. (https://developer.hashicorp.com/terraform/tutorials/aws/aws-rds?in=terraform%2Faws&utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS)

   

3. DB and Syslog server cannot reside in the same subnet.
   This is the sum of the two issues as above. We need to have at least 4 AZs per region to securely create everything: 1 for the ASG, 1 for the Syslog Server, and 2 for the DB (required if making a DB in Terraform).

   
So, with security in mind, we have spun up a DB in the only available region, which is N.VA. We do, however, have the DB on standby in the other regions sharing an AZ NOT Subnet with the Syslog Server, if this is a compliance issues via a HIPAA framework.


































