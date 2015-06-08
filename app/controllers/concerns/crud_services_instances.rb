module CrudServicesInstances
  def show_service
    @show_service ||= instance_service(CrudServices::Show)
  end

  def index_service
    @index_service ||= instance_service(CrudServices::Index)
  end

  def create_service
    @create_service ||= instance_service(CrudServices::Create)
  end

  def update_service
    @update_service ||= instance_service(CrudServices::Update)
  end

  def destroy_service
    @destroy_service ||= instance_service(CrudServices::Destroy)
  end

  def instance_service(service)
    service.new(params, resource_class)
  end
end
