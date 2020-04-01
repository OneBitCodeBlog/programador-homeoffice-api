class RemoveJobKeyWordFromSearch < ActiveRecord::Migration[6.0]
  def change
    remove_reference :searches, :job_key_word, null: false, foreign_key: true
  end
end
