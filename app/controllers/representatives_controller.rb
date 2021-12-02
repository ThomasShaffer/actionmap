# frozen_string_literal: true

class RepresentativesController < ApplicationController
    def index
        @representatives = Representative.all
    end

    def show
        @rep = Representative.get_one_rep(params[:name])
        # @rep_address = @representative.attributes
    end
end
