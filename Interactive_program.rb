class Bind
  def get_binding
    binding
  end
  def exit_method
    exit(0)
  end
end

if ARGV[0] == "q"
  Bind.new.exit_method
else
  puts eval("ARGV[0]", Bind.new.get_binding)
end
