#CLI Controller
class MsuperheroCli::CLI

  def call
    list_heroes
    menu
    ending
  end

  def list_heroes #Greet user and list superheroes from scraping
      puts "***Welcome True Believers to this CLI app to learn about popular comic book superheroes***"
      puts "The following is a list of famous superhero characters in no particular order. 'Nuff said:"
      MsuperheroCli::Superhero.all.each.with_index(1) do |superhero, i|
        puts "#{i}. #{superhero.name}"
      end
    end

