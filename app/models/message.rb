class Message
  include ActiveAttr::Model

  attribute :name
  attribute :subject
  attribute :email
  attribute :content

  validates_presence_of :name,    :email, :subject
  validates_format_of   :email,   with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\Z/i
  validates_length_of   :content, maximum: 500
end
