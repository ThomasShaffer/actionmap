# frozen_string_literal: true

class MyNewsItemsController < SessionController
    before_action :set_representative
    before_action :set_representatives_list
    before_action :set_issues_list
    before_action :set_ratings_list
    before_action :set_news_item, only: %i[edit update destroy]

    def new
        @news_item = NewsItem.new
    end

    def edit; end

    def create
        item_params(params)
        @news_item = NewsItem.new(@parameters)
        @rating_chosen = params[:news_item][:rating].to_i
        if @news_item.save
            @news_id = NewsItem.last.id
            @rating = Rating.create!({ 'rating': @rating_chosen, 'news_item_id': @news_id,
'user_id': session[:current_user_id] })
            # @rating.save
            redirect_to representative_news_item_path(@representative, @news_item),
                        notice: 'News item was successfully created.'
        else
            render :new, error: 'An error occurred when creating the news item.'
        end
    end

    def update
        item_params(params)
        @rating_chosen = params[:news_item][:rating].to_i
        if @news_item.update(@parameters)
            @news_item.ratings.last.update({ "rating": @rating_chosen })
            redirect_to representative_news_item_path(@representative, @news_item),
                        notice: 'News item was successfully updated.'
        else
            render :edit, error: 'An error occurred when updating the news item.'
        end
    end

    def destroy
        @news_item.destroy
        redirect_to representative_news_items_path(@representative),
                    notice: 'News was successfully destroyed.'
    end

    private

    def set_representative
        @representative = Representative.find(
            params[:representative_id]
        )
    end

    def set_representatives_list
        @representatives_list = Representative.all.map { |r| [r.name, r.id] }
    end

    def set_news_item
        @news_item = NewsItem.find(params[:id])
    end

    def item_params(params_hash)
        @ratings_chosen = params_hash[:news_item][:rating]
        @parameters = { "title":             params_hash[:news_item][:title],
                        "link":              params_hash[:news_item][:link],
                        "description":       params_hash[:news_item][:description],
                        "representative_id": params_hash[:news_item][:representative_id],
                        "issue":             params_hash[:news_item][:issue] }
    end

    def set_issues_list
        @issues = ['Free Speech', 'Immigration', 'Terrorism',
                   'Social Security and Medicare', 'Abortion', 'Student Loans',
                   'Gun Control', 'Unemployment', 'Climate Change', 'Homelessness',
                   'Racism', 'Tax Reform', 'Net Neutrality', 'Religious Freedom',
                   'Border Security', 'Minimum Wage', 'Equal Pay']
    end

    def set_ratings_list
        @ratings = [1, 2, 3, 4, 5]
    end

    # Only allow a list of trusted parameters through.
    def news_item_params
        params.require(:news_item).permit(:news, :title, :description, :link, :representative_id, :rating)
    end
end
