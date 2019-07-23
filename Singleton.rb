class Singleton
  def Singleton.first_sing_method
    'first'
  end

  class << self
    def second_sing_method
      'third'
    end
  end
end

puts Singleton.singleton_methods
