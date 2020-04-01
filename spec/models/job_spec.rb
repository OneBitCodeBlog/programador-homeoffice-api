require "rails_helper"

RSpec.describe Job do
  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:job_link) }
    it { is_expected.to validate_presence_of(:published_date) }
  end

  describe "associations" do
    it { is_expected.to have_many(:job_key_words).dependent(:destroy) }
    it { is_expected.to have_many(:key_words).through(:job_key_words) }
  end
end
