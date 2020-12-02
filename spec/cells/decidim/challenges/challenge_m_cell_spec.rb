# frozen_string_literal: true

require "spec_helper"

module Decidim::Challenges
  describe ChallengeCell, type: :cell do
    controller Decidim::Challenges::ChallengesController

    let!(:challenge) { create(:challenge) }
    let(:model) { challenge }
    let(:cell_html) { cell("decidim/challenges/challenge_m", challenge, context: { show_space: show_space }).call }

    it_behaves_like "has space in m-cell"

    context "when rendering" do
      let(:show_space) { false }

      it "renders the card" do
        expect(cell_html).to have_css(".card--challenge")
      end
    end
  end
end
