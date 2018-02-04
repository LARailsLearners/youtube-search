require "httparty"
require "youtube/search/search_items"
require "youtube/search/search_item"

module YouTube
  class Search
    include HTTParty
    base_uri 'https://www.googleapis.com'

    attr_accessor :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    # set pageToken value for the first page of search result
    def first_page!
      @page_token = ''
    end

    # set pageToken value for the next page
    def next_page!
      @page_token = @result["nextPageToken"] if @result
    end

    # set pageToken value for the previous page
    def previous_page!
      @page_token = @result["prevPageToken"]
    end

    def get_search_items(search_word)
      SearchItems.new(search_response(search_word)).items
    end

    def first(pages = 1, search_word)
      save = []
      first_page!
      save += get_search_items(search_word)
      (pages - 1).times do
        next_page!
        save += get_search_items(search_word)
      end
      save
    end

  private

    def search_response(search_word)
      @result = self.class.get(path, query: params(search_word))
    end

    def path
      '/youtube/v3/search'
    end

    def params(search_word)
      {
        part: 'snippet',
        q: search_word,
        pageToken: @page_token ||= '',
        key: @api_key
      }
    end
  end
end
