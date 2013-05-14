class TablesController < ApplicationController
  unloadable


  def index
	  @project = Project.find(params[:project_id])
	  @custom_field = CustomField.find(:all, :order => "name ASC")
	  @list_field = []
	  @custom_field.each { |f|
		  if f.field_format == "list"
			  @list_field.push f
		  end
	  }
	  @counter = ActiveSupport::OrderedHash.new
	  @list_field.each { |f|
		  p = {}
		  p.default = 0
		  f.possible_values.each { |v|
			  p[v] = 0
		  }
		  @counter[f.name] = p
	  }

	  issues = Issue.find(:all)
	  issues.each { |ticket|
		  # check_field = ticket.available_custom_fields
		  # check_field.each { |f|

		  # }
		  ticket.custom_field_values.each { |v|
			  if v.value.empty? 
				 next 
			  end

			  f = v.custom_field
			  @counter[f.name][v.value.to_s] += 1
		  }
	  }
  end
end
