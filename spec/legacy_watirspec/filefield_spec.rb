# encoding: utf-8
require File.expand_path("../spec_helper", __FILE__)

describe "FileField" do

  before :each do
    browser.goto(WatirSpec.files + "/forms_with_input_elements.html")
  end

  describe "#exist?" do
    it "returns true if the file field exists" do
      browser.file_field(:id, 'new_user_portrait').exists?.should be_true
    end

    it "returns false if the file field doesn't exist" do
      browser.file_field(:id, 'no_such_id').should_not exist
    end

  end

  describe "how" do
    it "can be :id" do
      browser.file_field(:id, 'new_user_portrait').exists?.should be_true
    end

    it "can be :name" do
      browser.file_field(:name, 'new_user_portrait').exists?.should be_true
    end

    it "can be :class" do
      browser.file_field(:class, 'portrait').exists?.should be_true
    end

    it "can be :index" do
      browser.file_field(:index, 1).exists?.should be_true
    end

    it "can be :xpath" do
      browser.file_field(:xpath, "//input[@id='new_user_portrait']").exists?.should be_true
    end

    it "returns the first file field if given no args" do
      browser.file_field.exists?.should be_true
    end

    it "defaults to :name" do
      browser.file_field("new_user_portrait").exists?.should be_true
    end

    it "raises TypeError when 'what' argument is invalid" do
      lambda { browser.file_field(:id, 3.14).exists? }.should raise_error(TypeError)
    end

    it "raises MissingWayOfFindingObjectException when 'how' argument is invalid" do
      lambda { browser.file_field(:no_such_how, 'some_value').exists? }.should raise_error(MissingWayOfFindingObjectException)
    end
  end

  # Attribute methods

  describe "#class_name" do
    it "returns the class attribute if the text field exists" do
      browser.file_field(:index, 1).class_name.should == "portrait"
    end

    it "raises UnknownObjectException if the text field doesn't exist" do
      lambda { browser.file_field(:index, 1337).class_name }.should raise_error(UnknownObjectException)
    end
  end

  describe "#id" do
    it "returns the id attribute if the text field exists" do
      browser.file_field(:index, 1).id.should == "new_user_portrait"
    end

    it "raises UnknownObjectException if the text field doesn't exist" do
      lambda { browser.file_field(:index, 1337).id }.should raise_error(UnknownObjectException)
    end
  end

  describe "#name" do
    it "returns the name attribute if the text field exists" do
      browser.file_field(:index, 1).name.should == "new_user_portrait"
    end

    it "raises UnknownObjectException if the text field doesn't exist" do
      lambda { browser.file_field(:index, 1337).name }.should raise_error(UnknownObjectException)
    end
  end

  describe "#title" do
    it "returns the title attribute if the text field exists" do
      browser.file_field(:id, "new_user_portrait").title.should == "Smile!"
    end
  end

  describe "#type" do
    it "returns the type attribute if the text field exists" do
      browser.file_field(:index, 1).type.should == "file"
    end

    it "raises UnknownObjectException if the text field doesn't exist" do
      lambda { browser.file_field(:index, 1337).type }.should raise_error(UnknownObjectException)
    end
  end

  # Manipulation methods

  describe "#set" do
    bug "WTR-336", :watir do
      it "is able to set a file path in the field and click the upload button and fire the onchange event" do
        browser.goto("#{WatirSpec.host}/forms_with_input_elements.html")

        path = File.expand_path(__FILE__)

        browser.file_field(:name, "new_user_portrait").set path
        browser.file_field(:name, "new_user_portrait").value.should == path
        messages.first.should == path
        browser.button(:name, "new_user_submit").click
      end
    end

  end

end
