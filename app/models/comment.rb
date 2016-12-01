class Comment < ActiveRecord::Base
	belongs_to :mem

  #after_create do |item|
  #  ActionController::Base.new.expire_fragment "comments_#{item.typ}_#{item.idcd}"
  #end
#
  #after_destroy do |item|
  #  ActionController::Base.new.expire_fragment "comments_#{item.typ}_#{item.idcd}"
  #end

	def friendly_time 
    created_at.friendly_i18n  
  end

  def raw_con
    TrustHtml.sanitize(GitHub::Markdown.render (con || '')).gsub(/@([^:：?\s@]+)/,"<a href='/mem/nc/\\1' target='_blank'>@\\1</a>")
    #(GitHub::Markdown.render con).gsub(/@([^:：?\s@]+)/,"<a href='/mem/nc/\\1' target='_blank'>@\\1</a>")
  end

  def target
    {
      :REPO=> Repo,
      :REPOEXPERIENCE=> Repo,
      :TOPIC=> Topic,
      :CODE=> Code
    }[typ.to_sym].send :find,idcd
  end

  def target_url
    if typ == "REPO"
      return  "#{target.link_url}"
    end
    if typ == "TOPIC"
      return  "/source/#{idcd}"
    end
  end

  def target_name
    if typ == "REPO"
      return target.name
    end
    if typ == "TOPIC"
      return  target.title
    end
  end
end
