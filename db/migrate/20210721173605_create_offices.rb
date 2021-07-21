class CreateOffices < ActiveRecord::Migration[6.1]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :street
      t.integer :ext_number
      t.integer :int_number
      t.string :neighborhood
      t.integer :postal_code
      t.string :city
      t.string :country
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
