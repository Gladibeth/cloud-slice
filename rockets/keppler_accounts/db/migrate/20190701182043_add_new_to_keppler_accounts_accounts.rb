class AddNewToKepplerAccountsAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_accounts_accounts, :servidor, :string
  end
end
