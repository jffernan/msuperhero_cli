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

  def menu
    input = nil # Define input for while method on next line
    while input != "exit" #run this code unless user inputs exit
      # Ask user for specific input
      puts "Enter the 'number' or 'name' of the hero you wish to learn about, or type 'list' to view the heroes again, or type 'exit' to quit app."
      #recieve user input, remove whitespace, and make lowercase
      input = gets.strip.downcase
      if input == "list"
        list_heroes
      elsif input.to_i == 0
        if superhero = MsuperheroCli::Superhero.find_by_name(input)
          print_hero(superhero)
        end
      elsif input.to_i > 0
        if superhero = MsuperheroCli::Superhero.find(input.to_i)
          print_hero(superhero)
        end
      else
        new_input = input.to.i
        if new_input.between?(1,10)
          superhero = MsuperheroCli::Superhero.find(new_input)
          print_hero(superhero)
        end
      end
    end
  end
  
  def print_hero(superhero)
      puts "-------------- #{superhero.name} --------------"
      puts "Real Name: #{superhero.real_name}"
      puts "Power(s): #{superhero.power}"
      puts "Bio: #{superhero.bio}"
  end

  def ending
    puts "Thank you for using my app!  Excelsior!"
  end
end
