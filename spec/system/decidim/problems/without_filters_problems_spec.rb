# frozen_string_literal: true

require "spec_helper"

describe "Without filters Problems", :slow, type: :system do
  include_context "with a component"
  let(:manifest_name) { "problems" }

  let!(:category) { create :category, participatory_space: participatory_process }
  let!(:scope) { create :scope, organization: organization }
  let!(:user) { create :user, :confirmed, organization: organization }
  let(:scoped_participatory_process) { create(:participatory_process, :with_steps, organization: organization, scope: scope) }

  describe "when filters are hide" do
    let(:scopes_picker) { select_data_picker(:filter_scope_id, multiple: true, global_value: "global") }
    let!(:scope_2) { create :scope, organization: participatory_process.organization }

    before do
      component.settings = { hide_filters: true }
      component.save!

      challenges_component = create(:challenges_component, participatory_space: participatory_process)
      challenge = create(:challenge, component: challenges_component, scope: scope)
      create_list(:problem, 2, component: component, challenge: challenge)
      challenge_2 = create(:challenge, component: challenges_component, scope: scope_2)
      create(:problem, component: component, challenge: challenge_2)
      challenge_no_scope = create(:challenge, component: challenges_component, scope: nil)
      create(:problem, component: component, challenge: challenge_no_scope)

      visit_component
    end

    it "show challenges in three columns" do
      expect(page).to have_css(".mediumlarge-11.large-12")
    end

    it "not show filters" do
      expect(page).not_to have_css(".filters")
    end
  end
end
