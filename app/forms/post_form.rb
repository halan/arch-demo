class PostForm < ApplicationForm
  attr_accessor :id, :title, :body

  validates :title, presence: true

  protected

  def read_params_permited
    read_params.permit :id, :title, :body
  end

  def write_params_permited
    write_params.permit :title, :body
  end

  def resource_class
    Post
  end
end
