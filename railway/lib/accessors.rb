module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name).last }

      define_method("#{name}=".to_sym) do |value|
        storage = instance_variable_get(var_name)
        storage ||= []
        instance_variable_set(var_name, storage << value)
      end

      define_method("#{name}_history".to_sym) { instance_variable_get(var_name) }
    end
  end

  def strong_attr_accessor(name, type_class)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }

    define_method("#{name}=".to_sym) do |value|
      raise "The type of the #{name} must be #{type_class}" unless value.instance_of? type_class
      instance_variable_set(var_name, value)
    end
  end
end
