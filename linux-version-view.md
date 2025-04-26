
```bash
cat /proc/version
# Linux version 2.6.18-238.el5 (mockbuild@x86-012.build.bos.redhat.com) (gcc version 4.1.2 20080704 (Red Hat 4.1.2-50)) #1 SMP Sun Dec 19 14:22:44 EST 2010
å
uname -r
# 2.6.18-238.el5

uname -a
# Linux SOR_SYS.99bill.com 2.6.18-238.el5 #1 SMP Sun Dec 19 14:22:44 EST 2010 x86_64 x86_64 x86_64 GNU/Linux

lsb_release -a
#LSB Version:    :core-4.0-amd64:core-4.0-ia32:core-4.0-noarch:graphics-4.0-amd64:graphics-4.0-ia32:graphics-4.0-noarch:printing-4.0-amd64:printing-4.0-ia32:printing-4.0-noarch
#Distributor ID: RedHatEnterpriseAS
#Description:    Red Hat Enterprise Linux AS release 4 (Nahant Update 4)
#Release:        4
#Codename:       NahantUpdate4

cat /etc/issue
#	Red Hat Enterprise Linux Server release 5.6 (Tikanga)

cat /etc/redhat-release
#	Red Hat Enterprise Linux AS release 4 (Nahant Update 4)

rpm -q redhat-release
#	redhat-release-5Server-5.6.0.3

file /bin/bash
#/bin/bash: ELF 64-bit LSB executable, AMD x86-64, version 1 (SYSV), for GNU/Linux 2.6.9, dynamically linked (uses shared libs), for GNU/Linux 2.6.9, stripped

file /bin/cat 
#/bin/cat: ELF 64-bit LSB executable, AMD x86-64, version 1 (SYSV), for GNU/Linux 2.6.9, dynamically linked (uses shared libs), for GNU/Linux 2.6.9, stripped

```