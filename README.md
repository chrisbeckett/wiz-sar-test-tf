# Wiz SAR Test Terraform Templates

## What are these templates?

These Terraform templates are provided "as is" to help Wiz customers test Secure Auto Remediation (SAR), which are cloud provider specific Python scripts that act on Wiz Controls to remediate configuration issues identified during scans and analysis. The templates create and configure cloud services with **"known bad"** configurations that Wiz detects and remediates.

## How do I use them?

First you need to install Terraform (https://www.terraform.io/) and then download the template ZIP files. There are three folders included in the ZIP :-

- test-tf-aws
- test-tf-azure
- test-tf-gcp

The latest ZIP available is suffixed with the 'latest' tag, e.g. **wiz-sar-test-tf-latest.zip**. Archived versions will be suffixed with the date the ZIP was archived, e.g. wiz-sar-test-tf-01-01-2023.zip, as per other Wiz naming standards. This also means roll back is also possible if the latest templates have a bug in them.

Each platform has different requirements, but primarily you need to authenticate on the command line (**aws configure / az login / gcloud init**) with appropriate permissions to create/modify/delete cloud objects and services.

## Terraform variables

Each cloud provider folder has a **variables.tf** file. This is where common parameters such as **region**, **zone**, etc are configured prior to running to the Terraform templates. Make sure to review these files and adjust where appropriate so that resources don't turn up in unexpected places!

## Best practices

Prior to downloading and running the templates, it is recommended to create a new, isolated cloud sandbox in order to run the tests. In essence, the templates provide a safe space to test out and get used to SAR without the risk of compromising live services or applications.

Objects are created with the lowest risk profile. For example, PaaS databases contain no data and network security groups / firewall rules are not attached to a live network card or subnet.

Creating a new AWS account / Azure subscription / GCP project may also provide financial benefits as **the templates will always try to provision services at the lowest / cheapest SKU** and new accounts tend to provide free tier limits at this level, making testing a cost effective endeavour.

## Other notes

You may notice that **there are fewer Terraform templates than there are playbooks**. This is **deliberate** - for example, when creating a Postgres instance on GCP, we can configure a single instance with all of the configuration issues in a single template, rather than duplicating effort and making the template pack bigger and harder to manage.

## Creating a test environment

Once you have created a test account / subscription / project and authenticated, download and unzip the templates and run Terraform in the usual way, e.g.

- **terraform init**
- **terraform plan**
- **terraform apply / yes**

When testing is complete :-

- **terraform destroy / yes**
