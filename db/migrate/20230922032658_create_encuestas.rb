class CreateEncuestas < ActiveRecord::Migration[7.0]
  def change
    create_table :encuestas do |t|
      t.string :nombre_encuesta
      t.integer :estado_encuesta

      t.timestamps
    end
  end
end
