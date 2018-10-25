class Ad 
  def initialize(article)
    article.children.each do |item|
      if item['class'] == "entity-title"
        @title = item.text
      elsif item['class'] == "entity-description"
        @description = item.children[1].text.strip
      elsif item['class'] == "entity-pub-date"
        @pub_date = item.children[2].text 
      elsif item['class'] == "entity-prices"
        @price = item.children[1].children[1].children[1].text
      end
    end
    @title = article.children[1].text
    #puts article.children[7].attr('class')
  end

  def getTitle()
    @title
  end

  def getPrice()
    @price
  end

  def getPublishDate() 
    @pub_date
  end

  def getDescription() 
    @description
  end
end