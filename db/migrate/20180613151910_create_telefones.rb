class CreateTelefones < ActiveRecord::Migration
  def change
    create_table :telefones do |t|
      t.string :tel
      t.references :contato, index: true, foreign_key: true, on_delete: :cascade

      t.timestamps null: false
    end
  end
end
