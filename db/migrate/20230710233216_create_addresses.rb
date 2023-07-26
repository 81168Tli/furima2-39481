class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :s_num, null: false
      t.string :build_name, null: false
      t.string :tel, null: false
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
