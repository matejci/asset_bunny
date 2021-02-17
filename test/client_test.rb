# frozen_string_literal: true

require 'test_helper'

class ClientTest < Minitest::Test
  def test_it_will_raise_notification_type_error_if_notification_type_is_not_an_array
    assert_raises(AssetBunny::NotificationTypeError) do
      AssetBunny::Client.new.publish_data(event_name: 'audit_created',
                                          data: { 'test': 'ok' },
                                          notification_type: 'email',
                                          exchange_name: 'audit_service')
    end
  end
end
