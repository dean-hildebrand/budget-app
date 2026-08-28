class CreateBudgets < ActiveRecord::Migration[8.1]
  def change
    create_table :budgets do |t|
      t.string :name
      t.date :month

      t.timestamps
    end
  end
end
