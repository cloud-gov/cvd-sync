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

