use strict;
use warnings FATAL => 'all';
use Test::Nginx::Socket 'no_plan';

no_shuffle();
run_tests();


__DATA__

=== TEST 1: JSHash generator with string
--- http_config eval: "lua_package_path '/Users/kwanhur/github/lua-resty-hash/lib/?.lua;;';"

--- config

location = /t {
    content_by_lua_block {
        local hash = require('resty.hash')
        local value = hash.js_hash('abc1234&*')
        ngx.log(ngx.NOTICE, value)
        ngx.print(value)
    }
}
--- request
GET /t

--- error_code: 200

--- no_error_log
[error]

=== TEST 2: JSHash generator with nil
--- http_config eval: "lua_package_path '/Users/kwanhur/github/lua-resty-hash/lib/?.lua;;';"

--- config
location = /t {
    content_by_lua_block {
        local hash = require('resty.hash')
        local value = hash.js_hash(nil)
        ngx.print(value or 'nil')
    }
}
--- request
GET /t

--- error_code: 200

--- no_error_log
[error]

=== TEST 3: JSHash generator with empty string
--- http_config eval: "lua_package_path '/Users/kwanhur/github/lua-resty-hash/lib/?.lua;;';"

--- config

location = /t {
    content_by_lua_block {
        local hash = require('resty.hash')
        local value = hash.js_hash('')
        ngx.log(ngx.NOTICE, value)
        ngx.print(value)
    }
}
--- request
GET /t

--- error_code: 200

--- response_body: 0

--- no_error_log
[error]
