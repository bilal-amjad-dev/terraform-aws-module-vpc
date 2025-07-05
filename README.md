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
        └── variables.tf
```

### ✅ Key Concepts About Terraform Modules

- The `variables.tf` file inside the **module directory** is used to **declare input variables** that the module expects.

- The `variables.tf` file in the **main (root) directory** is used to **declare variables** used across the root configuration.

- The `main.tf` file in the **root directory** contains the **module block**, where we **connect root variables to module variables**.

- In a `module` block:
  - The **left side** of the `=` must match the **variable name defined inside the module** (`modules/vpc/variables.tf`).
  - The **right side** of the `=` is the **variable declared in the root module** (`root variables.tf`).
  - 💡 **Tip to remember:** **R** for **Right side** = **R** for **Root variable** 😁

- The `terraform.tfvars` file is used to **initialize (assign values to) the variables** declared in the root's `variables.tf`.
- Values flow like this:
```bash
terraform.tfvars → root variables.tf → module block (main.tf) → module variables.tf → resources
```



---


## 📘 Basic AWS Networking Concepts

### 🧩 What is a VPC?
**VPC (Virtual Private Cloud)** is your own isolated network inside AWS.  
It acts like your personal data center in the cloud, where you can create subnets, set routing rules, and control traffic flow.

---

### 🌐 What is a Public Subnet?
A **Public Subnet**:
- Is part of a VPC
- Is associated with a **Route Table** that has a route to the **Internet Gateway**
- Allows resources (like EC2 instances) to access or be accessed from the internet

✅ Used for:
- Web servers
- Load balancers
- Public-facing apps

---

### 🔐 What is a Private Subnet?
A **Private Subnet**:
- Also belongs to a VPC
- Has **no route to the Internet Gateway**
- Cannot directly access the internet

✅ Commonly used for:
- Databases (e.g., RDS)
- Backend services
- Anything that should remain private and secure

---

### 🌐 What is an Internet Gateway (IGW)?
An **Internet Gateway** is a **VPC component** that allows communication **between your VPC and the internet**.

- It is attached to the VPC.
- Works together with **route tables** to enable internet access.
- Required for any public subnet.

✅ Required for:
- Internet access from EC2 instances in public subnets

---

### 📍 What is an AZ (Availability Zone)?
**AZ (Availability Zone)** is a **physical data center** in an AWS Region.  
Each region (e.g., `ap-south-1`) has multiple AZs (e.g., `ap-south-1a`, `ap-south-1b`, etc.).

✅ Helps with:
- High availability
- Fault tolerance
- Disaster recovery

---

### 🚦 What is a Route Table (RT)?
A **Route Table** contains a set of **routing rules** used to determine where network traffic is directed.

Example:
```hcl
0.0.0.0/0 → Internet Gateway
