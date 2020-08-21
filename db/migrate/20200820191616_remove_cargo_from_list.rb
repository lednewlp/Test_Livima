class RemoveCargoFromList < ActiveRecord::Migration[6.0]
  def change
    remove_column :lists, :cargo, :string
  end
end
