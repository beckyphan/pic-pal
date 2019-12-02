class CreateToWatches < ActiveRecord::Migration[6.0]
  def change
    create_table :to_watches do |t|
      t.boolean :watched
      t.belongs_to :movie, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
