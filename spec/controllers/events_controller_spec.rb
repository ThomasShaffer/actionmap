# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe EventsController do
    describe 'showing all events' do
        it 'renders the index view' do
            get :index
            expect(response).to render_template('index')
        end
        it 'makes the events instance variable available to the view' do
            get :index
            expect(assigns(:events)).to be_truthy
        end
    end

    describe 'show individual event' do
        it 'renders the show view' do
            create :state
            create :county
            create :event
            get :show, params: { id: 1 }
            expect(response).to render_template('show')
        end
        it 'makes the event instance variable available to the view' do
            create :state
            create :county
            create :event
            get :show, params: { id: 1 }
            expect(assigns(:event)).to be_truthy
        end
    end

    describe 'filtering events' do
        it 'filters events by state' do
            create :state
            create :county
            create :event
            get :index, params: { 'filter-by' => 'state-only', 'state' => 'F' }
        end
        it 'filters events by county' do
            create :state
            create :county
            create :event
            get :index, params: { 'filter-by' => 'county', 'county' => 'Lane Country, OR', 'state' => 'F' }
        end
    end
end
