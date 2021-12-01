# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe LoginController do
    describe 'calling authentication functions on' do
        it 'google auth and github auth' do
            # get :google_oauth2
            # get :github
        end
    end

    describe 'logging out' do
        it 'sets session to nil' do
            get :logout
            expect(session[:current_user_id]).to eq(nil)
        end
        it 'redirects to root path' do
            get :logout
            expect(response.status).to eq(302)
        end
    end

    describe 'creating users' do
        it 'calls find_or_create successfully' do
            @fake_user = { 'provider' => 'Me' }
            controller.send(:find_or_create_user, @fake_user, :puts)
        end
        it 'calls create_google_user successfully' do
            @fake_user = { 'uid'  => 'Me',
                           'info' => {
                               'first_name' => 'Me',
                               'last_name'  => 'Me',
                               'email'      => 'Me'
                           } }
            controller.send(:create_google_user, @fake_user)
        end
        it 'calls create_github_user successfully' do
            @fake_user = { 'uid'  => 'Me',
                           'info' => {
                               'first_name' => 'Me',
                               'last_name'  => 'Me',
                               'email'      => 'Me'
                           } }
            controller.send(:create_github_user, @fake_user)
        end
    end
end
