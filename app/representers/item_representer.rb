class ItemRepresenter
  def initialize(item)
    @item = item
  end

  def as_json
    {
      id: item.id,
      title: item.title,
      author: item.author,
      category: Category.find(item.id).name,
      date_added: item.created_at
    }
  end

  private

  attr_reader :item
end
