require "rails_helper"

RSpec.describe KeyWord do
  describe "associations" do
    it { is_expected.to have_many(:job_key_words).dependent(:destroy) }
    it { is_expected.to have_many(:jobs).through(:job_key_words) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:tag) }
  end
end 