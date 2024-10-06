module StoriesHelper
  def story_url(story)
    fetch_story_attribute(story, :url)
  end

  def story_title(story)
    fetch_story_attribute(story, :title)
  end

  def story_author(story)
    fetch_story_attribute(story, :author)
  end

  def story_type(story)
    fetch_story_attribute(story, :type)
  end

  def story_published_at(story)
    published_at = fetch_story_attribute(story, :published_at)

    story_published_time = if published_at.is_a?(Integer)
                             Time.at(published_at)
                           else
                             Time.parse(published_at.to_s)
                           end

    story_published_time.strftime('%B %d, %Y %I:%M %p %Z')
  end


  private

  def fetch_story_attribute(story, attribute)
    story.respond_to?(attribute) ? story.public_send(attribute) : story[attribute]
  end
end