class CreateLakewoodApplications < ActiveRecord::Migration
  def change
    create_table :lakewood_applications do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :hangouts_email
      t.string :phone
      t.string :address
      t.string :emergency_contact
      t.string :location
      t.text :learn_about_acltc
      t.text :learn_about_acltc_specify
      t.text :primary_goals
      t.text :proficiency_with_computers_and_technology
      t.text :programming_experience
      t.text :current_occupation
      t.string :preferred_work_location
      t.text :work_concurrently
      t.text :why_better
      t.text :tinker_example
      t.text :dreams_and_goals
      t.text :how_will_you_achieve_goals
      t.text :capstone_idea
      t.text :why_are_you_the_perfect_candidate
      t.string :status
      t.string :cohort
      t.text :notes
      t.boolean :scholarship_applicant
      t.text :learn_about_scholarship
      t.boolean :woman
      t.boolean :minority
      t.text :why_scholarship      

      t.timestamps null: false
    end
  end
end
