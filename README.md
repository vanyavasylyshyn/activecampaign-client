# ![tempo-ruby - 💎 Ruby gem for the 🕛 Tempo REST API :3](https://i.ibb.co/0f1pwBb/A4-1-4.png)

# Tempo API Gem

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tempo-ruby'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install tempo-ruby

## Usage

### Example

```ruby
require 'rubygems'
require 'tempo-ruby'

options = {
  auth_type: :api_key,
  api_key:   'your_tempo_api_key'
}

client       = Tempo::Client.new(options)
teams        = client.Team.all
team_members = teams.first.members
```

#### Configuration options

TODO: Document options

#### More Examples

TODO: More examples with more CRUDs

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Roadmap

#### Version 0.1.0
- [x] Ability to use API key
- [x] README file with example

#### Version 0.2.0
- [ ] Base read CRUD(for another mine project)
- [ ] Full Teams CRUD
- [ ] Well documented README file

#### Refactoring
- [ ] Enabled disabled fasterer checks
- [ ] Refactor Tempo::Base class
- [ ] Enabled reek checks
- [ ] Enable disabled rubocop checks
- [ ] Increase specs coverage
- [ ] Clean project from unused functionality


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tempo-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/tempo-ruby/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Tempo API Client project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tempo-ruby/blob/main/CODE_OF_CONDUCT.md).
