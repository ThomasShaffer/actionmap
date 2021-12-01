# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe RepresentativesController do
    describe 'Viewing all representatives' do
        it 'selects the index template for rendering' do
            get :index
            expect(response).to render_template('index')
        end
    end
    describe 'Accessing profile page of individual representative' do
        before :each do
            temp_hash = { officials: [
                { name:     'Frank',
                  address:  [
                      {
                          line1: 'Test',
                          city:  'City',
                          state: 'State',
                          zip:   'Zip'
                      }
                  ],
                  party:    'Mine',
                  photoUrl: 'no' }

            ],
                          offices:   [
                              {
                                  name:             'one',
                                  division_id:      'four',
                                  official_indices: [
                                      1, 2, 3
                                  ]
                              }
                          ] }
            json_dat = temp_hash.to_json
            @fake_data = JSON.parse(json_dat, object_class: OpenStruct)
            Representative.civic_api_to_representative_params(@fake_data)
        end
        it 'calls the model method that extracts a representative' do
            expect(Representative).to receive(:get_one_rep).with('Frank')
            get :show, params: { name: 'Frank' }
        end
        it 'selects the show template for rendering' do
            allow(Representative).to receive(:get_one_rep).with('Frank')
            get :show, params: { name: 'Frank' }
            expect(response).to render_template('show')
        end
        it 'makes the representative available to that template' do
            @fake_result = double('representative1')
            allow(Representative).to receive(:get_one_rep).with('Frank').and_return(@fake_result)
            get :show, params: { name: 'Frank' }
            expect(assigns(:representative)).to eq(@fake_result)
        end
    end
end
