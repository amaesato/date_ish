class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :favorite_item, null: false
      t.string :favorite_swearword, null: false
      t.boolean :active, default: true
      t.string :interests
      t.string :bio, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
