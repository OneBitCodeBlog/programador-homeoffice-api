# frozen_string_literal: true

class JobKeyWord < ApplicationRecord
  belongs_to :job
  belongs_to :key_word
end
