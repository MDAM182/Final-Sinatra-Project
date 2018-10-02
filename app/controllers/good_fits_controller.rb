class GoodFitsController < ApplicationController


  get "/good_fits" do
    @good_fits = GoodFit.all
    erb :"good_fits/index"
  end


  get "/good_fits/new" do
    erb :"good_fits/new"
  end

  post "/good_fits" do
    if params["outfit"]["season"] == "" || params["outfit"]["top"] == "" || params["outfit"]["bottom"] == "" || params["outfit"]["footwear"] == ""
      erb :"good_fits/new"
    else
      @good_fits = current_user.good_fits.build(:season => params["outfit"]["season"], :top => params["outfit"]["top"], :bottom => params["outfit"]["bottom"], :footwear => params["outfit"]["footwear"] )
      @good_fits.save
      redirect "/good_fits/#{@good_fits.id}"
    end
  end


  get '/good_fits/:id' do
      @good_fits = GoodFit.find_by_id(params[:id])
      erb :"good_fits/show"
  end


  get "/good_fits/:id/edit" do
    @good_fits = GoodFit.find_by_id(params[:id])
    if @good_fits.user_id == current_user.id
        erb :"good_fits/edit"
    else
      redirect "/good_fits"
    end
end




  patch "/good_fits/:id" do
   @good_fits = GoodFit.find_by_id(params[:id])
   @good_fits.season = params["outfit"]["season"]
   @good_fits.top = params["outfit"]["top"]
   @good_fits.bottom = params["outfit"]["bottom"]
   @good_fits.footwear = params["outfit"]["footwear"]
   @good_fits.save

    redirect "/good_fits"
  end


  delete '/good_fits/:id/delete' do
    @good_fits = GoodFit.find_by_id(params[:id])
    @good_fits.delete
    redirect "/good_fits"
  end
end
