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
    doc = Nokogiri::HTML(open("http://marvel.com/characters/list/994/top_marvel_heroes"))
    names = doc.search("a[class = 'meta-title']")
    names.collect{|e| new(e.text.strip, "http://marvel.com#{e.attr("href").split("?").first.strip}")}
  end

  def real_name
    @real_name = doc.css('div[class="featured-item-meta"] p') [0].text.strip
  end

  def power
    @power = doc.css("p[data-blurb] span") [0].text.strip
  end

  def bio
    @bio = doc.css('div[class="featured-item-desc"] p[data-blurb]') [1].text.strip
  end

  def doc
    @doc = Nokogiri::HTML(open(self.url))
  end
end
