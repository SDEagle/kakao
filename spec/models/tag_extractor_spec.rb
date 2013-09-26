require 'spec_helper'

describe TagExtractor do
  it 'should extract tags from text' do
    TagExtractor.extract_tags('bla bla bla #bla wirklich  sinnfrei #blindtext').should =~ ['bla', 'blindtext']
  end

  it 'should find no tags' do
    TagExtractor.extract_tags('bla bla bla').should =~ []
  end

  it 'should omit empty tags' do
    TagExtractor.extract_tags('bla bla bla # bla').should =~ []
  end

  it 'should delegate save' do
    post = double('post')
    post.stub(text: 'foobar')
    post.should_receive(:save).and_return(true)
    post.should_receive(:tags=)
    TagExtractor.new(post).save.should be_true

    post = double('post')
    post.stub(text: 'foobar')
    post.should_receive(:save).and_return(false)
    TagExtractor.new(post).save.should be_false
  end

  it 'should link post with tags' do
    post = double('post')
    post.stub(text: 'bla bla bla #bla wirklich sinnfrei #blindtext')
    post.should_receive(:save).and_return(true)
    post.should_receive(:tags=) do |tags|
      tags.map(&:name).should =~ ['bla', 'blindtext']
    end
    TagExtractor.new(post).save
  end
end