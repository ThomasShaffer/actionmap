# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
require 'task_helpers/state_shapefile_request'

describe StateShapefileRequest do
    describe 'testing methods execute without error' do
        @fake_state = { symbol: 'AL', fips_code: '01' }
        described_class.new(@fake_state)
        # a.cmd("nil")
    end
end
