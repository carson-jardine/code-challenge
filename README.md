# Extract Van Gogh Paintings Code Challenge

## Description

The purpose of this project is to extract a list of Van Gogh paintings from a local HTML page and export a transformed list to a JSON file. The list is expected to extract the painting `name`, `extensions`, Google `link`, and thumbnail `image` present in the result page.

![Van Gogh paintings](https://github.com/serpapi/code-challenge/blob/master/files/van-gogh-paintings.png?raw=true "Van Gogh paintings")

This Ruby project uses Nokogiri to parse HTML and RSpec for testing.

## How to Run

Clone the repository `git clone {repo link}`
Install gems with `bundle install`
Run tests with `rspec` or `bundle exec rspec` or `rspec spec/main_spec.rb`
Debug results by adding `binding.pry` to areas of interest and rerunning tests
