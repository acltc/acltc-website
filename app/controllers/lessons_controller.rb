class LessonsController < ApplicationController
  CATEGORIES = [
    { title: "Phase 0: Computer Literacy", icon: "icon-laptop2" },
    { title: "Phase 1: Computer Programming", icon: "icon-keyboard" },
    { title: "Phase 2: Computer Masters", icon: "icon-keyboard" }
  ].freeze
  
  LESSONS = [
    { title: "Manage your programs!", time: "3:09", category_id: 0 },
    { title: "Analyze your disk space!", time: "4:51", category_id: 0 },
    { title: "Monitor your system!", time: "5:17", category_id: 0 },
    { title: "Customize your system preferences!", time: "4:52", category_id: 0 },
    { title: "Save time with keyboard shortcuts!", time: "5:41", category_id: 0 },
    { title: "Intro to Ruby", time: nil, category_id: 1 },
    { title: "Variables", time: nil, category_id: 1 },
    { title: "Objects and Classes", time: nil, category_id: 1 },
    { title: "Methods", time: nil, category_id: 1 }
  ].freeze
  
  def index
    @categories = CATEGORIES.each_with_index.map do |category, index|
      {
        title: category[:title],
        icon: category[:icon],
        lessons: LESSONS.select { |lesson| lesson[:category_id] == index }
      }
    end
  end

  def show
    lesson_index = LESSONS.index { |lesson| params[:title] == lesson[:title].parameterize }
    lesson_links = LESSONS.map do |lesson|
      { text: lesson[:title], href: "/tutorial/lessons/#{lesson[:title].parameterize}" }
    end
    index_link = { text: "All lessons", href: "/tutorial/lessons" }
    lesson_links = [index_link] + lesson_links + [index_link]
    @previous_link = lesson_links[1 + lesson_index - 1]
    @next_link = lesson_links[1 + lesson_index + 1]
    @next_lessons = LESSONS[(lesson_index + 1)..-1].map do |lesson|
      {
        text: lesson[:title],
        href: lesson[:title].parameterize,
        time: lesson[:time],
        icon: CATEGORIES[lesson[:category_id]][:icon]
      }
    end
    render params[:title]
  end
end
