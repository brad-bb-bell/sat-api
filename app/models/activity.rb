class Activity < ApplicationRecord
  has_many :did_its
  belongs_to :user
  belongs_to :category, optional: true
end
