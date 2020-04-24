## Create Key Locally
```
ssh-keygen -t rsa
```

### Manual Copy Key to machine
```
ssh-copy-id -i ~/.ssh/id_rsa.pub root@fcinode112.rtp.raleigh.ibm.com
```
**OR**

### Download then Modify `create_sshtrust.sh` script to install keys on a list of machines
```
cd ~
curl -O https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/sshtrust/create_sshtrust.sh
curl -O https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/sshtrust/login_exp.sh
```
