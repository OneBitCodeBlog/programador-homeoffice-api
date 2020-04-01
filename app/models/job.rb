class Job < ApplicationRecord
  enum contract: %i[not_specified clt pj clt_or_pj]
  
  has_many :job_key_words, dependent: :destroy
  has_many :key_words, through: :job_key_words
  
  validates :title, :description, :job_link, :published_date, presence: true
end
