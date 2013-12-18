require 'spec_helper'

describe Form do

  before :each do
    @form = Form.new
  end

  describe "associations" do
  
    it 'should be associated with questions' do
      @form.should respond_to(:questions)
    end
  
    it 'should be associated with replies' do
      @form.should respond_to(:replies)
    end
  end

  describe "attributes" do

    it "should have a name" do
      @form.should respond_to(:name)
    end

    it "should have a description" do
      @form.should respond_to(:description)
    end
  end
  
  describe "#max_question_number" do
  
    it "should return the higest number of the existing questions" do
      @form.id = 1
      q0 = Question.new(form_id: @form.id, number: 0)
      q1 = Question.new(form_id: @form.id, number: 5)
      q2 = Question.new(form_id: @form.id, number: 4)
      @form.max_question_number.should == q1
    end
  end
end
