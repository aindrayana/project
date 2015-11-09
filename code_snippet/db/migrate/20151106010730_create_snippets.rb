class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.references :code, index: true, foreign_key: true
      t.string :title
      t.text :work

      t.timestamps null: false
    end
  end
end
