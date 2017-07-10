class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.float :amount, null: false
      t.float :balance_after_transaction, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
