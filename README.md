# 🌐 Multi-Cloud + Multi-Region Terraform Deployment

## 🚀 Project Overview

This project demonstrates a **minimal, low-cost multi-cloud, multi-region infrastructure deployment** using **Terraform**.

The goal was to establish a **resilient “asset landing zone”** across **AWS and Azure**, preparing the foundation for future applications and build artifacts to be deployed close to the end users.

---

## ☁️ Cloud Architecture

### AWS (Amazon Web Services)

* **Regions:**

  * `us-east-1` (Virginia)
  * `eu-central-1` (Frankfurt)
* **Resources:**

  * S3 Buckets for storage of static assets.
  * Optional **versioning** enabled for durability.
* **Example Naming Convention:** `company-dev-assets-use1`, `company-dev-assets-euc1`

### Azure

* **Regions:**

  * `East US`
  * `West Europe`
* **Resources:**

  * Resource Groups
  * Storage Accounts
* **Example Naming Convention:** `companydeveastus`, `companydevwesteurope`

---

## 📂 Folder Structure

```
multi-cloud-foundation/
│
├── aws-use1/           # AWS S3 bucket in US East
│   └── main.tf
│
├── aws-euc1/           # AWS S3 bucket in EU Central
│   └── main.tf
│
├── azure-eastus/       # Azure Resource Group + Storage Account
│   └── main.tf
│
├── azure-westeurope/   # Azure Resource Group + Storage Account
│   └── main.tf
│
├── screenshots/        # Screenshots of deployment (optional)
├── README.md           # This file
└── .gitignore
```

---

## 🛠️ Terraform Resources

**AWS:**

* [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
* [aws_s3_bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning)

**Azure:**

* [azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)
* [azurerm_storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account)

**Terraform Providers:**

* [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
* [AzureRM Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

---

## ⚡ Deployment Steps

1. **Navigate to each folder**:

```bash
cd aws-use1
```

2. **Initialize Terraform**:

```bash
terraform init
```

3. **Plan Deployment**:

```bash
terraform plan
```

4. **Apply Infrastructure**:

```bash
terraform apply
```

5. **Verify Deployment:**

   * AWS: Check S3 bucket in the respective region.
   * Azure: Check Resource Group & Storage Account in the portal.

6. **Re-run `terraform plan`** to confirm **no drift**.

7. **Destroy Resources** after review (optional):

```bash
terraform destroy
```

---

## 🏷️ Naming & Tagging Conventions

* **Naming:** Embeds environment and region

  * AWS S3: `company-dev-assets-use1`
  * Azure Storage: `companydeveastus`
* **Tags:**

  * `project = multicloud-foundation`
  * `owner = <your-name>`
  * `env = dev`

---

## 📸 Screenshots

(Optional) Include screenshots of:

* AWS S3 buckets in each region
* S3 bucket versioning page
* Azure Resource Groups
* Azure Storage Accounts

---

## ✨ Key Learnings

* Navigated the **Terraform Registry** to find resources and providers.
* Deployed **multi-cloud, multi-region infrastructure** from scratch.
* Learned **provider-specific configuration** (`region` for AWS, `location` for Azure).
* Applied **best practices**:

  * Clear naming
  * Proper tagging
  * State isolation per folder
* Achieved **idempotency**: `terraform plan` shows no changes after repeated applies.

---

## ⚠️ Notes & Tips

* Always **ignore state files** (`*.tfstate`) in Git using `.gitignore`.
* Bucket names in AWS must be **globally unique**.
* Start with **free-tier/lowest-cost resources** to avoid charges.
* Use **Terraform docs** for arguments you don’t understand.

---

## 👨‍💻 Author

**Lakunzy Owofola**

* GitHub: [https://github.com/<lakunzy7>](https://github.com/<lakunzy7>)
* YouTube: [CyberLab Chronicles](https://www.youtube.com/@CyberLabChronicles)
