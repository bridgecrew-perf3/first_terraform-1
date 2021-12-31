   provider "aws" {
      region     = var.region
      access_key = var.AWS_ACCESS_KEY_ID
      secret_key = var.AWS_SECRET_ACCESS_KEY
      default_tags {
         tags = {
            studentid = var.student_id
            workshop  = "iac"
         }
      }
   }