class ApplicationService
  attr_accessor :params, :result
  def initialize(params={}, result_class=nil)
    @params = params
    @result_class = result_class
  end

  def process
    yield if block_given?
    self
  end

  def result
    @result ||= @result_class.new
  end
end
