class Activity < ApplicationRecord
  has_many :did_its
  belongs_to :user
  has_many :category_activities
  has_many :categories, through: :category_activities
end
