class AddOccupationToLists < ActiveRecord::Migration[6.0]
  def change
    add_reference :lists, :occupation, null: true, foreign_key: true
  end
end
