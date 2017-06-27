class Msuperhero::Superhero
  attr_accessor :name, :real_name, :powers, :bio

  def initialize(name = nil)
    @name = name
  end

end
