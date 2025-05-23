# frozen_string_literal: true

module EpathwayScraper
  module Page
    # The first page you come to on the site where you can usually choose between
    # something like "development applications" and applications that are on notice.
    # If there is only one type of list then it looks like this page can be absent
    module ListSelect
      ADVERTISING_TEXT = [
        # Applications
        "applications on exhibition",
        "applications on notification list",
        # Planning Applications
        "advertised planning applications",
        "planning application at advertising",
        "planning applications being advertised",
        "planning applications currently on advertising",
        "planning applications currently advertised",
        "planning applications on advertising",
        # Development Applications
        "development applications on public exhibition",
        "development applications in public notification",
        "das on exhibition",
        # Planning Permit Applications
        "planning permit applications advertised",
        "advertised planning permit applications",
        # Statutory Planning Applications
        "advertised statutory planning applications"
      ].freeze

      ALL_TEXT = [
        # Applications
        "all applications",
        "applications register",
        # Development Applications
        "development application tracking",
        "development applications",
        "find a development application",
        "list of development applications",
        "development application - planning act",
        "track lodged development applications (da)",
        # Specific to Gold Coast
        "development applications after july 2017",
        # Planning Applications
        "planning applications",
        "planning application enquiry",
        "planning application register",
        "planning applications register",
        "register of planning applications",
        "planning applications register - general",
        # Planning
        "planning register",
        "application enquiry - planning",
        # Planning Permit Applications
        "planning permit application search",
        "planning permit register",
        # Town Planning
        "town planning public register",
        # This one is ridiculous
        "the barossa council development applications",
        # Statutory Planning Applications
        "statutory planning - online register",
        "statutory planning applications register"
      ].freeze

      OTHER_TEXT = [
        "track all other applications"
      ].freeze

      def self.select(page, text_to_match)
        form = page.forms.first

        button_texts = page.search('input[type="radio"]').map do |i|
          # Make the text lowercase for easier matching
          a = i.parent.next
          raise "Unexpected node" unless a.name == "td"

          a.inner_text.downcase
        end

        index = button_texts.find_index { |text| text_to_match.include?(text) }
        raise "Couldn't find index in #{button_texts}" if index.nil?

        form.radiobuttons[index].click
        button = form_button(page)
        raise "Couldn't find button" if button.nil?

        form.submit(button)
      end

      def self.form_button(page)
        form = page.form
        form.button_with(value: /Next/) ||
          form.button_with(value: /Continue/) ||
          form.button_with(value: /Submit/)
      end

      def self.select_advertising(page)
        select(page, ADVERTISING_TEXT)
      end

      def self.select_all(page)
        select(page, ALL_TEXT)
      end

      def self.select_other(page)
        select(page, OTHER_TEXT)
      end

      # Fake that we're running javascript by picking out the javascript redirect
      def self.follow_javascript_redirect(page, agent)
        match = page.body.match(/window.location.href='(.*)';/)
        return page if match.nil?

        redirected_url = match[1]
        agent.get(redirected_url)
      end

      # Very simple minded test for whether we're on the correct page
      def self.on_page?(page)
        !page.search('input[type="radio"]').empty? && form_button(page)
      end
    end
  end
end
