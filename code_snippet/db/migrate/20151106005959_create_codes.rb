class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :category

      t.timestamps null: false
    end
  end
end
