# scripts-n-at
A random assortment of scripts to do random things

## Handy One-Liners
### Get Domains from CertStream
Take raw CertSteam data, find lines containing the domain you are interested in, remove colorization, cut to get just the domain, remove bad chars using dos2unix, and finally grep for only the endlines.
```
grep -F ".google.com" certs.txt | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g" | cut -d" " -f4 | dos2unix | grep "google.com$"
```
