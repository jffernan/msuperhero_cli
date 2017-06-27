#CLI Controller
def MsuperheroCli::CLI
  def call
    start
  end

  def list #Greet user and list superheroes from scraping
    puts "*******Welcome True Believers to this CLI app to learn about popular comic book superheroes*******"
    puts "Here is a list of famous superhero characters in no particular order...'nuff said:"
  end

  def start
    list #shows list of http://marvel.com/characters/list/994/top_marvel_heroes
  end
end