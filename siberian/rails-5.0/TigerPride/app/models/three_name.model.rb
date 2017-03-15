class ThreeName < ApplicationRecord
    def name
        pre =
            if title.nil?
                ''
            else
                title + ' '
            end
        mid =
            if middle.nil?
                ''
            else
                ' ' + middle + ' '
            end
        pos =
            if suffix.nil?
                ''
            else
                ' ' + suffix
            end
        pre + given + mid + family + pos
    end
end
