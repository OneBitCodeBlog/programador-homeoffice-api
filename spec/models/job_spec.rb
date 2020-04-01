# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Job do
  describe 'when have validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:job_link) }
    it { is_expected.to validate_presence_of(:published_date) }
  end

  describe 'when have associations' do
    it { is_expected.to have_many(:job_key_words).dependent(:destroy) }
    it { is_expected.to have_many(:key_words).through(:job_key_words) }
  end

  describe 'when have enums' do
    it { expect(Job.new(contract: 0)).to be_not_specified }
    it { expect(Job.new(contract: 1)).to be_clt }
    it { expect(Job.new(contract: 2)).to be_pj }
    it { expect(Job.new(contract: 3)).to be_clt_or_pj }
  end
end
