require 'mechanize'
require 'json'

class Scraper

  URL = "http://dog-api.kinduff.com/api/facts"

  attr_reader :facts

  def initialize(limit: 100)
    @facts = get_facts(limit: limit)
  end

  def open_link(link)
    Mechanize.new.get(link).body
  end

  def get_facts(limit:)
    json_text = open_link("#{URL}?number=#{limit}")
    JSON.parse(json_text)["facts"]
  end
end
