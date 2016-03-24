

namespace :acltc_website do

  desc 'Import applicant data from CSV to database'
  task :import_applicant_data => :environment do

    s3 = Aws::S3::Resource.new(
      region: 'us-west-2',
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    )

    csv_file = s3.bucket(ENV['S3_BUCKET_TITLE']).object('application-responses.csv').get

    CSV.foreach(csv_file , :headers => true) do |row|
      Application.create(row.to_hash.slice(*%w[first_name last_name email phone location  current_occupation  primary_goals programming_experience  preferred_work_location capstone_idea work_concurrently tinker_example  why_better  address emergency_contact scholarship_applicant woman minority learn_about_scholarship why_scholarship created_at]))
    end

  end
end
