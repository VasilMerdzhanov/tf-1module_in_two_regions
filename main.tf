
provider "aws" {
  region = "us-west-2" # First region
}

provider "aws" {
  alias  = "us_east_1" # Alias for the second region
  region = "us-east-1" # Second region
}

module "example_module_us_west_2" {
  source = "./modules"
  region = "us-west-2"
  ami    = var.ami-us-west-2
}

module "example_module_us_east_1" {
  source = "./modules"
  providers = {
    aws = aws.us_east_1
  }
  region = "us-east-1"
  ami    = var.ami-us-east-1

}

variable "ami-us-west-2" {
  description = "Ami variable for us-west-2"
  default = "ami-03f65b8614a860c29"
}

variable "ami-us-east-1" {
  description = "Ami variable for us-east-1"
  default = "ami-053b0d53c279acc90"
}