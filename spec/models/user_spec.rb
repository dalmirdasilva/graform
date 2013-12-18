require 'spec_helper'

describe User do

  before :each do
    @user = User.new
  end

  describe "associations" do
  
    it 'should be associated with forms' do
      @user.should respond_to(:forms)
    end
  end

  describe "attributes" do

    it "should have name" do
      @user.should respond_to(:name)
    end

    it "should have email" do
      @user.should respond_to(:email)
    end

    it "should have password" do
      @user.should respond_to(:password)
    end
  end
end

