class Job < ApplicationRecord
  has_many :job_key_words, dependent: :destroy
  has_many :key_words, through: :job_key_words

  validates :title, :description, :job_link, :published_date, presence: true
end
