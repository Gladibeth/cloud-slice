class CreateKepplerPlansPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_plans_plans do |t|
      t.string :name
      t.string :description
      t.string :type
      t.integer :position
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
