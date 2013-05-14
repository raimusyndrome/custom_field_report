Redmine::Plugin.register :custom_field_report do
  name 'Custom Field Report plugin'
  author 'Wataru Murai'
  description 'This is a plugin for counting custom field'
  version '0.0.1'
  # url 'http://example.com/path/to/plugin'
  # author_url 'http://example.com/about'

  permission :custom_field_tables, { :tables => [:index ] }, :public => true
  menu :project_menu, :custom_field_tables, { :controller => 'tables', :action => 'index' }, :caption => 'レポート', :last => true, :param => :project_id
end
