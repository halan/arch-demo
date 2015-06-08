module CrudRouteHelpers
  extend ActiveSupport::Concern

  included do
    helper_method :new_resource_path, :collection_path, :resource_path, :edit_resource_path
  end

  def new_resource_path
    send "new_#{resource_class.model_name.singular}_path"
  end

  def resource_path(*args)
    send "#{resource_class.model_name.singular}_path", *args
  end

  def edit_resource_path(*args)
    send "edit_#{resource_class.model_name.singular}_path", *args
  end

  def collection_path
    send "#{resource_class.model_name.plural}_path"
  end
end
