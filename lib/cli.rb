class CLI
  attr_reader :facts

  def initialize(facts:)
    @facts = facts
  end

  def start!
    loop do
      options = get_options
      facts_to_show = get_facts_to_show(options)
      display_facts(facts_to_show)

      should_exit = ask_if_should_exit
      if should_exit == true
        break
      end
    end
  end

  def ask_if_should_exit
    puts "\ndo you want to see more facts? (Y/N)"
    gets.chomp.upcase == "N"
  end

  def get_options
    puts "\nHow many dog facts do you want?"
    count = gets.chomp.to_i

    puts "\nDo you want them in random order? (Y/N)"
    random = gets.chomp.upcase == "Y"

    {
      count: count, random: random
    }
  end

  def get_facts_to_show(options)
    facts_to_show = facts
    if options[:random]
      facts_to_show = facts_to_show.shuffle
    end

    facts_to_show.first(options[:count])
  end

  def display_facts(facts_to_show)
    puts "\n"
    facts_to_show.each.with_index do |fact_to_show, index|
      puts "#{index + 1}) #{fact_to_show}"
    end
  end
end
