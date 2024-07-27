require './lib/main'
require 'rspec'

describe 'Van Gogh Paintings Parser' do

    before do
        output_file = './files/extracted-output.json'
        input_file = './files/van-gogh-paintings.html'

        File.delete(output_file) if File.exist?(output_file)

        extracted = run_extractor(input_file)
        read_result = File.read(output_file)
       
        @result = JSON.parse(read_result)
        @first_painting = @result['artworks'][0]
        @painting_no_year_or_img = @result['artworks'][16]
    end 

    it 'run_extractor extracts details correctly' do
        read_expected = File.read('./files/expected-array.json')
        expected_results = JSON.parse("{#{read_expected}}")
    
        expect(@result).to eq(expected_results)
    end 

    it '@result' do
        expect(@result).to be_a(Hash)
        expect(@result).to_not be_empty
    end 

    it 'artworks' do
        expect(@result['artworks']).to be_a(Array)
        expect(@result['artworks']).to_not be_empty
    end 

    it 'artworks - name' do
        expect(@first_painting['name']).to be_a(String)
        expect(@first_painting['name']).to_not be_empty
    end 

    it 'artworks - extensions' do
        expect(@first_painting['extensions']).to be_a(Array)
        expect(@first_painting['extensions']).to_not be_empty
    end 

    it 'artworks - no extensions' do
        expect(@painting_no_year_or_img).to_not include(:extensions)
    end 

    it 'artworks - link' do
        expect(@first_painting['link']).to be_a(String)
        expect(@first_painting['link']).to_not be_empty
    end 

    it 'artworks - image' do
        expect(@first_painting['image']).to be_a(String)
        expect(@first_painting['image']).to_not be_empty
    end

    it 'artworks - no image' do
        expect(@painting_no_year_or_img['image']).to be_nil
    end
end 