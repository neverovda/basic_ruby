module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      name_accum_method = "#{name}_storage_add".to_sym
      var_name_storage = "@#{name}_storage".to_sym

      make_history_method(name, var_name_storage)
      make_storage_methods(name, var_name_storage, name_accum_method)

      make_indiv_methods(name, name_accum_method)
    end
  end

  def strong_attr_accessor(name, type_class)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }

    define_method("#{name}=".to_sym) do |value|
      unless value.instance_of? type_class
        raise "The type of the #{name} must be #{type_class}"
      end
      instance_variable_set(var_name, value)
    end
  end

  protected

  def make_indiv_methods(name, name_accum_method)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }

    define_method("#{name}=".to_sym) do |value|
      instance_variable_set(var_name, value)
      send(name_accum_method, value)
    end
  end

  def make_history_method(name, var_name)
    define_method("#{name}_history".to_sym) { instance_variable_get(var_name) }
  end

  def make_storage_methods(_name, var_name, name_accum_method)
    define_method(name_accum_method) do |value|
      storage = instance_variable_get(var_name)
      storage ||= []
      storage << value
      instance_variable_set(var_name, storage)
    end
    protected name_accum_method
  end
end
