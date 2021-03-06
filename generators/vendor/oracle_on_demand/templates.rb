# these are Oracle-specific Templater::Generator templates
Rhocrm::AppGenerator.add_vendor_templates :template, :settings_yml do |template,name,crm|
  template.source = File.join('..','..','vendor','oracle_on_demand','settings','settings.yml')
  template.destination = File.join("#{name}", 'vendor','oracle_on_demand','settings','settings.yml')
end

Rhocrm::SourceGenerator.add_vendor_templates :file, :object_yml do |file,name,crm|
  source_name = name.gsub('-', '_').camel_case
  source_filename = File.join('..','..','vendor','oracle_on_demand','settings',"#{source_name}.yml")
  if File.exists? File.join(SourceGenerator.source_root, source_filename)
    file.source = source_filename
  else
    file.source = File.join('..','..','vendor','oracle_on_demand','settings',"GenericObject.yml")
  end
  file.destination = File.join('vendor','oracle_on_demand','settings', "#{source_name}.yml")
end

Rhocrm::SourceGenerator.add_vendor_templates :template, :spec_data do |template,name,crm|
  source_name = name.gsub('-', '_').camel_case
  source_filename = File.join('..','..','vendor','oracle_on_demand','spec_data',"#{source_name}.yml")
  if File.exists? File.join(SourceGenerator.source_root, source_filename)
    template.source = source_filename
  else
    template.source = File.join('..','..','vendor','oracle_on_demand','spec_data',"GenericObject.yml")
  end
  template.destination = File.join('vendor','oracle_on_demand','spec_data', "#{source_name}.yml")
end






