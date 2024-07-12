#for CSF
#!/bin/sh
csf -td 0.0.0.0/0 60 -d out "block all outbound connections for 60 seconds"
csf -td 0.0.0.0/0 60 -d in "block all inbound connections for 60 seconds"

#For only CentOS
#!/bin/sh
firewall-cmd --direct --add-rule ipv4 filter OUTPUT 1 -o ens33 -j DROP
firewall-cmd --reload
