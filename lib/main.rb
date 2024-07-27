require 'json'
require 'nokogiri'
require 'pry'

    def get_image_source(html)
        images = {}

        html.inner_html.scan(/_setImagesSrc.+?var s=\'(.*?)\'.*?var ii=\[\'(.*?)\'/) do |source, id|
            images[id] = source.gsub("\\", "")
        end

        return images
    end

    def extract_data(input_file)
        paintings = []
        html = Nokogiri::HTML5(input_file)
        image_source = get_image_source(html)
        host = "https://www.google.com"

        html.css('.klitem').each do |painting|
            new_hash = {}
            extensions = painting.css('div.ellip.klmeta').map(&:text)

            new_hash['name'] = painting.attr('aria-label')
            new_hash['extensions'] = extensions unless extensions.empty?
            new_hash['link'] = "#{host}#{painting.attr('href')}"
            new_hash['image'] = image_source[painting.css('img').attr('id').value]
        
            paintings.push(new_hash)
        end

        return JSON.pretty_generate({
            "artworks": paintings
        })
    end

    def run_extractor(input_file)
        result = extract_data(File.read(input_file))
        File.write('files/extracted-output.json', result)
    end 