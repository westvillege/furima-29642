class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :postal_code,    default: "",  null: false
      t.integer :prefecture,                  null: false
      t.string :city,           default: "",  null: false
      t.string :ad_detail,      default: "",  null: false
      t.string :building,       default: ""
      t.string :phone,          default: "",  null: false
      t.references :order,                    null: false,  foreign_key: true
      t.timestamps
    end
  end
end
