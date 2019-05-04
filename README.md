# TableView

Writing this before I'm writing code. Likely to progress very slowly in this vision.

The aim of this project is to create a way of describing tabular data to be viewed in various ways, primarily from a rails project (so it might be an engine, but it might just require rails).

The word `View` is probably a bit confusing given the rails context. Yes it might be a rails view, but it also might not. The aim here isn't to produce something that only outputs as the result of a a controller action, but rather something can output as the result of a controller action, but could also asynchronously produce a result - after a while. But these should be just as easy to generate from a script / console as from a web request. However, this is a view of some data, and typically (though not exclusively I guess) your models.
 
The aim is to be able to describe something that might have:

* synchronous (for immediate output/display/download) or asychronous (converting seamlessly to an ActiveJob) modes. 
* paginated (page=2) or not (get me everything)
* ordering may be specified (and yet there's a way to run this without using all the memory in the world. This is fun in a rails context: find_each is not possible)
* output format: could be csv, could be json, could be html, could be xls, could be (how?) a googlesheet, could be an array (particularly useful for scripts, and for unforseen usages)
* personalization somehow (I'm not interested in some of these columns, don't show me)
* access control somehow (I'm not allowed to see some of these columns, don't show me)

And the notion of "View" still stands: how do you select your ordering? your output format? We don't know and don't care -- that's the job of your controller (in the widest possible sense) to sort out. it's just part of the API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'table_view'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install table_view

## Usage


### Possible now

#### 1. Define your TableView (e.g. at app/table_views/my_table_view)

```ruby
  class MyTableView < TableView::Base
    # likely to change a lot
     def initialize(somethings) 
      @somethings = somethings  
    end
    
    # headers must be ruby identifiers -- lower_snake_case
    def headers
      %w[one two three]
    end
    
    def each_row
      @somethings.each do |something|
        yield [
          @something.one,
          @something.two,
          @something.three
          ]
      end
    end
  end
```

#### 2. Use your table view

```ruby
mtv = MyTableView.new(Something.some_scope) # probably will need to change to new(:some_scope) to allow for activejob
mtv.write_csv(filename)
mtv.as_csv # => string
mtv.as_array # => array of arrays
```

### Possible in the future 

TODO: need to sketch how will work in the future

* a dsl to specify fields -- to_s for headers, send for each_row
* a mechanism to specify initialization to work for async (to_global_id, or serialize/marshall)
* a mechanism to specify pagination, ordering

```ruby
mtv = MyTableView.new(Something.some_scope) # probably will need to change to new(:some_scope) to allow for activejob
mtv.output(defined_output).perform_later # ? creates ActiveJob and performs it later, how is the output defined?
mtv.as_json
mtv.as_html # will need some definition of formatting/wrapping for row e.g `def format_row(ary)` or better a partial (which is given hash (row data by headers)) 
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/timdiggins/table_view. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/timdiggins/table_view/blob/master/CODE_OF_CONDUCT.md).


## Releasing

```bash
  bundle install gem-release
  gem bump
  gem release -pt
```
## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TableView project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/timdiggins/table_view/blob/master/CODE_OF_CONDUCT.md).
