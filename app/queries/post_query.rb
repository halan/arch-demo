class PostQuery
  attr_accessor :relation
  def initialize(relation=Post.all)
    @relation = relation
  end

  def all
    relation.limit(5).order('id desc')
  end
end
