class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :to_do
      t.integer :list_id
    end
  end
end
