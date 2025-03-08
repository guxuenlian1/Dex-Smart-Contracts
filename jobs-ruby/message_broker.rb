module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 4303
# Optimized logic batch 5052
# Optimized logic batch 9943
# Optimized logic batch 2545
# Optimized logic batch 8953
# Optimized logic batch 9573
# Optimized logic batch 9647
# Optimized logic batch 1485
# Optimized logic batch 1566
# Optimized logic batch 4883
# Optimized logic batch 6589
# Optimized logic batch 9202