####################################
### ACM Expiration               ###
####################################
resource "aws_config_organization_managed_rule" "acm_expiration" {
  name        = "acm_expiration"
  description = "Noncompliant when ACM certificates are expiring in the next 14 days"

  rule_identifier = "ACM_CERTIFICATE_EXPIRATION_CHECK"
}

####################################
### Cloudtrail Enabled           ###
####################################
resource "aws_config_organization_managed_rule" "cloudtrail_enabled" {
  name        = "cloudtrail_enabled"
  description = "Noncompliant when cloudtrail is disabled"

  rule_identifier = "CLOUD_TRAIL_ENABLED"
}

####################################
### Cloudtrail Global Enabled    ###
####################################
resource "aws_config_organization_managed_rule" "cloudtrail_global_nabled" {
  name        = "cloudtrail_global_enabled"
  description = "Noncompliant when there is no enabled multi-region cloudtrail"

  rule_identifier = "MULTI_REGION_CLOUD_TRAIL_ENABLED"
}

####################################
### Cloudtrail Encrypted         ###
####################################
resource "aws_config_organization_managed_rule" "cloudtrail_encrypted" {
  name        = "cloudtrail_encrypted"
  description = "Noncompliant when cloudtrail is not encrypted"

  rule_identifier = "CLOUD_TRAIL_ENCRYPTION_ENABLED"
}

####################################
### Cloudtrail File Validation   ###
####################################
resource "aws_config_organization_managed_rule" "cloudtrail_file_validation" {
  name        = "cloudtrail_file_validation"
  description = "Noncompliant when cloudtrail is not writing signed digest files with logs"

  rule_identifier = "CLOUD_TRAIL_LOG_FILE_VALIDATION_ENABLED"
}

####################################
### IAM Keys Rotated             ###
####################################
resource "aws_config_organization_managed_rule" "iam_keys_rotated" {
  name        = "iam_keys_rotated"
  description = "Noncompliant when iam access keys haven't been rotated in the last 90 days"

  rule_identifier = "ACCESS_KEYS_ROTATED"

  input_parameters = "{\"maxAccessKeyAge\": \"90\"}"
}

####################################
### IAM Root Keys                ###
####################################
resource "aws_config_organization_managed_rule" "iam_root_keys" {
  name        = "iam_root_keys"
  description = "Noncompliant when the root user has active AWS access keys"

  rule_identifier = "IAM_ROOT_ACCESS_KEY_CHECK"
}

####################################
### IAM Root MFA                 ###
####################################
resource "aws_config_organization_managed_rule" "iam_root_mfa" {
  name        = "iam_root_mfa"
  description = "Noncompliant when the root user does not have MFA enabled"

  rule_identifier = "ROOT_ACCOUNT_MFA_ENABLED"
}

####################################
### IAM Console User MFA         ###
####################################
resource "aws_config_organization_managed_rule" "iam_console_user_mfa" {
  name        = "iam_console_user_mfa"
  description = "Noncompliant when an IAM user with console access does not have MFA enabled"

  rule_identifier = "MFA_ENABLED_FOR_IAM_CONSOLE_ACCESS"
}

####################################
### IAM Unused User              ###
####################################
resource "aws_config_organization_managed_rule" "iam_unused_user" {
  name        = "iam_unused_user"
  description = "Noncompliant when an IAM users keys or password have not been used in the last 90 days"

  rule_identifier = "IAM_USER_UNUSED_CREDENTIALS_CHECK"

  input_parameters = "{\"maxCredentialUsageAge\": \"90\"}"
}

####################################
### IAM User Policies            ###
####################################
resource "aws_config_organization_managed_rule" "iam_user_policies" {
  name        = "iam_user_policies"
  description = "Noncompliant when an IAM user has policies attached directly"

  rule_identifier = "IAM_USER_NO_POLICIES_CHECK"
}

####################################
### IAM User in Group            ###
####################################
resource "aws_config_organization_managed_rule" "iam_user_in_group" {
  name        = "iam_user_in_group"
  description = "Noncompliant when an IAM user is not in at least one group"

  rule_identifier = "IAM_USER_GROUP_MEMBERSHIP_CHECK"
}
