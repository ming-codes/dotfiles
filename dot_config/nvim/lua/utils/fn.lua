return {
  wrap = function(fn, wrapper)
    return function(...)
      return wrapper(fn, ...)
    end
  end
}
