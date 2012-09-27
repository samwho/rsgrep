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

  if DICT_FILE
    let(:dict_file) { File.open(DICT_FILE) }

    after :each do
      dict_file.close
    end

    context "Dictionary data tests" do
      context "case insensitive searches" do
        context "search for 'zyzzogeton'" do
          key = "zyzzogeton"

          subject { dict_file.sgrep key, :insensitive => true }
          it      { should include "Zyzzogeton" }
        end
      end
    end
  else
    STDERR.puts "It doesn't seem like you have a dictionary file in a standard location. Skipping dictionary file tests."
  end
end
