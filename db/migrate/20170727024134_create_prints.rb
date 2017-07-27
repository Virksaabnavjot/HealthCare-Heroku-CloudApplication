class CreatePrints < ActiveRecord::Migration
  def change
    create_table :prints do |t|
      t.string :name
      t.string :case
      t.string :prescription
      t.date :published

      t.timestamps null: false
    end
  end
end
