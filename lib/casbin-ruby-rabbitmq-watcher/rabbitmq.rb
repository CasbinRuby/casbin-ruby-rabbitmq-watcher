# frozen_string_literal: true

module CasbinWatcher
  class Rabbitmq
    RABBIT_EXCHANGE_NAME = 'casbin-role-watcher'

    attr_accessor :update_callback
    attr_reader :exchange, :queue

    def initialize(channel)
      @queue = channel.temporary_queue
      @exchange = channel.fanout(RABBIT_EXCHANGE_NAME)

      queue.bind(exchange)
      check_messages
    end

    def update
      exchange.publish("casbin policy updated at #{Time.now}")
    end

    private

    def check_messages
      Thread.new do
        queue.subscribe(block: true) do |_delivery_info, _properties, _body|
          update_callback.call
        end
      end
    end
  end
end
