class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.string :firstname
      t.string :lastname
      t.string :firm
      t.decimal :cost
      t.string :detail
      t.integer :age

      t.timestamps null: false
    end
  end
end
