class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.text        :message
      t.string      :login
      t.string      :chat_id
      
      t.timestamps
    end
    add_index :messages, :chat_id
    add_index :messages, :created_at
    add_index :messages, [:chat_id, :created_at]
  end

  def self.down
    remove_index :messages, :chat_id
    remove_index :messages, :created_at
    remove_index :messages, [:chat_id, :created_at]
    drop_table :messages
  end
end
