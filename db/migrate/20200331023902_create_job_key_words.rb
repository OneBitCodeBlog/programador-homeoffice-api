class CreateJobKeyWords < ActiveRecord::Migration[6.0]
  def change
    create_table :job_key_words do |t|
      t.references :job
      t.references :key_word

      t.timestamps
    end
  end
end
