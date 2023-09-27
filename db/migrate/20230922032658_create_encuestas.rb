class CreateEncuestas < ActiveRecord::Migration[7.0]
  def change
    create_table :encuestas do |t|
      t.string :nombre
      t.integer :estado

      t.timestamps
    end
  end
end
