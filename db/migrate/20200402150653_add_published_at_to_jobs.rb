class AddPublishedAtToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :published_at, :string
  end
end
