class CreateGears < ActiveRecord::Migration[5.0]
  def change
    create_table :gears do |t|
      t.string :category
      t.string :name
      t.references :user, foreign_key: true
      t.text :description
      t.string :size
      t.string :address

      t.timestamps
    end
  end
end
