require "httparty"

require "youtube/search/version"
require "youtube/search/search_items"
require "youtube/search/http_error"

module YouTube
  class Search
    include HTTParty
    base_uri 'https://www.googleapis.com'

    def initialize(search_word)
      @search_word = search_word
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

    def get_search_items
      SearchItems.new(search_response).items
    end

    def first(pages = 1)
      save = []
      first_page!
      save += get_search_items
      (pages - 1).times do
        next_page!
        save += get_search_items
      end
      save
    end

  private

    def search_response
      res = self.class.get(path, query: params)
      if res.success?
        @result = res
      elsif res.client_error?
        raise HTTPError, res.to_s
      else
        raise HTTPError, res.inspect
      end
    end

    def path
      '/youtube/v3/search'
    end

    def params
      {
        part: 'snippet',
        q: @search_word,
        pageToken: @page_token,
        key: ENV['YOUTUBE_API_KEY']
      }
    end
  end
end
