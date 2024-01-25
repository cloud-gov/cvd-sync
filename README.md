# cvd-sync

A pipeline for syncing clamav databases into an s3-based mirror.

## Why mirror clamav?

Clamav's public mirror implements rate-limiting, and we run all our traffic
and all our users' traffic out a fixed, small set of egress IPs, so we have
potential to hit those limits, and then have a bad day. Having a mirror 
isolates us from that problem (mostly).

## How does it work?

The [docker](./docker/) directory is used to build a docker container used
for running clamav's mirror syncing tool, `cvdupdate`. 
We run the `cvdupdate` tool in the container, tracking state in a private s3
bucket, and keeping the virus database in a public website bucket, which then
acts as a mirror. 

## development

### sharp edge - rate limiting

Because the `cvdupdate` tool works differently from `freshclam` and is more 
resource-intesive, clamav rate limits it much more aggressively. Like 5
updates in an hour and you get locked out for 24 hours.
If you're developing on parts _other_ than the `cvdupdate` step, it's best to 
replace it with something like `touch` to fake updates.
