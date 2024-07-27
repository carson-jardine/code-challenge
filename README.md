# Extract Van Gogh Paintings Code Challenge

## Description

The purpose of this project is to extract a list of Van Gogh paintings from a local HTML page and export a transformed list to a JSON file. The list is expected to extract the painting `name`, `extensions`, Google `link`, and thumbnail `image` present in the result page.

![Van Gogh paintings](https://github.com/serpapi/code-challenge/blob/master/files/van-gogh-paintings.png?raw=true "Van Gogh paintings")

This Ruby project uses Nokogiri to parse HTML and RSpec for testing.

## How to Run

- Clone the repository using `SSH`: `git clone git@github.com:carson-jardine/code-challenge.git`
- Install gems with `bundle install`
- Run tests with `rspec` or `bundle exec rspec` or `rspec spec/main_spec.rb`
- Debug results by adding `binding.pry` to areas of interest and rerunning tests

## Notes

This is the first time I've used Ruby in this way and it was definitely a challenge! Especially when it came to finding and parsing the thumbnail images. Overall, it was an enjoyable project where I learned a lot. Thank you for taking the time to review my work, I hope you have a great day!
