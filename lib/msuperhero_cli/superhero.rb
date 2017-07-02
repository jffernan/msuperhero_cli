class MsuperheroCli::Superhero
  attr_accessor :name, :url, :summary, :index
  attr_reader :doc
#above attributes to access
    def initialize(index = nil) #initialize new superhero with index with default of nil if not provided
      @index = index #set index variable
    end

  def doc
    @doc = Nokogiri::HTML(open("https://www.thoughtco.com/top-marvel-comic-book-superheroes-804277")) #define doc method to specify webpage to scrape list from
  end

  def self.scrape_heroes #method to scrape search for list of heroes
    doc = Nokogiri::HTML(open("https://www.thoughtco.com/top-marvel-comic-book-superheroes-804277"))
    names ||= doc.css("h3.heading").map(&:text)
  end

  def name #method to scrape index the name of requested hero
   @name ||= doc.css("h3.heading")[index].text.strip
  end

  def summary #method to scrape index the bio summary of requested hero
   @summary ||= doc.css("p")[index+2].text.strip
  end
end
