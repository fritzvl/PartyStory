class AddOrderToPhrases < ActiveRecord::Migration
  def up
    add_column :phrases, :phrase_order, :integer
  end


  def down
    remove_column :phrases, :phrase_order
  end
end
