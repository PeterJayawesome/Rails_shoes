class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.float :amount
      t.references :seller, references: :users
      t.references :buyer, references: :users
      t.boolean :status

      t.timestamps null: false
    end
  end
end
