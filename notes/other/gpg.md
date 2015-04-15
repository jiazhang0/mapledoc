# GPG #

Created: Apr 15, 2015

-----------

## Intro ##

GPG/GnuPG stands for GNU Privacy Guard. It is an open source version of PGP.

## Commands ##

* gpg --gen-key
* gpg --list-keys
* gpg --delete-key / --delete-secret-key <key name>

+ output public key file(.gnupg/pubring.gpg) with ASCII:
      gpg --armor --output file.txt --export [user ID]

+ upload public key:
      gpg --send-keys [user ID] --keyserver hkp://subkeys.pgp.net

+ finger print:
      gpg --fingerprint [user ID]

+ import keys:
      gpg --import [key_file]

+ encrypt
      gpg --recipient [用户ID] --output demo.en.txt --encrypt demo.txt


## Related RPM commands ##

* rpm --addsign
* rpm -K / --checksig
* rpm --delsign
* rpm --import
* rpm --resign
