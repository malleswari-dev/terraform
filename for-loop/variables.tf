variable "instances" {
    default = ["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","frontend"]
#   default = {
#     mongodb = "t3.micro"
#     redis = "t3.micro"
#     mysql = "t3.small"
#   }
}
variable "zone_id" {
    default = "Z10173741Y5Y3INEWNGTN"
  
}
variable "domain_name" {
    default = "malleswari.fun"
  
}