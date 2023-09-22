class AddPreferenciaToEncuesta < ActiveRecord::Migration[7.0]
  def change
    add_reference :encuestas, :preferencia, null: false, foreign_key: true
  end
end
