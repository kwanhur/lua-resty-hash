# lua-resty-hash
A Lua resty generic hash lib

reference from [http://www.partow.net/programming/hashfunctions](http://www.partow.net/programming/hashfunctions)

Table of Contents
=================

* [Name](#name)
* [Status](#status)
* [Synopsis](#synopsis)
* [Hash API](#hash-api)
* [Installation](#installation)
* [Authors](#authors)
* [Copyright and License](#copyright-and-license)

Status
======
This library is still under early development and experimental.

Synopsis
========
```lua
    lua_package_path "/path/to/lua-resty-hash/lib/?.lua;;";

    content_by_lua_block {
        local hash = require('resty.hash')
        local value = hash.js_hash('abctest')
        ngx.print(value)
    }
```

[Back to TOC](#table-of-contents)

Hash API
========
* RSHash

* JSHash

* PJWHash

* ELFHash

* BKDRHash

* SDBMHash

* DJBHash

* DEKHash

* APHash

[Back to TOC](#table-of-contents)

Installation
============

opm install kwanhur/lua-resty-hash

[Back to TOC](#table-of-contents)

Authors
=======

kwanhur <huang_hua2012@163.com>, VIPS Inc.

[Back to TOC](#table-of-contents)

Copyright and License
=====================

This module is licensed under the Apache License Version 2.0 .

Copyright (C) 2016, by kwanhur <huang_hua2012@163.com>, VIPS Inc.

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

[Back to TOC](#table-of-contents)