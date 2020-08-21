class AddSlugColumnToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :slug, :string, unique: true
  end
end
