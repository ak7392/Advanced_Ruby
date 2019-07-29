class MyAPI
  def self.__is__(text)
    @__is__ = text
  end

  def self.method_added(method)
    @__help__ ||= {}
    @__help__[method.to_s] = @__is__
    @__is__ = nil
  end

  def self.help(of)
    @__help__[of]
  end

  __is__ "open file <file>"
  def open(file)
    #...
  end

  __is__ "do X"
  def do(*params)
    #...
  end

  __is__ "calls help, use help <command>"
  def help(*args, &block)
    self.class.help(*args, &block)
  end
end

MyAPI.new(...).pry
