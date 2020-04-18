# SimpleCache

[![Build Status](https://travis-ci.com/ssfrr/SimpleCache.jl.svg?branch=master)](https://travis-ci.com/ssfrr/SimpleCache.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/ssfrr/SimpleCache.jl?svg=true)](https://ci.appveyor.com/project/ssfrr/SimpleCache-jl)
[![Codecov](https://codecov.io/gh/ssfrr/SimpleCache.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/ssfrr/SimpleCache.jl)

SimpleCache.jl is a lightweight (zero-dependency) and simple (one function) package for caching intermediate results to speed up computation on subsequent runs. It is motivated by a scientific workflow where you want to re-run a whole processing pipeline where some results may be expensive to compute.

## API

    cached(fn::Function, cachename; reset=false)

Cache the result of running `fn` and store the result in a file `cachename`. Future invocations will be loaded from the cache rather than re-running `fn`. To force `fn` to be run again (and overwrite the cache), either pass `reset=true` or delete the cache file.

## Example

It is convenient to use `cached` with a `do` block. For example, the following code will take 10 seconds to run the first time, then return the result instantly the following times.

```julia
cached("someresult.jls") do
    sleep(10)
    42
end
```

`cached` uses Julia's built-in serialization, so the cache is not guaranteed to be loadable from a different Julia version or on a different architecture. It is not intended for long-term storage, but for saving time when re-running the same code during development.
