class SubjectController < ApplicationController
  before_action :admin_login,:only=> ["new","update"]
  before_action :subject_lost,:except=> ["new","update"]

  def subject_lost
    @item = Subject.find_by_key params[:key]
  end
  def new
    @item = Subject.new
  end

  def edit
    render "new"
  end

  def update
    @item = Subject.find_by_id(params[:subject][:id]) || Subject.new
    @item.update_attributes(params.require(:subject).permit(Subject.attribute_names))
    redirect_to "/admin/subjects"
  end

  def admins
    _where = {:typcd=> 'Admins'}
    @items = data_list(Repo.where(_where).order('(stargazers_count + forks_count + subscribers_count) desc'))
    @count = Repo.where(_where).count
  end

  def videos
    #_where = {:typcd=> 'Video'}
    query = Repo.where('hidetags like ?', '%player%')
    @items = data_list(query.order('(stargazers_count + forks_count + subscribers_count) desc'))
    @count = query.count
  end
end
