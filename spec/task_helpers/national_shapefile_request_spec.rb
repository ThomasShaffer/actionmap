# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
require 'task_helpers/national_shapefile_request'

describe NationalShapefileRequest do
    describe 'testing methods execute without error' do
        it 'calls initialize successfully' do
            described_class.new
        end
        #it 'calls cmd successfully' do
        #    a = described_class.new
        #    a.cmd(nil)
        #end
    end
end
