# frozen_string_literal: true

class Representative < ApplicationRecord
    has_many :news_items, dependent: :delete_all

    def self.civic_api_to_representative_params(rep_info)
        reps = []

        rep_info.officials.each_with_index do |official, index|
            ocdid_temp = ''
            title_temp = ''

            rep_info.offices.each do |office|
                if office.official_indices.include? index
                    title_temp = office.name
                    ocdid_temp = office.division_id
                end
            end

            rep_photo = if official.respond_to?(:photoUrl)
                            official.photoUrl
                        else
                            'download.png'
                        end
            rep_address = if official.address
                              official.address[0]
                          else
                              JSON.parse({
                                  line1: 'N/A',
                                  state: ' ',
                                  city:  ' ',
                                  zip:   ' '
                              }.to_json, object_class: OpenStruct)
                          end

            if Representative.exists?(name: official.name, ocdid: ocdid_temp, title: title_temp)
                rep = Representative.find_by(name: official.name, ocdid: ocdid_temp, title: title_temp)
            else
                rep = Representative.create!({ name: official.name, ocdid: ocdid_temp,
                    title: title_temp, party: official.party, address: rep_address.line1,
                    state: rep_address.state, city: rep_address.city, zip: rep_address.zip,
                    photo: rep_photo })
            end

            reps.push(rep)
        end

        reps
    end

    def self.get_one_rep(rep_name)
        Representative.where(name: rep_name).first
    end
end
