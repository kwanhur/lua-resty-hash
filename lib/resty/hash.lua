-- Copyright (C) by Kwanhur Huang


-- ref:http://www.partow.net/programming/hashfunctions/

local modulename = "restyHash"
local _M = {}
_M._VERSION = '0.0.1'
_M._NAME = modulename

local byte = string.byte
local sub = string.sub

local lshift = bit.lshift
local rshift = bit.rshift
local bxor = bit.bxor
local band = bit.band
local bnot = bit.bnot
local tobit = bit.tobit


_M.rs_hash = function(key)
    if not key then
        return nil
    end

    local b = 378551
    local a = 63689
    local hash = 0
    local i = 1

    while i <= #key do
        hash = hash * a + byte(sub(key, i, i))
        a = a * b
        i = i + 1
    end
    return hash
end

_M.js_hash = function(key)
    if not key then
        return nil
    end

    local hash = 1315423911
    local i = 1

    while i <= #key do
        hash = bxor(hash, (lshift(hash, 5) + byte(sub(key, i, i)) + rshift(hash, 2)))
        i = i + 1
    end
    return hash
end

_M.pjw_hash = function(key)
    if not key then
        return nil
    end

    local bits_in_unsigned_int = 64
    local three_quarters = bits_in_unsigned_int * 3 / 4
    local one_eight = bits_in_unsigned_int / 8
    local high_bits = lshift(tobit(0xFFFFFFFF), (bits_in_unsigned_int - one_eight))
    local hash = 0
    local test = 0
    local i = 1

    while i <= #key do
        hash = lshift(hash, one_eight) + byte(sub(key, i, i))
        test = band(hash, high_bits)
        if test ~= 0 then
            hash = band(bxor(hash, rshift(test, three_quarters)), bnot(high_bits))
        end
        i = i + 1
    end
    return hash
end

_M.elf_hash = function(key)
    if not key then
        return nil
    end

    local hash = 0
    local x = 0
    local i = 1

    while i <= #key do
        hash = lshift(hash, 4) + byte(sub(key, i, i))
        x = band(hash, tobit(0xF0000000))
        if x ~= 0 then
            hash = bxor(hash, rshift(x, 24))
        end
        hash = band(hash, bnot(x))
        i = i + 1
    end
    return hash
end

_M.bkdr_hash = function(key)
    if not key then
        return nil
    end

    local seed = 131 --31 131 1313 13131 131313 etc..
    local hash = 0
    local i = 1

    while i <= #key do
        hash = hash * seed + byte(sub(key, i, i))
        i = i + 1
    end
    return hash
end

_M.sdbm_hash = function(key)
    if not key then
        return nil
    end

    local hash = 0
    local i = 1

    while i <= #key do
        hash = byte(sub(key, i, i)) + lshift(hash, 6) + lshift(hash, 16) - hash
        i = i + 1
    end
    return hash
end

_M.djb_hash = function(key)
    if not key then
        return nil
    end

    local hash = 5381
    local i = 1

    while i <= #key do
        hash = lshift(hash, 5) + hash + byte(sub(key, i, i))
        i = i + 1
    end
    return hash
end

_M.dek_hash = function(key)
    if not key then
        return nil
    end

    local hash = #key
    local i = 1

    while i <= #key do
        hash = bxor(bxor(lshift(hash, 5), rshift(hash, 27)), byte(sub(key, i, i)))
        i = i + 1
    end
    return hash
end

_M.ap_hash = function(key)
    if not key then
        return nil
    end

    local hash = 0xAAAAAAAA
    local i = 1

    while i <= #key do
        if band(i, 1) == 0 then
            hash = bxor(hash, bxor(lshift(hash, 7), byte(sub(key, i, i))) * rshift(hash, 3))
        else
            hash = bxor(hash, bnot(lshift(hash, 11) + bxor(byte(sub(key, i, i)), rshift(hash, 5))))
        end
        i = i + 1
    end
    return hash
end

return _M