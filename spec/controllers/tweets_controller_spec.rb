require 'spec_helper'

describe TweetsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'deleted'" do
    it "returns http success" do
      get 'deleted'
      response.should be_success
    end
  end

  describe "GET 'undelete'" do
    it "returns http success" do
      get 'undelete'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

end
