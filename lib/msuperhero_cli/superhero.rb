class MsuperheroCli::Superhero
  def get_page
    Nokogiri::HTML(open("http://marvel.com/characters/list/994/top_marvel_heroes"))
  end

  def make_heroes
    self.get_page.each do
      superhero = Superhero.new
      superhero.name = search("a[class = 'meta-title']").text.strip
      end
  end
end
