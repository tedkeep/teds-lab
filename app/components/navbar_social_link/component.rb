class NavbarSocialLink::Component < ViewComponent::Base
  with_collection_parameter :item

  def initialize(item:)
    @item = item
  end
end