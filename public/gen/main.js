(function() {
  var init_bootstrap;

  $(function() {
    return init_bootstrap();
  });

  init_bootstrap = function() {
    $(".alert-message").alert();
    $(".tabs").button();
    $(".carousel").carousel();
    $(".collapse").collapse();
    $(".dropdown-toggle").dropdown();
    $(".modal").modal();
    $("a[rel=popover]").popover();
    $(".navbar").scrollspy();
    $(".tab").tab("show");
    $(".tooltip").tooltip();
    $(".typeahead").typeahead();
    return $("a[rel=tooltip]").tooltip();
  };

}).call(this);
