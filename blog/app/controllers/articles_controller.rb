class ArticlesController < ApplicationController

  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new

    def edit
      @article = Article.find(params[:id])
    end
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    # 在 create 动作中，当 save 返回 false 时，我们用 render 代替了 redirect_to。
    # 使用 render 方法是为了把 @article 对象回传给 new 模板。这里渲染操作是在提交表单的这个请求中完成的，
    # 而 redirect_to 会告诉浏览器发起另一个请求。
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    # 不用把所有属性都传递给 update 方法。例如，
    # 调用 @article.update(title: 'A new title') 时，Rails 只更新 title 属性而不修改其他属性。
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
