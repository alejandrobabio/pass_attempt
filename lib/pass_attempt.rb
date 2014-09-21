require "pass_attempt/version"

module PassAttempt
  module_function

  def try(name, condition, &block)
    yield if check(condition, incr(name))
  end

  def incr(name)
    @names ||= {}
    @names[name] = @names.fetch(name, 0) + 1
  end

  def check(condition, attemp)
    case condition
    when :log2
      Math.log2(attemp) == Math.log2(attemp).truncate
    when :log10
      Math.log10(attemp) == Math.log10(attemp).truncate
    else
      condition.call(attemp)
    end
  end
end
