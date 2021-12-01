# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe MyEventsController do
    describe 'Basic routes' do
        it 'calls new successfully' do
            controller.new
            expect(assigns(:event)).to be_truthy
        end
        it 'calls edit successfully' do
            controller.edit
        end
        it 'calls create successfully' do
            get :create, params: { event: { name: 'Me', county_id: 1 } }
            expect(assigns(:event)).to be_nil
        end
        it 'calls update successfully' do
            create :state
            create :county
            create :event
            put :update, params: { id: 1 }
        end
        it 'calls destroy successfully' do
            create :state
            create :county
            create :event
            delete :destroy, params: { id: 1 }
        end
    end
end
