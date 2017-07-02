#cli controller
class MsuperheroCli::CLI

  def call #define call method to start app and show the order of methods
    puts "***Welcome True Believers to this app to learn about popular comic book superheroes***" #greet user
    puts "" #new empty line
    list_heroes #call list heroes
    menu #call menu to ask for user input
    option #call option to give users options to show list again or exit to quit
  end

  def list_heroes #Greet user and list superheroes from scraping
    puts "The following is a list of famous Marvel superhero characters:"
    MsuperheroCli::Superhero.scrape_heroes.each.with_index do |h, i| #Call scrape method to each.iterate over each hero
      puts "(#{i+1}) #{h}" #prints the indexed list of heroes
    end
  end

  def menu #Define menu method for user inputs
    puts "Enter the 'number' of the above superhero you wish to learn about?"
    #Above is ask user for specific input as number
    index = gets.strip.to_i #define variable, strip whitespace, and index to store user input as an integer
    if index > 0 && index < 13 #If statement to limit user index to a number between 1 and 12
    superheroes = MsuperheroCli::Superhero.new(index-1) #creates a new superheroes object with an index minus 1
    print_hero(superheroes)#run method to print_hero with an argument of superheroes
  else #if user input for index is letters, 0 , 13 or greater than call option method
      option #run option method
    end
  end

  def option #def option method to give user other options
    puts "" #new empty line to space
    puts "Please type 'list' to view the heroes again or type 'exit' to quit app. 'Nuff said!" #2nd input where Ask user for more input to list or exit
    input = gets.strip.downcase #Receives user input, remove whitespace, and make lowercase
      if input == "exit" #If statement, if user types exit to run ending method
        ending #Method to quit app
      elsif input == "list" #Else if statement, if user types list to print out heroes list again
        list_heroes #print heroes list again
        menu #run menu method again
        option #run option again for user input again
      else #if user types anything else besides list or exit, then prints out error message
       puts "Error bub!"
       option #Goes back to run option method to ask for 2nd user input
      end
   end

  def print_hero(superheroes) #Define print_hero method with argument of superheroes to print out selected name of hero and their bio summary
    puts "Superhero Name: #{superheroes.name}" #Run .name method on searched superheroes
    puts "Super-Bio: #{superheroes.summary}" #Run .summary method on searched superheroes
  end

  def ending #Define ending method
    puts "Thank you for using my app! Excelsior!" #Prints exit message to thank user for using app
  end
end
