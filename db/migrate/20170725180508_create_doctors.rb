class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.references :user, index: true, foreign_key: true
      t.string :phone

      t.timestamps null: false
    end
  end
end
