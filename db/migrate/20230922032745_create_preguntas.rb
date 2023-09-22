class CreatePreguntas < ActiveRecord::Migration[7.0]
  def change
    create_table :preguntas do |t|
      t.string :texto

      t.timestamps
    end
  end
end
