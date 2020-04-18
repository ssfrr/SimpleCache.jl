# SimpleCache

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://ssfrr.github.io/SimpleCache.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://ssfrr.github.io/SimpleCache.jl/dev)
[![Build Status](https://travis-ci.com/ssfrr/SimpleCache.jl.svg?branch=master)](https://travis-ci.com/ssfrr/SimpleCache.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/ssfrr/SimpleCache.jl?svg=true)](https://ci.appveyor.com/project/ssfrr/SimpleCache-jl)
[![Codecov](https://codecov.io/gh/ssfrr/SimpleCache.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/ssfrr/SimpleCache.jl)

SimpleCache.jl is a lightweight (zero-dependency) and simple (one function) package for caching intermediate results to speed up computation. It is motivated by a scientific workflow where you want to re-run a whole processing pipeline where some results may be expensive to compute.

## Usage

    cached(fn::Function, cachename; reset=false)

Cache the result of running `fn` and store the result in a file `cachename`. Future
invocations will be loaded from the cache rather than re-running `fn`. To force `fn` to
be run again (and overwrite the cache), either pass `reset=true` or delete the cache
file.

`cached` uses Julia's built-in serialization, so the cache is not guaranteed to be
loadable from a different Julia version or on a different architecture. It is not
intended for long-term storage, but for saving time when re-running the same code during
development.
