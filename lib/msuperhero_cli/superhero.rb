class Msuperhero::Superhero
  attr_accessor :name, :real_name, :powers, :bio

  def self.list #scrape list of http://marvel.com/characters/list/994/top_marvel_heroes
      self.scrape_superheroes
  end

  def scrape_superheroes
    superheroes = [] #empty array
    superheroes << self.scrape_mwebsite
    superheroes
  end
end
