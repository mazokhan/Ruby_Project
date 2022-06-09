require_relative("./lib/scraper.rb")
require_relative("./lib/cli.rb")

scraper = Scraper.new
cli = CLI.new(facts: scraper.facts)
cli.start!
