# How to create a test environment for Wiz Secure Auto Remediation

The /test-tf-azure folder contains several Terraform scripts that can be used to build a sandbox Azure testing environment with sample cloud objects (storage accounts, NSGs, etc) with "known bad" configurations that can be detected by and subsequently remediated by Wiz.

Prior to creating any objects, it is preferred to create a new subscription for test purposes. The appropriate region also needs to be configured in the _variables.tf_ file.

All objects created are prefixed with **"wiz-sar-test"**, in some cases without the dashes because of Azure naming requirements. This makes any orphaned objects easy to spot.

To create the test objects, use the following commands :-

- terraform init
- terraform plan
- terraform apply

You may notice that not every playbook has a corresponding Terraform file. This is because some Terraform scripts configure a single object we can use with multiple detections. For example, azure-appservice-001.tf creates an Azure Web App that has multiple configuration issues we can remediate with SAR. As such, there is no need to create multiple Web Apps. This keeps the test deployment footprint smaller and more cost effective.

Where an object/service is created, the Terraform script creates the cheapest SKU possible, creating an object on the Free Tier if possible for cost optimisation purposes.

Where security constructs such as NSGs are created, these are not attached to anything so that it does not introduce any risk to the environment. They are simply permissive inbound networking rules that effectively don't go anywhere but still trigger Wiz issues and remediations.
