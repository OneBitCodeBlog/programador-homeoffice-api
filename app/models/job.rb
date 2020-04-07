# frozen_string_literal: true

class Job < ApplicationRecord
  enum contract: %i[not_specified clt pj clt_or_pj]

  has_many :job_key_words, dependent: :destroy
  has_many :key_words, through: :job_key_words

  validates :title, :job_link, :published_at, presence: true
end
