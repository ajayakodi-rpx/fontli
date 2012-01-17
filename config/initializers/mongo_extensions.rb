module MongoExtensions

  def current_user
    controller.current_user
  end

  def controller
    Thread.current[:current_controller]
  end

  # return current_time in UTC always
  def current_time
    Time.zone.now
  end

  def request_domain
    'http://' + controller.request.env['HTTP_HOST']
  end

  def generate_rand(length = 8)
    SecureRandom.base64(length)
  end

  def perma
    str = "#{self.class}_#{self.id.to_s}"
    str = ActiveSupport::Base64.urlsafe_encode64(str)
    CGI.escape(str)
  end

  def permalink
    request_domain + '/' + perma
  end

  def created_dt
    dt = self.created_at.utc.to_s(:api_format) if self.respond_to?(:created_at)
    dt || ""
  end

  def my_save(return_bool = false)
    saved = self.save
    saved ? (return_bool || self) : [nil, self.errors.full_messages]
  end

  # utility meth to return 'user' for #<User>
  def klass_s
    self.class.to_s.underscore
  end

  def klass_sym
    klass_s.to_sym
  end

  module CounterCache
    extend ActiveSupport::Concern
    # Enables AR counter_cache mechanism on all cols ending with '_count' in the document.
    # Ex. Usage: in Photo model, add 'include MongoExtensions::CounterCache', after fields definition.
    # NOTE:: for a column 'likes_count' to work, we should have 'Like' document, with 'photo' association.
    included do
      klass = self.to_s.downcase
      cache_cols = self.fields.keys.select { |col| col.include?('_count') }
      create_meth = "increment_counter_in_#{klass}"
      destroy_meth = "decrement_counter_in_#{klass}"
      cache_cols.each do |col|
        modal = col.to_s.sub(/_count/, '').classify.constantize
        modal.class_eval <<-STR
          after_create '#{create_meth}'.to_sym
          after_destroy '#{destroy_meth}'.to_sym

          def #{create_meth}
            modal = self.#{klass}
            count = modal.#{col} + 1
            modal.update_attribute('#{col}'.to_sym, count)
          end

          def #{destroy_meth}
            modal = self.#{klass}
            count = modal.#{col} - 1
            modal.update_attribute('#{col}'.to_sym, count)
          end
        STR
      end # cache_cols.each
    end # included

  end

end
