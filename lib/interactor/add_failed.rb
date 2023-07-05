require "interactor/add_failed/version"
require 'interactor'

module Interactor
  module AddFailed
    class NotAnInteractor < StandardError; end
    
    def self.included(base)
      #Makes sure that this is included in Interactor::Organizer
      unless base.include?(Interactor::Organizer)
        raise NotAnInteractor, "#{base} does not include `Interactor::Organizer'"
      end

      # Gets organized Interactors from Interactor::Organizer
      base.class_eval do
        before do
          context.successfull_interactors = base.organized
        end
      end

      #Hijacks the original 'fail!' method to add extra steps
      Interactor::Context.class_eval do
        def fail!(context = {})
          self[:failed_interactor] = (self[:successfull_interactors] - self._called.map(&:class)).first
          self[:successfull_interactors] = self._called.map(&:class)

          context.each { |key, value| self[key.to_sym] = value }
          @failure = true
          raise Interactor::Failure, self
        end
      end
    end
  end
end
