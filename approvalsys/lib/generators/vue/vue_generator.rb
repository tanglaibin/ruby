class VueGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ResourceHelpers

  source_root File.expand_path('../templates', __FILE__)

  attr_accessor :options, :attributes

  # we will look into the content of the templates next
  # creates file app/javascript/packs/[namespace]/[controller]/action.js
  # def create_js_file
  #   # ex: rails g vue reports/index
  #   # then name = 'reports/index'
  #   template "javascript.erb", "app/javascript/packs/#{name}.js"
  # end

  # similar create vue file the given location usign the template
  # creates file app/javascript/views/[namespace]/[controller]/action.vue
  def create_vue_file_index
    template "index.erb", "app/javascript/views/#{name.downcase}/index.vue"
  end

  def create_vue_file_edit
    template "edit.erb", "app/javascript/views/#{name.downcase}/edit.vue"
  end

  def create_vue_file_new
    template "new.erb", "app/javascript/views/#{name.downcase}/new.vue"
  end

  def create_vue_file_form
    template "_form.erb", "app/javascript/views/#{name.downcase}/_form.vue"
  end

  def create_router_item
    output_path = "app/javascript/packs/router/index.js"
    root_js_file = "#{Rails.root.to_s}/#{output_path}"
    file = File.open(root_js_file, "rb")
    contents = file.read
    
    if contents.include?("#{router_path_index}")
        warn "Warning: route path [ #{router_path_index} ] exists!! skip update router/index.js"
    else
        template root_js_file, output_path
    end
  end

  def create_menu_item
    output_path = "app/javascript/packs/lib/slideMenuItems.js"
    menu_js_file = "#{Rails.root.to_s}/#{output_path}"
    file = File.open(menu_js_file, "rb")
    contents = file.read
    
    if contents.include?("#{human_name}Index")
        warn "Warning: menu item [ #{human_name}Index ] exists!! skip update lib/slideMenuItems.js"
    else
        template menu_js_file, output_path
    end
  end

  # # you got this one right?
  # # create or update app/views/[namespace]/[controller]/action.html.erb
  # def create_erb_file
  #   template "html.erb", "app/views/#{name}.html.erb"
  # end

  private
  # Here are some helper methods which are used in the templates
  # they are pretty easy to understand

  # splits the name reports/new
  # ['reports', 'new']
  def parts
    name.downcase.split('/')
  end

  # create js file name for reports/new
  # ReportsNew
  def js_file_name
    name = ""
    parts.each do |part|
      name += part.titleize
    end
    name
  end

  def vue_component_kebab_name
    name = ""
    parts.each do |part|
      name += part + '-'
    end
    # remove the trailing '-'
    name + 'view'
  end

  def vue_component_snippet
    """
<#{vue_component_kebab_name}>
</#{vue_component_kebab_name}>
"""
  end

  def javascript_pack_tag_snippet
    "<%= javascript_pack_tag '#{name}' %>"
  end

  def stylesheet_pack_tag_snippet
    "<%= stylesheet_pack_tag '#{name}' %>"
  end

  def model_columns_for_attributes
    class_name.constantize.columns.reject do |column|
      column.name.to_s =~ /^(created_id|created_at|updated_id|updated_at)$/
    end
  end

  def editable_attributes
    attributes ||= model_columns_for_attributes.map do |column|
      Rails::Generators::GeneratedAttribute.new(column.name.to_s, column.type)
    end
  end

  def all_attributes
    attributes ||= class_name.constantize.columns.map do |column|
      Rails::Generators::GeneratedAttribute.new(column.name.to_s, column.type)
    end
  end

  def input_type(type)
    case type
      when :integer              then :number
      when :float, :decimal      then :text
      when :time                 then :time
      when :datetime, :timestamp then :datetime
      when :date                 then :date
      when :text                 then :textarea
      when :boolean              then :checkbox
      else
          :text
    end
  end

  def component_form_tag
    "#{singular_name}-form"
  end

  def form_name
    "#{human_name}Form"
  end

  def base_path
    "/vue/index/#/"
  end

  def router_path_new
    "#{base_path}#{singular_name}/new"
  end

  def router_path_edit
    "#{base_path}#{singular_name}/:id/edit"
  end

  def router_path_index
    "#{base_path}#{singular_name}/index"
  end

  def import_router_component
    text = <<~EOF
             start of #{human_name}
            import #{router_index_name} from '../../views/#{singular_name}/index'
            import #{router_edit_name} from '../../views/#{singular_name}/edit'
            import #{router_new_name} from '../../views/#{singular_name}/new'
            //<%=import_router_component%>
            EOF
  end

  def router_item
    text = <<~EOF
        <%=router_item%>
                // start of #{human_name}
                {
                    path: '#{router_path_index}',
                    name: '#{router_index_name}',
                    component: #{router_index_name}
                },

                {
                    path: '#{router_path_new}',
                    name: '#{router_new_name}',
                    component: #{router_new_name}
                },

                {
                    path: '#{router_path_edit}',
                    name: '#{router_edit_name}',
                    component: #{router_edit_name}
                },
        EOF
  end

  def router_index_name
    "#{human_name}Index"
  end

  def router_new_name
    "#{human_name}New"
  end

  def router_edit_name
    "#{human_name}Edit"
  end

  def menu_item
    text = <<~EOF
        <%=menu_item%>
                    // start of #{human_name}
                    {
                        type: 'item',
                        icon: 'fa fa-circle-o',
                        name: '#{human_name}Index',
                        router: {
                            name: '#{human_name}Index'
                        }
                    },
        EOF
  end
end
