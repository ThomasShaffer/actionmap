require 'rails_helper'
require 'spec_helper'

describe Representative do 
  describe 'parses representatives info from the Google Civics API' do 
    before :each do 
      @fake_data = ActiveSupport::JSON.encode({"officials" => [
                        {"name" => "Frank"},
                        {"name"=> "John"}],
                    "offices"=> [
                      {
                        "name"=> "one",
                        "divisionId"=> "four",
                        "officialIndices"=> [
                          1, 2, 3
                        ]
                      }
                    ]})
    end
    it 'creates new representative instances' do 
      curr = Representative.count
      Representative.civic_api_to_representative_params(@fake_data)
      expect(Representative.count).to be > curr
    end
    it 'returns a list of representatives' do 
      lst = Representative.civic_api_to_representative_params(@fake_data)
      expect(lst).to be_instance_of(Array)
      expect(lst[0]).to be_instance_of(Representative)
    end
  end
end