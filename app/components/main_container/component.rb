class MainContainer::Component < ViewComponent::Base
  def initialize(styles: nil)
    @styles = styles
  end
end