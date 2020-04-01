# frozen_string_literal: true

class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :alarm_rate
      t.references :key_word, null: false, foreign_key: true

      t.timestamps
    end
  end
end
