# terraform-aws-module-vpc

A reusable and beginner-friendly Terraform module for creating a basic **AWS VPC** setup.  
Includes:
- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association

---

### 📁 Project Structure

```bash
terraform-aws-module-vpc/
├── main.tf
├── variables.tf
├── terraform.tfvars
└── modules/
    └── vpc/
        ├── vpc.tf
        ├── variables.tf
        └── outputs.tf
