class MsuperheroCli::Superhero
  attr_accessor :name, :url, :real_name, :power, :bio

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
  end

  def self.all
    @@all ||= scrape_heroes
  end

  def self.find(id)
    self.all[id-1]
  end

  def self.find_by_name(name)
    self.all.detect do |m|
      m.name.downcase.strip == name.downcase.strip ||
      m.name.split("(").first.strip.downcase == name.downcase.strip
    end
  end

  def self.scrape_heroes
    doc = Nokogiri::HTML(open("https://www.thoughtco.com/top-marvel-comic-book-superheroes-804277"))
    names = doc.search("h3[class = 'heading heading-inline']")
    names.collect{|e| new(e.text.strip, "https://www.thoughtco.com#{e.attr("href").split("?").first.strip}")}
  end

  def summary
    # fetch summary if available or search doc and retrieve
    @summary = doc.search('div[class="content-list-body"] p').text.strip
  end

  def doc
    @doc = Nokogiri::HTML(open(self.url))
  end
end
