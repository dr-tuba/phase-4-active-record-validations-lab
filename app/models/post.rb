class Post < ApplicationRecord    
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_is_clickbait

    def title_is_clickbait
        titles = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
        unless titles.any? { |i| i.match(title) }
            errors.add(:title, "Must be click bait title")
        end
    end
end
