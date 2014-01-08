module ApplicationHelper
	# It is a good idea to put controller specific helpers in their 
	# related helper file (e.g., helpers specifically for the 
	#	StaticPages controller). 

	# Returns the full title on a per-page basis:
	# 	This helper will be used for each page's title (unless
	#   otherwise noted).
	def full_title(page_title)
		base_title = "Ruby on Rails Tutorial Sample App"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

end
