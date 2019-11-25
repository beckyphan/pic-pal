class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :datetime
      t.belongs_to :host, null: false, foreign_key: true
      t.belongs_to :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
