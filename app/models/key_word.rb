# frozen_string_literal: true

class KeyWord < ApplicationRecord
  validates_presence_of :tag

  has_many :job_key_words, dependent: :destroy
  has_many :jobs, through: :job_key_words
  has_many :searches, dependent: :destroy
  has_many :users, through: :searches
end
