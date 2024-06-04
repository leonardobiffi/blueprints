# Origin Access Identities
data "aws_iam_policy_document" "s3_policy" {
  for_each = { for bucket in var.s3_origin_buckets : bucket.id => bucket }
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${each.value.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = module.cloudfront.cloudfront_origin_access_identity_iam_arns
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  for_each = { for bucket in var.s3_origin_buckets : bucket.id => bucket }

  bucket = each.value.id
  policy = data.aws_iam_policy_document.s3_policy[each.value.id].json
}
