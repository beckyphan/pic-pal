class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :movie_url, :image_url
  end
end
