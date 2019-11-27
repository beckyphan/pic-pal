class AddColumnToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :title, :string
    add_column :reviews, :description, :text
  end
end
