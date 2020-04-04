# frozen_string_literal: true

class KeyWord < ApplicationRecord
  
    has_many :job_key_words, dependent: :destroy
    has_many :key_words, through: :job_key_words
  
    validates :tag, :created_at, :updated_at, presence: true
  end