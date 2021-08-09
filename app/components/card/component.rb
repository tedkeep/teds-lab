class Card::Component < ViewComponent::Base
  def initialize(title:, description: nil, link:)
    @title = title
    @description = description
    @link = link
  end
end