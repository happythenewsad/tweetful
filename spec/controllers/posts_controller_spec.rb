require 'spec_helper'


describe PostsController do
  
    
  describe "GET index" do
    it "should prompt for sign in when serving #index if no admin session exists" do
      get :index
      response.should render_template('index')
    end
  end


  
  
  
  
end
