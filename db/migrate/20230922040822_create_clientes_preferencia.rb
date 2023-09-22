class CreateClientesPreferencia < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes_preferencia do |t|
      t.references :cliente, null: false, foreign_key: true
      t.references :preferencia, null: false, foreign_key: true

      t.timestamps
    end
  end
end
