json.extract! @group_definition, :name, :action, :model, :uuid, :action


json.block_definitions @group_definition.block_definitions.where(:enabled => 1).order("block_position asc") do |bd|
  json.name bd.name
  json.blocktype bd.blocktype
  json.model bd.model
  #json.block_data instance_variable_get('@' + bd.model) rescue nil #fml part2
  json.template_path bd.template_path rescue nil
  json.uuid bd.uuid
  json.is_tab bd.is_tab
  json.has_filter bd.has_filter
  json.has_search bd.has_search
  json.has_anchor bd.has_anchor
  json.classname bd.classname
  json.has_changeable_width bd.has_changeable_width
  json.field_definitions bd.field_definitions do |fd|
    json.uuid fd.uuid
    json.bduuid fd.bduuid
    json.name fd.name
    json.field_type fd.field_type
    json.field_name fd.field_name
    json.attributes_from fd.attributes_from rescue nil
    json.js_function fd.js_function rescue nil
    json.model fd.model
    json.min fd.min
    json.max fd.max
    json.is_required fd.is_required
    if ((fd.field_type == "radioimage" || fd.field_type == "radio" || fd.field_type == "checkbox" || fd.field_type == "dropdown") && !fd.attributes_from.blank?)
      json.attributes fd.attributes_from.singularize.classify.constantize.all
    end

  end
end

json.action_definitions @group_definition.action_definitions do |ad|
  json.name ad.name rescue nil
  json.link_attributes ad.link_attributes rescue nil
  json.js_function ad.js_function rescue nil
  json.uuid ad.uuid
end

json.extract! @filter_definitions
json.extract! @list_group_definitions
