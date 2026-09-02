class ChatMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :chat_messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.string :role, null: false
      t.jsonb :content, null: false, default: []
      t.timestamps
    end
  end
end
