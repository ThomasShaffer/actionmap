# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
require 'task_helpers/state_fips_task_helper'

describe StateFipsTaskHelper do
    describe 'testing methods execute without error' do
        it 'calls update successfully' do
            @fake_county = [{ fips_code: '1' }]
            @fake_replacement = { fips_code: '2' }
            @to_replace = [{ fips_code: '1' }]
            described_class.update(@fake_county, @fake_replacement, @to_replace)
        end
        it 'calls alaska_update successfully' do
            @fake_county = [{ fips_code: '270' }]
            described_class.alaska_update(@fake_county)
        end
        it 'calls south_dakota_update successfully' do
            @fake_county = [{ fips_code: '113' }]
            described_class.south_dakota_update(@fake_county)
        end
        it 'calls virginia_update successfully' do
            @fake_county = [{ fips_code: '515' }]
            described_class.virginia_update(@fake_county)
        end
    end
end
