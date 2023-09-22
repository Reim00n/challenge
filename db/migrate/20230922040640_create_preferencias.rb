class CreatePreferencias < ActiveRecord::Migration[7.0]
  def change
    create_table :preferencias do |t|
      t.string :texto

      t.timestamps
    end
  end
end
