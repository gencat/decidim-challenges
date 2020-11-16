# frozen_string_literal: true

module Decidim
  module Challenges
    # This cell renders a horizontal challenge card
    # for an given instance of a challenge in a challenges list
    class ChallengeListItemCell < Decidim::ViewModel
      include ActiveSupport::NumberHelper
      include Decidim::LayoutHelper
      include Decidim::ActionAuthorizationHelper
      include Decidim::Challenges::ApplicationHelper
      include Decidim::Challenges::Engine.routes.url_helpers

      delegate :current_user, :current_settings, :current_order, :current_component, :current_participatory_space, to: :parent_controller

      private

      def challenge_path
        resource_locator(model).path
      end

      def show
        render
      end

      def resource_path
        resource_locator(model).path
      end

      def resource_title
        translated_attribute model.title
      end

      def resource_description
        translated_attribute model.global_description
      end

      def resource_sdgs
        Decidim::Sdgs::Sdg::SDGS.map do |sdg_name|
          [I18n.t("#{sdg_name}.objectives.subtitle", scope: "decidim.components.sdgs")]
        end
      end

      def resource_sdg
        resource_sdgs[model.sdg]
      end

      def resource_sdg_index
        (model.sdg + 1).to_s.rjust(2, "0")
      end

      def resource_state
        model.state
      end
    end
  end
end
