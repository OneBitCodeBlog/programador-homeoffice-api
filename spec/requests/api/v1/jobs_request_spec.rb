require "rails_helper"

RSpec.describe "Jobs", type: :request do
  describe "GET #index" do
    subject(:index) { get api_v1_jobs_url }

    before do
      job
      index
    end

    shared_examples "request index" do
      it "responds with 200" do
        expect(response).to have_http_status :ok
      end
  
      it "responds with json" do
        expect(parsed_response["data"].first["attributes"].keys)
          .to match_array json_attributes
      end
  
      it "shows links for pagination" do
        expect(parsed_response["links"].keys).to match_array json_links
      end
    end

    let(:job) do
      create(:job).tap do |job|
        create(:job_key_word, job: job)
      end
    end

    let(:parsed_response) { JSON.parse(response.body) }
    let(:job_attributes) { job.attributes }
    let(:json_links) { %w[self first prev next last] }
    let(:json_attributes) do
      %w[
        title
        description
        contract
        job-link
        salary
        company-name
        published-date
      ]
    end

    include_examples "request index"

    context "with pagination params" do
      subject(:index) do
        get api_v1_jobs_url, params: { page: { number: 1, size: 1 } }
      end

      include_examples "request index"
    end
  end

  describe "GET #show"
end
