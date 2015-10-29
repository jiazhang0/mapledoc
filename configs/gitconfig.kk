# Supported by git 1.7.10
# add to file .gitconfig
# [include]
# path = /path/to/gitconfig.kk

[core]
	editor = vim

[color]
	ui = true

[alias]
	br = branch
	ca = commit --amend
	ci = commit
	cs = commit -s
	co = checkout
	last = log -1 HEAD
	new = !gitk --all --not ORIG_HEAD
	pl = pull
	st = status

[sendemail]
        confirm = always

# for sendemail via gmail
# --smtp-server=smtp.gmail.com  --smtp-server-port 587 --smtp-encryption=tls --smtp-user jiashuo.kang
