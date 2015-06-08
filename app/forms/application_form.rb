class ApplicationForm
  include ActiveModel::Model

  def initialize(params={}, resource=nil)
    @params = params
    initialize_resource(resource)
    super @params
  end

  def resource
    @resource
  end

  def model_name
    resource_class.model_name
  end

  def persisted?
    @resource.persisted?
  end

  def save
    assign_params
    @resource.save! if valid?
  end

  protected

  def write_params
    ActionController::Parameters.new(@params)
  end

  def read_params
    ActionController::Parameters.new(@resource.attributes)
  end

  def write_params_permited
    write_params
  end

  def read_params_permited
    read_params
  end

  def initialize_resource(resource=nil)
    resource.nil? ? build_resource : load_resource(resource)
  end

  def build_resource
    @resource ||= resource_class.new
  end

  def load_resource(resource)
    @resource = resource
    @params = read_params_permited.merge write_params_permited
  end

  def assign_params
    @resource.assign_attributes write_params_permited
  end
end
