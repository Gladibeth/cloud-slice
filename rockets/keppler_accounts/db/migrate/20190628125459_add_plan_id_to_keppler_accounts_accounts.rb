class AddPlanIdToKepplerAccountsAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_accounts_accounts, :plan_id, :integer
  end
end
