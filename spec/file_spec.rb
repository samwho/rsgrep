require 'spec_helper'

describe "File#sgrep" do
  let(:data_file1) { File.open(DATA_FILE1) }

  after :each do
    data_file1.close
  end

  context "when searching for 'search for '" do
    key = "search for "

    subject      { data_file1.sgrep key }
    it           { should_not be_empty }

    specify "all elements start with '#{key}'" do
      subject.all? { |elem| elem.start_with? key }.should be_true
    end
  end

  context "when searching for 'a'" do
    key = 'a'

    subject      { data_file1.sgrep key }
    it           { should_not be_empty }

    specify "all elements start with '#{key}'" do
      subject.all? { |elem| elem.start_with? key }.should be_true
    end
  end

  context "when searching for '!'" do
    key = '!'

    subject      { data_file1.sgrep key }
    it           { should_not be_empty }

    specify "all elements start with '#{key}'" do
      subject.all? { |elem| elem.start_with? key }.should be_true
    end
  end

  context "no results (search 'this is not in this file anywhere')" do
    key = 'this is not in this file anywhere'

    subject      { data_file1.sgrep key }
    it           { should be_empty }
  end

  context "case insensitive searches" do
    context "when searching for 'And'" do
      key = 'And'

      subject      { data_file1.sgrep key, :insensitive => true }
      it           { should_not be_empty }

      specify "it should have at least one lower case a match" do
        subject.any? { |elem| elem.start_with? "a" }.should be_true
      end

      specify "it should have at least one upper case A match" do
        subject.any? { |elem| elem.start_with? "A" }.should be_true
      end
    end
  end
end
