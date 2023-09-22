class CreateRespuestas < ActiveRecord::Migration[7.0]
  def change
    create_table :respuestas do |t|
      t.references :cliente, null: false, foreign_key: true
      t.references :formulario_pregunta, null: false, foreign_key: true
      t.integer :valor_respuesta

      t.timestamps
    end
  end
end
