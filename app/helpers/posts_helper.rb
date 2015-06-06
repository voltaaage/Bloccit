module PostsHelper

  def markdown_title
    #@post = Post.find(params[:id])
    markdown_to_html(@post.title)
  end

  def markdown_body
    #@post = Post.find(params[:id])
    markdown_to_html(@post.body)
  end

  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end
  
end
