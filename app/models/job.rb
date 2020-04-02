# frozen_string_literal: true

class Job < ApplicationRecord
  enum contract: {
    not_specified: 0,
    clt: 1,
    pj: 2,
    clt_or_pj: 3
  }

  has_many :job_key_words, dependent: :destroy
  has_many :key_words, through: :job_key_words

  validates :title, :description, :job_link, :published_date, presence: true
end
