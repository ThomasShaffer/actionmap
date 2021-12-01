# frozen_string_literal: true

require 'google/apis/civicinfo_v2'

require 'rails_helper'
require 'spec_helper'

describe Representative do
    Civicinfo = Google::Apis::CivicinfoV2
    new_service = Civicinfo::CivicInfoService.new
    new_service.key = 'AIzaSyAWntPepjpiqTePfHuyTX2J3LcDnEh8izI'
    it 'test whether or not representative records get duplicated' do
        @fake_data = new_service.representative_info_by_address(address: '2322 Haste St., Berkeley, CA')
        Representative.civic_api_to_representative_params(@fake_data)
        total = Representative.count
        Representative.civic_api_to_representative_params(@fake_data)
        other_total = Representative.count
        expect(total).to eq other_total
    end
    it 'tests if records get added' do
        @fake_CA_data = new_service.representative_info_by_address(address: '2322 Haste St., Berkeley, CA')
        @fake_PA_data = new_service.representative_info_by_address(address: '2378 Corinna Ct., State College, PA')
        Representative.civic_api_to_representative_params(@fake_CA_data)
        total = Representative.count
        Representative.civic_api_to_representative_params(@fake_PA_data)
        other_total = Representative.count
        expect(total).not_to eq other_total
    end

    it 'returns a list of representatives' do
        @fake_data = new_service.representative_info_by_address(address: '2322 Haste St., Berkeley, CA')
        lst = Representative.civic_api_to_representative_params(@fake_data)
        expect(lst).to be_instance_of(Array)
        expect(lst[0]).to be_instance_of(Representative)
    end
end
