class CreateFormulariosPregunta < ActiveRecord::Migration[7.0]
  def change
    create_table :formularios_pregunta do |t|
      t.references :formulario, null: false, foreign_key: true
      t.references :pregunta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
