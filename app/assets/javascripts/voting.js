$( document ).ready(function() {
  $('a').click(function (e) {
    e.preventDefault()
    console.log(this)
    console.log('href', this.getAttribute('href'))
    $.ajax({
      type: "PUT",
      url: this.getAttribute('href'),
      async: true,
      data: "alarm[up]=true",
    });
    return false;
  });
});