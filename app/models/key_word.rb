# frozen_string_literal: true

class KeyWord < ApplicationRecord
    enum contract: %i[not_specified clt pj clt_or_pj]
  
    has_many :job_key_words, dependent: :destroy
    has_many :key_words, through: :job_key_words
  
    validates :tag, :created_at, :updated_at, presence: true
  end