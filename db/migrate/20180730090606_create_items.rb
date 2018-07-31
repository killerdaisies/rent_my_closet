class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.boolean :availability, default: false, null: false
      t.string :price
      t.string :sizing
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
