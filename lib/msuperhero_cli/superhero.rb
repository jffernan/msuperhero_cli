class MsuperheroCli::Superhero
  attr_accessor :name, :url, :real_name, :power, :bio

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
  end

  def self.all
    @@all ||= scrape_heroes
  end

  def self.scrape_heroes
    doc = Nokogiri::HTML(open("http://marvel.com/characters/list/994/top_marvel_heroes"))
    names = doc.search("a[class = 'meta-title']")
    names.collect{|e| new(e.text.strip, "http://marvel.com#{e.attr("href").split("?").first.strip}")}
  end

  def doc
    @doc = Nokogiri::HTML(open(self.url))
  end
end
