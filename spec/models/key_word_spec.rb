# frozen_string_literal: true

require "rails_helper"

RSpec.describe Job do

  describe "validations" do
    it { is_expected.to validate_presence_of(:tag) }
    it { is_expected.to validate_presence_of(:created_at) }
    it { is_expected.to validate_presence_of(:updated_at) }
  end

  describe "associations" do
    it { is_expected.to have_many(:job_key_words).dependent(:destroy) }
    it { is_expected.to have_many(:jobs).through(:job_key_words) }
  end

end