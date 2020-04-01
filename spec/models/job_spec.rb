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

  describe "enums" do
    it { expect(Job.new(contract: 0)).to be_not_specified }
    it { expect(Job.new(contract: 1)).to be_CLT }
    it { expect(Job.new(contract: 2)).to be_PJ }
    it { expect(Job.new(contract: 3)).to be_CLT_or_PJ }
  end
end
