class CoinsController < ApplicationController
  before("/coins") do
    redirect_if_not_logged_in if request.path_info != "/login"
  end

  # GET: /coins
  get "/coins" do
    redirect_if_not_logged_in
    erb :"/coins/index.html"
  end

  # POST: /coins
  post "/coins" do
    redirect "/coins"
  end

  # GET: /coins/5
  get "/coins/:id" do
    erb :"/coins/show.html"
  end

  # GET: /coins/5/edit
  get "/coins/:id/edit" do
    erb :"/coins/edit.html"
  end

  # PATCH: /coins/5
  patch "/coins/:id" do
    redirect "/coins/:id"
  end

  # DELETE: /coins/5/delete
  delete "/coins/:id/delete" do
    redirect "/coins"
  end
end
