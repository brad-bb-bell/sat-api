class AddCategoryToActivities < ActiveRecord::Migration[7.0]
  def change
    add_reference :activities, :category, null: true, foreign_key: true
  end
end
