module CrudServices
  class Show < ApplicationService
    def initialize(params={}, resource_class=nil)
      super
      @scope = resource_class.all
      @resource = @scope.find(params[:id]) if params[:id]
    end

    def result
      @result ||= @resource
    end
  end

  class Create < Show
    def initialize(params={}, resource_class=nil, form_class=nil)
      super params, resource_class
      @form_class = form_class || "#{resource_class.model_name}Form".constantize
      @form_params = params[resource_class.model_name.singular]
    end

    def process
      super { result.save }
    end

    def result
      @result ||= @form_class.new @form_params
    end
  end

  class Update < Create
    def result
      @result ||= @form_class.new(@form_params, @resource)
    end
  end

  class Index < Show
    def result
      @scope
    end
  end

  class Destroy < Show
    def process
      super { result.delete }
    end
  end
end
