class CkeditorInput < SimpleForm::Inputs::DateTimeInput
  def input
    "$ #{@builder.text_field(attribute_name, input_html_options)}".html_safe
    input_html_options[:class] << "ckeditor"
    @builder.text_area( attribute_name, input_html_options )
  end
end
