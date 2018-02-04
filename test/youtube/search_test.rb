require 'test_helper'

class YouTube::SearchTest < Minitest::Test
  def test_search_method
    @api_key = ''
    File.open(".env", "r") do |f|
      f.each_line do |line|
        @api_key = line
      end
    end

    search = YouTube::Search.new(@api_key)
    search.first_page!

    result = search.get_search_items("penguin")
    assert_match /penguin/i, result.first.title
    assert_includes result.first.description.downcase, 'penguin'
  end
end
