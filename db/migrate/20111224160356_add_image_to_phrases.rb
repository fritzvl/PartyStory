class AddImageToPhrases < ActiveRecord::Migration
  def up
    change_table :phrases do |t|
      t.has_attached_file :photo
    end
  end

  def down
    remove_column :phrases, :photo
  end
end
