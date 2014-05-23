require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end

    it "should have right title" do
      get 'home'
      response.should have_selector("title", :content => "Sample App | Home")
    end

    it "should have a non-blank body" do
      get 'home'
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end

    it "should have right title" do
      get 'contact'
      response.should have_selector("title", :content => "Sample App | Contact")
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end

    it "should have right title" do
      get 'about'
      response.should have_selector("title", :content => "Sample App | About")
    end
  end

end
