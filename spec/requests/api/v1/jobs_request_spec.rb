require "rails_helper"

RSpec.describe "Jobs", type: :request do
  describe "GET #index" do
    subject(:index) { get api_v1_jobs_url }

    let!(:job) do
      create(:job).tap do |job|
        create(:job_key_word, job: job)
      end
    end

    let(:parsed_response) { JSON.parse(response.body) }
    let(:response_body) do
      JSON.parse(JobSerializer.new(job).to_json)
    end

    it "responds with 200" do
      index

      expect(response).to have_http_status :ok
    end

    it "responds with json" do
      index

      expect(parsed_response).to match_array [response_body]
    end
  end

  describe "GET #show"
end
