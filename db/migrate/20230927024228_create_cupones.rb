class CreateCupones < ActiveRecord::Migration[7.0]
  def change
    create_table :cupones do |t|
      t.references :cliente, null: false, foreign_key: true
      t.datetime :desde
      t.datetime :hasta
      t.integer :estado
      t.integer :descuento

      t.timestamps
    end
  end
end
