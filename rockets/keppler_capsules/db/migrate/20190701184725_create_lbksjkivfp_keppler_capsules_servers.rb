class CreateLbksjkivfpKepplerCapsulesServers < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_capsules_servers do |t|
      t.string :name
      t.integer :position
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :keppler_capsules_servers, :deleted_at
  end
end
