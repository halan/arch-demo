class CrudController < ApplicationController
  include CrudRouteHelpers
  include CrudServicesInstances

  def index
    @collection = index_service.result
    respond_with @collection
  end

  def new
    @form = create_service.result
    respond_with @form.resource
  end

  def create
    @form = create_service.process.result
    respond_with @form.resource
  end

  def edit
    @form = update_service.result
    respond_with @form.resource
  end

  def update
    @form = update_service.process.result
    respond_with @form.resource
  end

  def show
    @resource = show_service.result
    respond_with @resource
  end

  def destroy
    @resource = destroy_service.process.result
    respond_with @resource
  end
end
