class NavCard::Component < ViewComponent::Base
  renders_many :links, "LinkComponent"

  class LinkComponent < ViewComponent::Base
    def initialize(link:, text:, classes: nil)
      @link = link
      @text = text
      @classes = classes
    end
  end
end