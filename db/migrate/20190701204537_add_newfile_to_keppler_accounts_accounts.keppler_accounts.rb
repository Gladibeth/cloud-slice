# This migration comes from keppler_accounts (originally 20190701204511)
class AddNewfileToKepplerAccountsAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_accounts_accounts, :user_account, :string
    add_column :keppler_accounts_accounts, :password_account, :string
    add_column :keppler_accounts_accounts, :additional, :text
  end
end
