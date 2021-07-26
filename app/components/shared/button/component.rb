class Shared::Button::Component < ViewComponent::Base
  def initialize(text:)
    @text = text
  end
end