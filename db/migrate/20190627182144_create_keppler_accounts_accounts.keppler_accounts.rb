# This migration comes from keppler_accounts (originally 20190627182141)
class CreateKepplerAccountsAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_accounts_accounts do |t|
      t.string :name
      t.datetime :date
      t.string :email
      t.integer :position
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
