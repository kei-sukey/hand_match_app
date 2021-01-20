class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name,               null: false
      t.integer     :price,              null: false
      t.text        :explanation,        null: false
      t.integer     :category_id,        null: false
      t.integer     :color_id,           null: false
      t.integer     :material_id,        null: false
      t.integer     :size_id,            null: false
      t.integer     :delivery_charge_id, null: false
      t.integer     :prefecture_id,      null: false
      t.integer     :shipping_day_id,    null: false
      t.references  :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end