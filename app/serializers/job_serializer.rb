class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :contract,
             :job_link, :salary, :company_name, :published_date

  has_many :job_key_words
  has_many :key_words
end
