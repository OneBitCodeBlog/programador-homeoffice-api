# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :contract
      t.string :job_link
      t.integer :salary
      t.string :company_name
      t.date :published_date

      t.timestamps
    end
  end
end
