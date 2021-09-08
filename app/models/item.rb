class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :name,:price,:brand,:warantine_time,:strength, :flavor, :size, presence: true, length: { minimum: 3 }
end
