# frozen_string_literal: true

class Representative < ApplicationRecord
    has_many :news_items, dependent: :delete_all

    def self.civic_api_to_representative_params(rep_info)
        reps = []
        rep_info = JSON.parse(rep_info)
        rep_info["officials"].each_with_index do |official, index|
            ocdid_temp = ''
            title_temp = ''

            rep_info["offices"].each do |office|
                if office["officialIndices"].include? index
                    title_temp = office["name"]
                    ocdid_temp = office["divisionId"]
                end
            end
          
            rep_address = official["address"][0]["line1"] + ", " + official["address"][0]["city"]+ ", " + official["address"][0]["state"] + ", " + official["address"][0]["zip"]

            rep = Representative.create!({ name: official["name"], ocdid: ocdid_temp,
                title: title_temp, party: official["party"], address: rep_address, 
                photo: official["photoUrl"]})
            reps.push(rep)
        end

        reps
    end
  
    def self.get_one_rep(rep_name)
      Representative.where(name: rep_name)
    end
end
