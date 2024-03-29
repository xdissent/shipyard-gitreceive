#!/bin/bash


source /bin/utils.sh

repo=$1
commit=$2

echo "RECEIVED REPO $1 AT $2"


# # Get the controller
# controller=$(get_controller_ip) || exit 1

# # Check the repo exists
# result=$(http_request GET http://$controller/gitreceive/check-repo $AUTH name=="$1") || exit 1
# [ "$result" == "ok" ] || exit 1

# # Upload the data
# # I don't know how to make httpie do a form upload with data from stdin,
# # so save it to a temporary file first.
# md5=$(echo $repo | md5sum | awk '{ print $1 }')
# tmpfile=/tmp/pushed-$md5-$(date -u +\%Y\%m\%dt\%H\%M\%S)
# logfile=/tmp/log-$md5-$(date -u +\%Y\%m\%dt\%H\%M\%S)
# function cleanup {
#   rm -f $tmpfile
#   rm -f $logfile
# }
# trap cleanup EXIT

# # https://github.com/jakubroztocil/httpie/issues/230
# cat - > $tmpfile
# http --ignore-stdin --timeout 3600 --check-status --follow --stream -f POST http://$controller/gitreceive/push-data $AUTH name=="$repo" version=="$commit" tarball@$tmpfile 2>&1 | tee $logfile
# # Musn't accept on timeout
# if ((${PIPESTATUS[0]} > 0)); then
#     exit 1
# fi
# # Also exit with failure if last line contains an error
# if tail -n 1 $logfile | grep Error > /dev/null; then
#     exit 1
# fi