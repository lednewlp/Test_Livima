class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :email
      t.string :cargo
      t.decimal :salario

      t.timestamps
    end
  end
end
