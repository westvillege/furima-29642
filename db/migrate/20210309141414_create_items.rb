class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product
      t.text :description
      t.integer :price
      t.references :user
      t.integer :category_id
      t.integer :condition_id
      t.integer :fee_id
      t.integer :prefecture_id
      t.integer :time_id
      t.timestamps
    end
  end
end
