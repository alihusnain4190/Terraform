provider "aws" {
  region = "us-east-1"
}
########################### NUMBER=1############################3

# resource "aws_iam_user" "lb"{
#   name = "load"
#     count = 5
  
#   path = "/system"
#     }


########################### NUMBER=2############################
# resource "aws_iam_user" "lb"{
#   name = "load.${count.index}"
#     count = 5
  
#   path = "/system"
#     }

############################NUMBER=3#######################################

variable "types" {
  type = list
    default = ["ali", "husnain","ch"]
}

resource "aws_iam_user" "lb"{
  name = var.types[count.index]
    count = 3
  
  path = "/system"
    }


