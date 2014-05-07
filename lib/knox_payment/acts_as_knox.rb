module Knox
  module ActsAsKnox
    extend ActiveSupport::Concern
 
    included do
    end
 
    module ClassMethods
      def acts_as_knox(options = {})
        cattr_accessor :yaffle_text_field
        self.yaffle_text_field = (options[:yaffle_text_field] || :last_squawk).to_s
		include Knox::ActsAsKnox::LocalInstanceMethods
      end
    end
	module LocalInstanceMethods
      def squawk(string)
        write_attribute(self.class.yaffle_text_field, string.to_squawk)
      end
	end
  end
end


ActiveRecord::Base.send :include, Knox::ActsAsKnox