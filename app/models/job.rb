class Job < ApplicationRecord
  validates_presence_of :title, :description,
                        :job_link, :published_date

  has_many :job_key_words, dependent: :destroy
  has_many :key_words, through: :job_key_words
end
