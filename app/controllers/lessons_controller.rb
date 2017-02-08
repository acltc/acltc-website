class LessonsController < ApplicationController
  before_action :verify_subscriber, except: [:index]
  CATEGORIES = [
    { title: "Season 1: Becoming a Power User", icon: "icon-laptop2" },
    { title: "Season 2: Preparing Your Tools", icon: "icon-wrench" },
    { title: "Season 3: Becoming a Programmer", icon: "icon-keyboard" },
    { title: "Season 4: Object Oriented Programming", icon: "icon-keyboard" }
  ].freeze

  LESSONS = [
    { title: "Episode 1 - Manage Your Programs!", time: "3:09", category_id: 0 },
    { title: "Episode 2 - Analyze Your Disk Space!", time: "4:51", category_id: 0 },
    { title: "Episode 3 - Monitor Your System!", time: "5:17", category_id: 0 },
    { title: "Episode 4 - Customize Your System Preferences!", time: "4:52", category_id: 0 },
    { title: "Episode 5 - Save Time With Keyboard Shortcuts!", time: "5:41", category_id: 0 },

    { title: "Episode 1 - Text Editor: Installation", time_mac: "3:28", time_win: "2:22", category_id: 1 },
    { title: "Episode 2 - Text Editor: Basic Features", time_mac: "4:23", time_win: "5:02", category_id: 1 },
    { title: "Episode 3 - Command Line: Navigation", time_mac: "5:19", time_win: "5:10", category_id: 1 },
    { title: "Episode 4 - Command Line: Running Commands", time_mac: "4:39", time_win: "4:16", category_id: 1 },
    { title: "Episode 5 - Command Line: Installing Ruby", time_mac: nil, time_win: "3:13", category_id: 1 },

    { title: "Episode 1 - Intro to Ruby", time: "5:11", category_id: 2 },
    { title: "Episode 1a - Running Ruby: Things That Can Go Wrong", time: "5:27", category_id: 2 },
    { title: "Episode 2 - Code Flow: Top Down", time: "2:34", category_id: 2 },
    { title: "Episode 3 - Code Flow: Left to Right", time: "4:45", category_id: 2 },
    { title: "Episode 4 - Strings", time: "2:37", category_id: 2 },
    { title: "Episode 4a - Things That Can Go Wrong With Strings", time: "3:10", category_id: 2 },
    { title: "Episode 5 - Intro to Methods", time: "4:28", category_id: 2 },
    { title: "Episode 6 - Variables", time: "4:38", category_id: 2 },
    { title: "Episode 6a - Things That Can Go Wrong With Variables", time: "2:37", category_id: 2 },
    { title: "Episode 7 - More About Variables", time: "3:06", category_id: 2 },
    { title: "Episode 8 - User Input", time: "5:46", category_id: 2 },
    { title: "Episode 8a - More About User Input", time: "2:37", category_id: 2 },
    { title: "Episode 8b - Things That Can Go Wrong With User Input", time: "2:33", category_id: 2 },
    { title: "Episode 8c - Synthesis: Strings, Variables, and User Input", time: "4:28", category_id: 2 },
    { title: "Episode 9 - Intro to Conditionals", time: "4:58", category_id: 2 },
    { title: "Episode 9a - Things That Can Go Wrong With Conditionals", time: "3:20", category_id: 2 },
    { title: "Episode 10 - Naming Variables", time: "3:30", category_id: 2 },
    { title: "Episode 11 - Conditionals: Else", time: "5:21", category_id: 2 },
    { title: "Episode 12 - Conditionals: Elsif", time: "7:40", category_id: 2 },
    { title: "Episode 12a - Synthesis: Variables, User Input, and Conditionals", time: "6:13", category_id: 2 },
    { title: "Episode 12b - More About Conditionals", time: "2:58", category_id: 2 },
    { title: "Episode 13 - Loops", time: "7:24", category_id: 2 },
    { title: "Episode 13a - Code Flow With Loops", time: "2:21", category_id: 2 },
    { title: "Episode 13b - Synthesis: Variables, Conditionals, and Loops", time: "6:07", category_id: 2 },
    { title: "Episode 13c - Things That Can Go Wrong With Loops", time: "2:06", category_id: 2 },
    { title: "Episode 14 - Indentation", time: "2:55", category_id: 2 },
    { title: "Episode 15 - Arrays", time: "6:48", category_id: 2 },
    { title: "Episode 16 - Reading Documentation", time: "12:10", category_id: 2 },
    { title: "Episode 17 - The Each Method", time: "7:42", category_id: 2 },
    { title: "Episode 17a - Synthesis: Arrays Plus More", time: "6:43", category_id: 2 },
    { title: "Episode 18 - Hashes", time: "9:24", category_id: 2 },
    { title: "Episode 18a - Things That Can Go Wrong With Hashes", time: "11:02", category_id: 2},
    { title: "Episode 19 - How To Break Down A Problem", time: "29:30", category_id: 2},
    { title: "Episode 20 - Hashes As Objects", time: "8:38", category_id: 2},
    { title: "Episode 20a - Arrays of Hashes", time: "10:19", category_id: 2},
    { title: "Episode 21 - RubyGems", time: "5:19", category_id: 2},
    { title: "Episode 22 - API Gems", time: "12:18", category_id: 2},

    { title: "Episode 1 - Intro to OOP", time: "10:04", category_id: 3},
    { title: "Episode 2 - Arguments", time: "8:11", category_id: 3},
    { title: "Episode 2a - Multiple Arguments", time: "3:56", category_id: 3},
    { title: "Episode 2b - Methods: Things That Can Go Wrong", time: "5:44", category_id: 3},
    { title: "Episode 3 - Side Effects", time: "4:46", category_id: 3},
    { title: "Episode 4 - Instance Variables", time: "8:06", category_id: 3},
    { title: "Episode 4a - More About Return Values", time: "3:54", category_id: 3},
    { title: "Episode 4b - Idiomatic Ruby", time: "5:12", category_id: 3},
    { title: "Episode 5 - Constructors", time: "5:53", category_id: 3},
    { title: "Episode 6 - Methods Calling Methods", time: "3:28", category_id: 3},
    { title: "Episode 7 - Synthesis: Putting It All Together", time: "11:35", category_id: 3},
    { title: "Episode 8 - Converting Hashes To Objects", time: "7:41", category_id: 3}

  ].freeze

  def index
    @categories = CATEGORIES.each_with_index.map do |category, index|
      {
        title: category[:title],
        icon: category[:icon],
        lessons: LESSONS.select { |lesson| lesson[:category_id] == index }
      }
    end
    # Uses ip_address to see if the user has previously signed up?
    # If so, they can have access to the tutorials.
    if Subscriber.find_by(ip_address: request.remote_ip)
        @returning_subscriber = false
        # @returning_subscriber = true
    else
        @returning_subscriber = false
    end
  end

  def show
    # Find the current lesson based on the parameterized url
    lesson_index = LESSONS.index { |lesson| params[:title] == lesson[:title].parameterize }
    lesson = LESSONS[lesson_index]
    @lesson_title = lesson[:title]
    # Create the next and previous links
    lesson_links = LESSONS.map do |each_lesson|
      { text: each_lesson[:title], href: "/tutorial/lessons/#{each_lesson[:title].parameterize}" }
    end
    index_link = { text: "All lessons", href: "/tutorial/lessons" }
    lesson_links = [index_link] + lesson_links + [index_link]
    @previous_link = lesson_links[1 + lesson_index - 1]
    @next_link = lesson_links[1 + lesson_index + 1]
    # Create the links to the remaining lessons in the season
    # If it's the last episode in the season, create links for next season lessons
    remaining_lessons = LESSONS[(lesson_index + 1)..-1].select do |each_lesson|
      each_lesson[:category_id] == lesson[:category_id]
    end
    if remaining_lessons.length == 0
      remaining_lessons = LESSONS[(lesson_index + 1)..-1].select do |each_lesson|
        each_lesson[:category_id] == lesson[:category_id] + 1
      end
    end
    @next_lessons = remaining_lessons.first(4).map do |each_lesson|
      {
        text: each_lesson[:title],
        href: each_lesson[:title].parameterize,
        time: each_lesson[:time],
        time_mac: each_lesson[:time_mac],
        time_win: each_lesson[:time_win],
        icon: CATEGORIES[each_lesson[:category_id]][:icon]
      }
    end
    category_path = CATEGORIES[lesson[:category_id]][:title].parameterize
    render "/lessons/#{category_path}/#{params[:title]}"
  end
end
