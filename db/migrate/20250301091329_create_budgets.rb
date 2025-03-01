class CreateBudgets < ActiveRecord::Migration[8.0]
  def change
    create_table :budgets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.decimal :limit

      t.timestamps
    end
  end
end
