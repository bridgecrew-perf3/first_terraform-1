   provider "aws" {
      region     = var.region
      default_tags {
         tags = {
            studentid = var.student_id
            workshop  = "iac"
         }
      }
   }