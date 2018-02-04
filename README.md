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

API_KEY needed.

Include a .env file in the root of the project directory and add your YouTube API Key in plain text aka without "", '', or backticks


## IN DEVELOPMENT ENVIRONMENT use dotenv-rails gem or 
explicitly define api key argument for initialization and read from file

```rb
@api_key = ''
File.open(".env", "r") do |f|
  f.each_line do |line|
    @api_key = line
  end
end
```

TODO: Describe how to get a YouTube API key.

```rb
search = YouTube::Search.new(ENV["API_KEY"])
search.first_page!

search.get_search_items("penguins").first.title
# => "Crazy penguin HD"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/LARailsLearners/youtube-search.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

