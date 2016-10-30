module RolesHelper
  def build_role_list(partialFile='')
    list_items = ""
    roleList = Role.all
    for role in roleList
      list_items += build_role_list_item(role ,partialFile)
    end
    output = list_items
    return output.html_safe
  end

  def build_role_list_item(local_role,partialFile)
    role_list_output = ""
  	#role_list_output += render :partial => '/roles/ul', :locals => { :list_items => local_role }
    output = render( :partial => partialFile, :locals => {:current_role => local_role})
    return output.html_safe
  end
end
