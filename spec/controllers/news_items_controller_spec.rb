# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe NewsItemsController do
    describe 'Basic routes' do
        before :each do
            create :representative
            create :news_item
        end
        it 'calls index successfully' do
            get :index, params: { id: 1, representative_id: 1 }
        end
        it 'calls show successfully' do
            get :show, params: { id: 1, representative_id: 1 }
        end
    end
end
