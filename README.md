# Youtube::Search

Welcome to our new gem! You can get search result from YouTube in your Ruby code.

TODO: Publish it as a gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'youtube-search', git: 'https://github.com/LARailsLearners/youtube-search.git'
```

And then execute:

    $ bundle

## Usage

YOUTUBE_API_KEY needed.

TODO: Describe how to get a YouTube API key.

```rb
search = YouTube::Search.new("penguin")
search.first_page!

search.get_search_items.first.title
# => "Crazy penguin HD"
```

## Development

Here's a [demo app](https://github.com/LARailsLearners/youtube-search-example) we have for `youtube-search`. You can also contribute there too!

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/LARailsLearners/youtube-search.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

