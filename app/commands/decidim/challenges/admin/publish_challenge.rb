# frozen_string_literal: true

module Decidim
  module Challenges
    module Admin
      # A command that sets a challenge as published.
      class PublishChallenge < Rectify::Command
        # Public: Initializes the command.
        #
        # challenge - A Challenge that will be published
        # current_user - the user performing the action
        def initialize(challenge, current_user)
          @challenge = challenge
          @current_user = current_user
        end

        # Executes the command. Broadcasts these events:
        #
        # - :ok when everything is valid.
        # - :invalid if the data wasn't valid and we couldn't proceed.
        #
        # Returns nothing.
        def call
          return broadcast(:invalid) if challenge.nil? || challenge.published?

          Decidim.traceability.perform_action!("publish", challenge, current_user, visibility: "all") do
            challenge.publish!
          end

          broadcast(:ok)
        end

        private

        attr_reader :challenge, :current_user
      end
    end
  end
end
