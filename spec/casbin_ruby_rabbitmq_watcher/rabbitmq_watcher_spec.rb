# frozen_string_literal: true

require 'casbin-ruby-rabbitmq-watcher/rabbitmq_watcher'

class TestQueue
  def bind(_exchange); end

  def subscribe; end
end

class TestExchange
  def publish(_message); end
end

class TestChannel
  def temporary_queue
    TestQueue.new
  end

  def fanout(_name)
    TestExchange.new
  end
end

describe CasbinRubyRabbitmqWatcher::RabbitmqWatcher do
  let(:exchange) { TestExchange.new }
  let(:queue) { TestQueue.new }

  before do
    allow(TestExchange).to receive(:new).and_return(exchange)
    allow(TestQueue).to receive(:new).and_return(queue)
    allow(exchange).to receive(:publish).and_return(true)
    allow(queue).to receive(:subscribe).and_return(true)
  end

  it '#update' do
    expect(described_class.new(TestChannel.new).update).to be_truthy
  end
end
