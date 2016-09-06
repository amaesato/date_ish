class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zip, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
