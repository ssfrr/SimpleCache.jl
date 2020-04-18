module SimpleCache

export cached
using Serialization

"""
    cached(fn::Function, cachename; reset=false)

Cache the result of running `fn` and store the result in a file `cachename`. Future
invocations will be loaded from the cache rather than re-running `fn`. To force `fn` to
be run again (and overwrite the cache), either pass `reset=true` or delete the cache
file.

`cached` uses Julia's built-in serialization, so the cache is not guaranteed to be
loadable from a different Julia version or on a different architecture. It is not
intended for long-term storage, but for saving time when re-running the same code during
development.
"""
function cached(fn, cachename; reset=false)
    if isfile(cachename) && !reset
        deserialize(cachename)
    else
        result = fn()
        serialize(cachename, result)
        result
    end
end

end # module
