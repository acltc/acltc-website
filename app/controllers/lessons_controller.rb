class LessonsController < ApplicationController
  CATEGORIES = [
    { title: "Season 1: Becoming a Power User", icon: "icon-laptop2" },
    { title: "Season 2: Becoming a Programmer", icon: "icon-keyboard" }
  ].freeze
  
  LESSONS = [
    { title: "Episode 1 - Manage your programs!", time: "3:09", category_id: 0 },
    { title: "Episode 2 - Analyze your disk space!", time: "4:51", category_id: 0 },
    { title: "Episode 3 - Monitor your system!", time: "5:17", category_id: 0 },
    { title: "Episode 4 - Customize your system preferences!", time: "4:52", category_id: 0 },
    { title: "Episode 5 - Save time with keyboard shortcuts!", time: "5:41", category_id: 0 },
    
    { title: "Episode 1 - Intro to Ruby", time: "5:11", category_id: 1 },
    { title: "Episode 1a - Running Ruby: Things That Can Go Wrong", time: "5:27", category_id: 1 },
    { title: "Episode 2 - Code Flow: Top Down", time: "2:34", category_id: 1 },
    { title: "Episode 3 - Code Flow: Left to Right", time: "4:45", category_id: 1 },
    { title: "Episode 4 - Strings", time: "2:37", category_id: 1 },
    { title: "Episode 4a - Things That Can Go Wrong With Strings", time: "3:10", category_id: 1 },
    { title: "Episode 5 - Intro to Methods", time: "4:28", category_id: 1 },
    { title: "Episode 6 - Variables", time: "4:38", category_id: 1 },
    { title: "Episode 6a - Things That Can Go Wrong With Variables", time: "2:37", category_id: 1 },
    { title: "Episode 7 - More About Variables", time: "3:06", category_id: 1 },
    { title: "Episode 8 - User Input", time: "5:46", category_id: 1 },
    { title: "Episode 8a - More About User Input", time: "2:37", category_id: 1 },
    { title: "Episode 8b - Things That Can Go Wrong With User Input", time: "2:33", category_id: 1 },
    { title: "Episode 8c - Synthesis: Strings, Variables, and User Input", time: "4:28", category_id: 1 },
    { title: "Episode 9 - Intro to Conditionals", time: "4:58", category_id: 1 },
    { title: "Episode 9a - Things That Can Go Wrong With Conditionals", time: "3:20", category_id: 1 },
    { title: "Episode 10 - Naming Variables", time: "3:30", category_id: 1 },
    { title: "Episode 11 - Conditionals: Else", time: "5:21", category_id: 1 },
    { title: "Episode 12 - Conditionals: Elsif", time: "7:40", category_id: 1 },
    { title: "Episode 12a - Synthesis: Variables, User Input, and Conditionals", time: "6:13", category_id: 1 },
    { title: "Episode 12b - More About Conditionals", time: "2:58", category_id: 1 },
    { title: "Episode 13 - Loops", time: "7:24", category_id: 1 },
    { title: "Episode 13a - Code Flow With Loops", time: "2:21", category_id: 1 },
    { title: "Episode 13b - Synthesis: Variables, Conditionals, and Loops", time: "6:07", category_id: 1 },
    { title: "Episode 13c - Things That Can Go Wrong With Loops", time: "2:06", category_id: 1 },
    { title: "Episode 14 - Indentation", time: "2:55", category_id: 1 },
    { title: "Episode 15 - Arrays", time: "6:48", category_id: 1 },
    { title: "Episode 16 - Reading Documentation", time: "12:10", category_id: 1 },
    { title: "Episode 17 - The Each Method", time: "7:42", category_id: 1 },
    { title: "Episode 17a - Synthesis: Arrays Plus More", time: "6:43", category_id: 1 },
    { title: "Episode 18 - Hashes", time: "9:24", category_id: 1 }
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
    lesson = LESSONS[lesson_index]
    category_path = CATEGORIES[lesson[:category_id]][:title].parameterize
    @lesson_title = lesson[:title]
    render "/lessons/#{category_path}/#{params[:title]}"
  end
end
