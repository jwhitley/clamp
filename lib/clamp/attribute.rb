module Clamp

  class Attribute

    attr_reader :description, :attribute_name, :default_value, :env_var

    def help_rhs
      rhs = description
      if defined?(@default_value)
        rhs += " (default: #{@default_value.inspect})"
      end
      if defined?(@env_var)
        rhs += " (env: #{@env_var.inspect})"
      end
      rhs
    end

    def help
      [help_lhs, help_rhs]
    end

    def ivar_name
      "@#{attribute_name}"
    end

    def read_method
      attribute_name
    end

    def default_method
      "default_#{read_method}"
    end

    def write_method
      "#{attribute_name}="
    end

  end

end
