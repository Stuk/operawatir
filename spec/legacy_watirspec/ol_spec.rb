# encoding: utf-8
require File.expand_path("../spec_helper", __FILE__)

describe "Ol" do

  before :each do
    browser.goto(WatirSpec.files + "/non_control_elements.html")
  end

  # Exists method
  describe "#exists?" do
    it "returns true if the 'ol' exists" do
      browser.ol(:id, "favorite_compounds").should exist
    end

    it "returns false if the 'ol' doesn't exist" do
      browser.ol(:id, "no_such_id").should_not exist
    end
  end

  describe "how" do
    it "can be :id" do
      browser.ol(:id, "favorite_compounds").should exist
    end

    it "can be :index" do
      browser.ol(:index, 1).should exist
    end

    it "returns true if the element exists (default how = :id)" do
      browser.ol("favorite_compounds").should exist
    end

    it "returns the first ol if given no args" do
      browser.ol.should exist
    end

    it "raises TypeError when 'what' argument is invalid" do
      lambda { browser.ol(:id, 3.14).exists? }.should raise_error(TypeError)
    end

    it "raises MissingWayOfFindingObjectException when 'how' argument is invalid" do
      lambda { browser.ol(:no_such_how, 'some_value').exists? }.should raise_error(MissingWayOfFindingObjectException)
    end
  end

  # Attribute methods
  describe "#class_name" do
    it "returns the class attribute" do
      browser.ol(:id, 'favorite_compounds').class_name.should == 'chemistry'
    end

    it "returns an empty string if the element exists and the attribute doesn't" do
      browser.ol(:index, 2).class_name.should == ''
    end

    it "raises UnknownObjectException if the ol doesn't exist" do
      lambda { browser.ol(:id, 'no_such_id').class_name }.should raise_error(UnknownObjectException)
    end
  end

  describe "#id" do
    it "returns the id attribute" do
      browser.ol(:class, 'chemistry').id.should == "favorite_compounds"
    end

    it "returns an empty string if the element exists and the attribute doesn't" do
      browser.ol(:index, 2).id.should == ''
    end

    it "raises UnknownObjectException if the ol doesn't exist" do
      lambda { browser.ol(:id, "no_such_id").id }.should raise_error(UnknownObjectException)
    end
  end
end
