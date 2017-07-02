class MsuperheroCli::Superhero
  attr_accessor :name, :url, :summary, :index
  attr_reader :doc

    def initialize(index = nil)
      @index = index
    end

  def doc
    @doc = Nokogiri::HTML(open("https://www.thoughtco.com/top-marvel-comic-book-superheroes-804277"))
  end

  def self.scrape_heroes
    doc = Nokogiri::HTML(open("https://www.thoughtco.com/top-marvel-comic-book-superheroes-804277"))
    names ||= doc.css("h3.heading").map(&:text)
  end

  def name
   @name ||= doc.css("h3.heading")[index].text.strip
  end

  def summary
   @summary ||= doc.css("p")[index+2].text.strip
  end
end
