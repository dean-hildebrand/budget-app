class CreateToolInvocations < ActiveRecord::Migration[8.1]
  def change
    create_table :tool_invocations do |t|
      t.references :chat_message, null: false, foreign_key: true
      t.string :tool_use_id, null: false, index: { unique: true }
      t.string :name, null: false
      t.jsonb :input, null: false, default: {}
      t.jsonb :result
      t.integer :status, null: false, default: 0 # pending/approved/rejected/executed/failed

      t.timestamps
    end
  end
end
