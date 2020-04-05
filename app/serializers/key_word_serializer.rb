class KeyWordSerializer < ActiveModel::Serializer
  attributes :id, :tag

  has_many :jobs
end
