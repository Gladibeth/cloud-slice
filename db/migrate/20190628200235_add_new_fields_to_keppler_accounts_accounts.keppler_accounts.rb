# This migration comes from keppler_accounts (originally 20190628200130)
class AddNewFieldsToKepplerAccountsAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_accounts_accounts, :renovate, :boolean
  end
end
