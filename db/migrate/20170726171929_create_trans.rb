class CreateTrans < ActiveRecord::Migration
  def change
    create_table :trans do |t|
      t.string :firstname
      t.string :lastname
      t.string :firm
      t.decimal :cost
      t.string :description
      t.integer :age

      t.timestamps null: false
    end
  end
end
