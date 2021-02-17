# frozen_string_literal: true

require 'bunny'
require_relative 'errors'

module AssetBunny
  class Client
    def initialize; end

    def publish_data(event_name:, data:, notification_type:, exchange_name: 'audit_service')
      raise NotificationTypeError, 'Notification type has to be array' unless notification_type.is_a?(Array)

      payload = {}
      payload[:event_name] = event_name
      payload[:data] = data
      payload[:notification_type] = notification_type

      connection = create_connection
      channel = connection.create_channel
      exchange = Bunny::Exchange.new(channel, :fanout, exchange_name)
      exchange.publish(payload.to_json)
      close_connection
    end

    private

    def create_connection
      @rabbit_conn ||= Bunny.new({ host: ENV.fetch('RABBITMQ_HOST', '127.0.0.1'),
                                   port: ENV.fetch('RABBITMQ_PORT', 5672),
                                   ssl: ENV.fetch('RABBITMQ_SSL', false),
                                   vhost: '/',
                                   user: ENV.fetch('RABBITMQ_USER', 'guest'),
                                   pass: ENV.fetch('RABBITMQ_PASS', 'guest'),
                                   heartbeat: :server, # will use RabbitMQ settings
                                   frame_max: 131_072,
                                   auth_mechanism: 'PLAIN' })
      @rabbit_conn.start
    end

    def close_connection
      @rabbit_conn.close
    end
  end
end
