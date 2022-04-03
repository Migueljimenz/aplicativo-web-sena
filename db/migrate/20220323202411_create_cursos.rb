class CreateCursos < ActiveRecord::Migration[7.0]
  def change
    create_table :cursos do |t|
      t.integer :ficha
      t.datetime :fecha_entrada
      t.references :programa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
