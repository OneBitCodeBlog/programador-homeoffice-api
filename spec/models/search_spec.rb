require "rails-helper"

RSpec.describe Search do
  describe "associations" do
    it { is_expected.to belongs_to(:user) }
    it { is_expected.to belongs_to(:key_word) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:alarm_rate) }
  end
end
