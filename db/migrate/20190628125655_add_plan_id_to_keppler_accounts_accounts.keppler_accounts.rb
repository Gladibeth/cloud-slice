# This migration comes from keppler_accounts (originally 20190628125459)
class AddPlanIdToKepplerAccountsAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_accounts_accounts, :plan_id, :integer
  end
end
