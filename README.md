# DNS over HTTP client

A Perl module that provides DNS DNS over HTTPS (DoH).

This is just a small module that I've built to discover 
the DNS over HTTPs protocol now that recently it has an 
RFC (https://datatracker.ietf.org/doc/rfc8484/)

## Providers:

A list of DoH Providers (https://en.wikipedia.org/wiki/Public_recursive_name_server)

A first note: The first time I tried DNS over HTTP, I tried using 1.1.1.1 (CloudFlare's
public DNS) and 8.8.8.8 (Google's public DNS) on port 443. These IPs don't provide the
DNS over HTTPS service, although they do respond to HTTPS.

See the examples directory for DoH endpoints.

Here is the documentation for each provider: 

CleanBrowsing
 - Docu: https://cleanbrowsing.org/dnsoverhttps
 - accepts the wire format as per RFC 8484

CloudFlare
 - Docu: https://developers.cloudflare.com/1.1.1.1/dns-over-https/wireformat/
 - accepts the wire format as per RFC 8484

Google 
 - Docu: https://developers.google.com/speed/public-dns/docs/dns-over-https
 - doesn't accept wire format
 - only accepts a custom GET protocol
 - doesn't seem to support wire-format

Quad9
https://www.quad9.net/doh-quad9-dns-servers/
 - accepts the wire format as per RFC 8484

OpenDNS / Cisco
https://support.opendns.com/hc/en-us/articles/360038086532-Using-DNS-over-HTTPS-DoH-with-OpenDNS
 - accepts the wire format as per RFC 8484
