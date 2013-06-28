module ApplicationHelper
	def flash_class(level)
	    case level
	        when :notice then "alert alert-info"
	        when :success then "alert alert-success"
	        when :error then "alert alert-error"
	        when :alert then "alert alert-error"
	    end
	end

	def mark_required(object, attribute)
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
  	end

end
