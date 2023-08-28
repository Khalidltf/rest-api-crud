class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: articles, status: 200
  end

  def show
    article = Article.find_by(id: params[:id])
    if article
      render json: article, status: 200
    else
      render json: {
        error: '4044 Error'
      }
    end

  end

  def create
    article = Article.new(
      title: article_params[:title],
      body: article_params[:body],
      author: article_params[:author]
    )
    if article.save!
      render json: article, status: 200
    else
      render json: {
        error: '4044 Error'
      }
    end
  end

  def update
    article = Article.find_by(id: params[:id])
    if article
      article.update(
        title: article_params[:title],
        body: article_params[:body],
        author: article_params[:author]
      )
      render json: 'Article updated succ...'
    else
      render json: {
        error: 'error ... '
      }
    end
  end

  def destroy
    article = Article.find_by(id: params[:id])

    if article
      article.destroy
      render json: "Article has been destroyed succ ..."
    else
      render json: {
        error: 'erroe ... '
      }
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :author)
  end
end
