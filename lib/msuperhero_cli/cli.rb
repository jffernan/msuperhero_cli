#CLI Controller
class MsuperheroCli::CLI
  def call
    menu
  end

  def list #Greet user and list superheroes from scraping
    puts "***Welcome True Believers to this CLI app to learn about popular comic book superheroes***"
    puts "The following is a list of famous superhero characters in no particular order. 'Nuff said:"
  end

  def menu
    list #shows list of http://marvel.com/characters/list/994/top_marvel_heroes
  end
end
