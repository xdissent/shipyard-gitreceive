#!/bin/bash

echo "CHECKING KEY \n$2\n\n... against ...\n$SSH_PUBLIC_KEY"

[ "$SSH_PUBLIC_KEY" == "$2" ] && exit 0 || exit 1