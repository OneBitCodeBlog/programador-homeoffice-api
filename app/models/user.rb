# frozen_string_literal: true

class User < ApplicationRecord
  has_many :searchs, dependent: :destroy
  has_many :key_words, through: :searchs
  validates :name, presence: true
end
