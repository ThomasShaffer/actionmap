# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe MyNewsItemsController do
    describe 'Basic routing' do
        before :each do
            create :representative
            create :news_item
        end
        it 'calls new successfully' do
            controller.new
        end
        it 'calls edit successfully' do
            controller.edit
        end
        it 'calls create successfully' do
            get :create,
                params: { representative_id: 1, news_item: { title: 'F', link: 'F', representative_id: 1 } }
        end
        it 'calls update successfully' do
            put :update,
                params: { representative_id: 1, id: 1, news_item: { title: 'FF', link: 'F', representative_id: 1 } }
        end
        it 'calls destroy successfully' do
            delete :destroy, params: { representative_id: 1, id: 1 }
        end
    end
end
