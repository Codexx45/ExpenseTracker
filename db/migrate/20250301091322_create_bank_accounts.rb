class CreateBankAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :bank_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :account_number
      t.string :bank_name

      t.timestamps
    end
  end
end
