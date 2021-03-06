module Pwfmt::WikiFormattingPatch
  def to_html(format, text, options = {})
    if text.respond_to?(:wiki_format) && Redmine::WikiFormatting.format_names.include?(text.wiki_format)
      super(text.wiki_format, text, options)
    else
      super(format, text, options)
    end
  end
end

Redmine::WikiFormatting.singleton_class.prepend(Pwfmt::WikiFormattingPatch)
