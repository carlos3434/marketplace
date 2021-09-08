class ItemsRepresenter
  def initialize(items)
    @items = items
  end

  def as_json
    items.map do |item|
      {
        id: item.id,
        title: item.title,
        author: item.author,
        category: Category.find(item.id).name,
        date_added: item.created_at
      }
    end
  end

  private

  attr_reader :items
end
