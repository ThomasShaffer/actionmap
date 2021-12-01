# frozen_string_literal: true

class RepresentativesController < ApplicationController
    def index
        @representatives = Representative.all
    end

    def show
        @representative = Representative.get_one_rep(params[:name])
        # @rep_address = @representative.attributes
        # @rep_address = "#{@representative.address}, #{@representative.city}, #{@representative.state}, #{@representative.zip}"
    end
end
