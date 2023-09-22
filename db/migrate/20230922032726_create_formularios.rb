class CreateFormularios < ActiveRecord::Migration[7.0]
  def change
    create_table :formularios do |t|
      t.references :encuesta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
