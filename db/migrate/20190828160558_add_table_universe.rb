class AddTableUniverse < ActiveRecord::Migration
  def change
    create_table :universes do |t|
      t.string :name
      t.timestamps
    end
  end
end
