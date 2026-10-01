data "aws_iam_policy_document" "cloudfront_s3_access" {
  statement {
    sid    = "AllowCloudFrontServicePrincipalReadOnly"
    effect = "Allow"

    principals {
      type = "Service"

      identifiers = [
        "cloudfront.amazonaws.com"
      ]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${module.s3.bucket_arn}/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"

      values = [
        module.cloudfront.distribution_arn
      ]
    }
  }
}

resource "aws_s3_bucket_policy" "cloudfront_access" {
  bucket = module.s3.bucket_id

  policy = data.aws_iam_policy_document.cloudfront_s3_access.json
}
