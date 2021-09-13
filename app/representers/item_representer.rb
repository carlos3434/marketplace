class ItemRepresenter
  def initialize(item)
    @item = item
  end

  def as_json
    {
      id: item.id,
      name:item.name,
      price: item.price,
      brand: item.brand,
      warantine_time: item.warantine_time,
      strength: item.strength,
      flavor: item.flavor,
      size: item.size,
      category: Category.find(item.id).name
    }
  end

  private

  attr_reader :item
end
