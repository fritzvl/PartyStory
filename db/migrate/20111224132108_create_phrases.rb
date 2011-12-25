class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :caption
      t.boolean :occupied
      t.string :author
      t.timestamps
    end
  end
end
