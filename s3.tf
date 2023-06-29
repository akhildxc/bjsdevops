resource "aws_s3_bucket" "example" {
  bucket = "akhil-task" 

versioning {
  enabled = true
 }

tags = {
  Name = "akhil-task"
  }
}
