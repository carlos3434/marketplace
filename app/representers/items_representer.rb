class ItemsRepresenter
  def initialize(items)
    @items = items
  end

  def as_json
    items.map do |item|
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
        #date_added: item.created_at
      }
    end
  end

  private

  attr_reader :items
end
