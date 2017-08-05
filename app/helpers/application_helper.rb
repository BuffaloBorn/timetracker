module ApplicationHelper
   def display_nav_item(displaytext, controllername, linkurl)
		raw("<li#{controller_name == controllername ? ' class="active"' : ''}>#{link_to displaytext, linkurl}</li>")
	end
end
