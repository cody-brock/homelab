## Remote Terraform State in R2

### Migrating state to remote

Local state is a liability because it's tied to a single machine, there's no locking on the state, and state files can contain plaintext secrets.

Decided to stay in Cloudflare for the storage, so used R2. The docs https://developers.cloudflare.com/terraform/advanced-topics/remote-backend/ suggest "After updating your cloudflare.tf file you can issue the terraform init -reconfigure command to migrate from a local state to remote state ↗."  -- however, went with `-migrate-state` instead.  Per terraform docs https://developer.hashicorp.com/terraform/cli/commands/init#backend-initialization, "The -reconfigure option disregards any existing configuration, preventing migration of any existing state."  So I'm not sure why they suggest that?  We would have ended up with an empty remote state, and a subsequent plan would have shown 5 resources to create, risking duplicating the DNS records on a live domain.  This is a sneaky one, bc there's no error.

Chose to use `key = "homelab/terraform.tfstate"` so terraform state is namespaced, so future projects can share the same bucket.  Also, took a quick backup of the state (`cp terraform.tfstate ~/tfstate-backup-$(date +%Y%m%d).json`) in case anything went wrong in the move to remote backend -- a dated snapshot outside of the repo to avoid any possible mistake of adding it to VCS.  Will delete it after the first successful write (first successful read is already proven).

### AWS But Not

Note that you must have env vars AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY (as well as CLOUDFLARE_API_TOKEN) set in order to interact with the backend.  The cloudflare docs show inline access_key/secret_key, but that's not safe for VCS (and we can't use var bc the backend block loads too early).

The many `skip_*` flags are because we're aiming an AWS SDK at a non-AWS service, so we have to disable AWS-specific assumptions. Plus `use_lockfile = true` allows us to use locking here, which is why the terraform version jumped to >=1.10.  Locking works via S3 style conditional writes, which R2 supports, so no DynamoDB table is needed.

### Separating DNS State from Cluster State

Split the terraform config into two root modules, dns/ and cluster/, each with its own state in R2 (homelab/dns/..., homelab/cluster/...).

This will let us keep it separate from the cluster terraform, which might have experimental changes that we don't want to accidentally impact DNS.  Mostly ceremonial at this size, but good practice.
