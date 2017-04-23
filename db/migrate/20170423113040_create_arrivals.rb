class CreateArrivals < ActiveRecord::Migration[5.0]
  def change
    create_table :arrivals do |t|
      t.references :user, foreign_key: true
      t.boolean :arrived

      t.timestamps
    end
  end
end
