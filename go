#!/usr/bin/env bash

export PATH=/apps/svr/openresty/nginx/sbin:$PATH
exec prove "$@"
