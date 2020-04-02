require "rails_helper"

RSpec.describe JobKeyWord do
  describe "associations" do
    it { is_expected.to belong_to(:job) }
    it { is_expected.to belong_to(:key_word) }
  end
end
