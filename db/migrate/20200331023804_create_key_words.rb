class CreateKeyWords < ActiveRecord::Migration[6.0]
  def change
    create_table :key_words do |t|
      t.string :tag

      t.timestamps
    end
  end
end
