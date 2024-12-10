Hello this is our submissive.

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
