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
