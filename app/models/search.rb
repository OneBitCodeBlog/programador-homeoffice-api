# frozen_string_literal: true

class Search < ApplicationRecord
  belongs_to :user
  belongs_to :key_word

  validates_presence_of :alarm_rate
end
