class MsuperheroCli::Superhero
  attr_accessor :name, :real_name, :powers, :bio

  def self.list
    #scrape list to be able to print list
    self.scrape_superheroes
  end

  def self.scrape_superheroes
    superheroes = [] #empty array

    superheroes << self.scrape_mwebsite

    superheroes
  end

  def self.scrape_mwebsite
    doc = Nokogiri::HTML(open("http://marvel.com/characters/list/994/top_marvel_heroes"))
    superhero = self.new
    superhero.name = "Spiderman"

    superhero
  end
end
