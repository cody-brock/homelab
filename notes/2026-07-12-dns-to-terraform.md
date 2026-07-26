## DNS to Terraform

DNS had been managed under Google Domains originally.  This was moved to Squarespace when Google Domains closed down.
In order to bring the DNS records into IAC and manage them with terraform, moved management of DNS to Cloudflare.

One learning was to disable DNSSEC before switching nameservers -- otherwise the domain would have gone dark. The active DS record being pinned to the old keys would make validators reject the new nameservers, and the domain would have become unreachable.  After disabling it for the move, re-enabled it with Cloudflare.

Another thing was that a 8.8.8.8 node was briefly serving the old DNS record after re-enabling DNSSEC.  This made it look like a rollback.  But it was just TTL.  Better would be to verify against he TLD's authoritative servers, not the public resolver's cache.

Last learning was a new import workflow -- I somehow had never used import blocks plus `terraform plan -generate-config-out`.  Definitely makes it easier to bulk import.  But also imports a lot of cruft that you then have to remove, to just keep the real inputs for each tf resource.
