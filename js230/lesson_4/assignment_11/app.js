$(function() {
  let postTemplate = Handlebars.compile($("#post").html());
  // let postTemplate = Handlebars.compile(document.getElementById('post').innerHTML);

  Handlebars.registerPartial('tag', $("#tag").html());

  $("body").append(postTemplate({posts: posts}));
});

let post = {
  title: 'Lorem ipsum dolor sit amet',
  published: 'April 1, 2015',
  body: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.'
};

post.body = '<p>' + post.body + '<p>';
post.tags = ['Food', 'Cooking', 'Vegetables'];

let posts = [];
posts.push(post);

let postTwo = {
  title: 'Test Title',
  published: 'February 9, 1994',
  body: 'This is the test body',
};

posts.push(postTwo);
