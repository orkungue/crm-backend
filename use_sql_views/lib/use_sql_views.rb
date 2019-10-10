require "use_sql_views/version"

module UseSqlViews
  # Your code goes here...
  def self.included(base) # :nodoc:
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_views(options = {})

      unless view? # don't let AR call this twice
      #baum?

        # all find calls lead here
      end
      include InstanceMethods
    end

    def view?
      self.included_modules.include?(InstanceMethods)
    end
  end

  module InstanceMethods #:nodoc:
    def self.included(base) # :nodoc:
      base.extend ClassMethods
    end

    module ClassMethods
        def find_every(options)

        end
    end
  end
end
end
