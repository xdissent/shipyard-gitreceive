#!/bin/sh

echo "STARTING"
export RECEIVE_DEBUG=/tmp/gitreceive.txt
/bin/gitreceived "/bin/bash ssh-key-check" /bin/git-receive-handler