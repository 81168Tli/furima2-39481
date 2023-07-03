class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.text :content, null: false
      t.integer :price, null: false
      
      t.integer :genre_id, null: false
      t.integer :state_id, null: false
      t.integer :deriver_cost_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :deriver_day_id, null: false
      t.integer :user_id, null: false

      
      t.timestamps

    end
  end
end
