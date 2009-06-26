RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

config.active_record.observers = :security_observer
config.log_level = :debug
config.time_zone = 'UTC'
config.action_controller.session = {
    :session_key => '_xcrum_session',
    :secret      => '66c28e92bec33079ae1f103602e87dabb48defa330f2378a2c4adca3c7add5f79b5c0292db76b623d1407558e9bd60fed2341e69bf20232c20daf21cddc7cf40'
}

config.active_record.schema_format = :sql
config.i18n.default_locale = :"pt-BR"
config.gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'

end
require "will_paginate"

