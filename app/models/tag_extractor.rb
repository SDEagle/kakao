class TagExtractor
  def initialize post
    @post = post
  end

  def save
    if @post.save
      @post.tags = TagExtractor.extract_tags(@post.text).map do |tag_name|
        Tag.where(name: Tag.reduce(tag_name)).first_or_create!
      end
    end
  end

  def self.extract_tags text
    text.split.reject { |it| it.size <= 1 || !it.start_with?('#') }.map { |it| it[1..-1] }
  end
end