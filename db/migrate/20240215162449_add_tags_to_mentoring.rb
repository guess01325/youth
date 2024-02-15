class AddTagsToMentoring < ActiveRecord::Migration[7.1]
  def change
    add_column :mentorings, :tags, :text, array: true, default: ["In Person", "online", "yes", "no", "one OnOne","Creative Foundation", "Video Games and Life Skills", "Facebook", "Instagram", "Word Of Mouth", "Event Invite", "Website"]
  end
end
