module HTML
  class Pipeline
    module JollyGoodCode
      class EmojiFilter < HTML::Pipeline::Filter
        def call
          Twemoji.parse(doc,
            file_ext: context[:file_ext] || "svg",
            class_name: context[:class_name] || "emoji",
            img_attrs:  context[:img_attrs] || {},
          )
        end
      end
    end
  end
end
