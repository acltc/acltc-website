FieldOfInterest.create(name: "Ruby")
FieldOfInterest.create(name: "Rails")
FieldOfInterest.create(name: "Python")
FieldOfInterest.create(name: "NodeJS")
FieldOfInterest.create(name: "AngularJS")
FieldOfInterest.create(name: "Express.js")
FieldOfInterest.create(name: "JavaScript")
FieldOfInterest.create(name: "JQuery")
FieldOfInterest.create(name: "HTML")
FieldOfInterest.create(name: "CSS")
FieldOfInterest.create(name: "MongoDB")
FieldOfInterest.create(name: "Git")

50.times do
  interview_id = Interview.find(Interview.pluck(:id).shuffle.first)
  Application.create!([
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address,
    emergency_contact: Faker::PhoneNumber.phone_number,
    location: ["Chicago", "New York City", "San Francisco"].sample,
    learn_about_acltc: ["Course Report", "Quora", "Switchup", "Google Search", "Meetup", "Referral", "Skilledup", "Thinkful", "Word of Mouth", "Other"].sample,
    primary_goals: Faker::Lorem.paragraph(3),
    programming_experience: Faker::Lorem.paragraph(2),
    current_occupation: Faker::Lorem.paragraph,
    preferred_work_location: Faker::Address.city,
    work_concurrently: Faker::Lorem.paragraph(2),
    why_better: Faker::Lorem.paragraph(3),
    tinker_example: Faker::Lorem.paragraph,
    interview_id: interview_id,
    hangouts_email: Faker::Internet.email
  ])
end

