variable "environment_to_size_map" {
type = map
default = {
    default="t2.nano"
    dev="t2.micro"
    prod="t2.larg"
}
}