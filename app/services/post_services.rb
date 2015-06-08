module PostServices
  class Index < CrudServices::Index
    def initialize(params)
      super params, PostQuery.new
    end
  end
end
