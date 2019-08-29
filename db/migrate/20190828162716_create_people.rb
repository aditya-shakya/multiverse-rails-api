class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :family_id
      t.integer :universe_id
      t.integer :power

      t.timestamps null: false
    end
  end
end
