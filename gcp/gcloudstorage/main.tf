module "jaybucketfirst" {
    source = "../../modules/gcloudbucket"
    name   = "jayabalansecondbucketgcp"
    project = "puppet-226118"
    lifecycleenabled = "true"
    action_type = "Delete"
    age = "10"
}

module "jaybucketsecond" {
    source = "../../modules/gcloudbucket"
    name   = "jayabalanthirdbucketgcp"
    project = "puppet-226118"
}