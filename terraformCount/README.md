# By using Count
you can scale a resources. if you use count 5 it will create 5 resources.

your output will be 
load
load
load
load 
load

Note this output is not understand able

### Count index
 ## 
 ``` resource "aws_iam_user" "lb"{
  name = "load.${count.index}"
    count = 5
  
  path = "/system"
    }
```
your output will be like this 

load.1
load.2
load.3
load.4

Even this output is fine but not suitable for human read.




```
variable "types" {
  type = list
    default = ["ali", "husnain","ch"]
}

resource "aws_iam_user" "lb"{
  name = var.types[count.index]
    count = 3
  
  path = "/system"
    }


```
#### NOW YOUR OUTPUT WILL BE #################3
ali
husnain
ch