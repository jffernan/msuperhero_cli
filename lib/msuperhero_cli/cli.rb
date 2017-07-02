#cli controller
class MsuperheroCli::CLI

  def call
    puts "***Welcome True Believers to this app to learn about popular comic book superheroes***"
    puts ""
    list_heroes
    menu
    option
  end

  def list_heroes #Greet user and list superheroes from scraping
    puts "The following is a list of famous Marvel superhero characters:"
    MsuperheroCli::Superhero.scrape_heroes.each.with_index do |h, i|
      puts "(#{i+1}) #{h}"
    end
  end

  def menu
    puts "Enter the 'number' of the above superhero you wish to learn about?"
      #recieve user input, remove whitespace, and make lowercase
    index = gets.strip.to_i
    if index > 0 && index < 13
    superheroes = MsuperheroCli::Superhero.new(index-1)
    print_hero(superheroes)
    else
      option
    end
  end

  def option
    puts ""
    puts "Please type 'list' to view the heroes again or type 'exit' to quit app. 'Nuff said!"
    input = gets.strip.downcase
      if input == "exit"
        ending
      elsif input == "list"
        list_heroes
        menu
        option
      else
       puts "Error bub!"
       option
      end
   end

  def print_hero(superheroes)
    puts "Superhero Name: #{superheroes.name}"
    puts "Super-Bio: #{superheroes.summary}"
  end

  def ending
    puts "Thank you for using my app! Excelsior!"
  end
end
