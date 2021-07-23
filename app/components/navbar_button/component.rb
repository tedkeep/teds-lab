class NavbarButton::Component < ViewComponent::Base
  def initialize(text:)
    @text = text
  end
end