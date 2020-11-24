class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :postcode,           null: false
      t.integer :area_id,            null: false
      t.string  :municipality,       null: false
      t.string  :address,            null: false
      t.string  :building
      t.string  :tel,                null: false
      t.references :order,           foreign_key: true
      t.timestamps
    end
  end
end
