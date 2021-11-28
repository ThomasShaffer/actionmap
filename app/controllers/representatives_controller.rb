# frozen_string_literal: true

class RepresentativesController < ApplicationController
    def index
        @representatives = Representative.all
    end
  
    def show
      @representative = Representative.get_one_rep(params[:rep_name])
    end
end
