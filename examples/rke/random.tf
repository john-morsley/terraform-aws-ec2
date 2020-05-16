#      _____                 _                 
#     |  __ \               | |                
#     | |__) |__ _ _ __   __| | ___  _ __ ___  
#     |  _  // _` | '_ \ / _` |/ _ \| '_ ` _ \ 
#     | | \ \ (_| | | | | (_| | (_) | | | | | |
#     |_|  \_\__,_|_| |_|\__,_|\___/|_| |_| |_|

resource "random_pet" "name" {
  length = 2
}

resource "random_pet" "cluster-name" {
  length = 2
}

resource "random_pet" "bucket" {
  length = 5
}