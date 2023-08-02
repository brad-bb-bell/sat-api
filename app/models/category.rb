class Category < ApplicationRecord
  belongs_to :user
  has_many :category_activities
  has_many :activities, through: :category_activities
end
