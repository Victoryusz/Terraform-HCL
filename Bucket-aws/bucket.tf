# Cria um bucket S3 com o nome especificado
resource "aws_s3_bucket" "bucket" {
  bucket = "victor-bucket-terraform"
}
