class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :genre
      t.string :movie_url

      t.timestamps
    end
  end
end
