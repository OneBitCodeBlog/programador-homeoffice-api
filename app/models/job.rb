class Job < ApplicationRecord
  validates_presence_of :title, :description,
                        :job_link, :published_date

  has_many :job_key_words, dependent: :destroy
  has_many :key_words, through: :job_key_words

  enum contract: {
    not_specified: 0,
    CLT: 1,
    PJ: 2,
    CLT_or_PJ: 3
  }
end
