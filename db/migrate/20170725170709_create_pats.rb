class CreatePats < ActiveRecord::Migration
  def change
    create_table :pats do |t|
      t.string :name
      t.timestamp :dob
      t.integer :phone
      t.string :condition
      t.datetime :appointment

      t.timestamps null: false
    end
  end
end
