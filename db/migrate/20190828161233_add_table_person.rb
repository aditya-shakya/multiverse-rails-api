class AddTablePerson < ActiveRecord::Migration
  def change
    create_table :persons do |t|
      t.string :name
      t.integer :family_id
      t.integer :universe_id
      t.timestamps
    end
  end
end
