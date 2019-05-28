class CreateContatos < ActiveRecord::Migration
  def change
    create_table :contatos do |t|
      t.string :nome
      t.string :email
      t.references :tipo, index: true, foreign_key: true, on_delete: :cascade
      t.text :obs

      t.timestamps null: false
    end
  end
end
