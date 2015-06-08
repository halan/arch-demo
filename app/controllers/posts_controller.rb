class PostsController < CrudController
  respond_to :html

  def payment
    @payment_id = PostServices::Payment.new(params).result
    respond_with @payment_id
  end

  protected

  def index_service
    @index_service ||= PostServices::Index.new(params)
  end

  def resource_class
    @resource_class ||= Post
  end
end
