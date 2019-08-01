class Actor
  def self.act
    eval(" " , TOPLEVEL_BINDING)
  end
end

user_input = ''
until user_input == 'q' do
 user_input = gets.chomp
 @actor = user_input
 p Actor.act
end
