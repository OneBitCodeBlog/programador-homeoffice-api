class AddKeyWordToSearch < ActiveRecord::Migration[6.0]
  def change
    add_reference :searches, :key_word, null: false, foreign_key: true
  end
end
