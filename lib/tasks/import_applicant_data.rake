

namespace :acltc_website do

  desc 'Import applicant data from CSV to database'
  task :import_applicant_data => :environment do

    CSV.foreach('/tmp/application-responses.csv', :headers => true) do |row|
      Application.create(row.to_hash.slice(*%w[first_name last_name email phone location  current_occupation  primary_goals programming_experience  preferred_work_location capstone_idea work_concurrently tinker_example  why_better  address emergency_contact scholarship_applicant woman minority learn_about_scholarship why_scholarship created_at]))
    end

  end
end

