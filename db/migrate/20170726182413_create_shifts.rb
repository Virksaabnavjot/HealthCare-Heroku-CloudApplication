class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :firstname
      t.string :lastname
      t.string :firm
      t.decimal :cost
      t.string :description
      t.string :color

      t.timestamps null: false
    end
  end
end
