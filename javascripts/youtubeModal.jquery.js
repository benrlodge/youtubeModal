(function() {
  var $, log;

  log = function(m) {
    return console.log(m);
  };

  $ = jQuery;

  $.fn.youtubeModal = function(options) {
    var addModal, closeModal, createModal, defaults, start;
    defaults = {
      youtubeModal: '.youtubeModal',
      modal: '.youtube-modal'
    };
    options = $.extend(defaults, options);
    start = function(item) {
      var modal, vid;
      vid = $(item).data('id');
      modal = createModal(vid);
      return addModal(modal);
    };
    createModal = function(vid) {
      var iframe_dom, modal_dom;
      iframe_dom = "<iframe frameborder='0' allowfullscreen='' src='http://www.youtube.com/embed/'" + vid + "?rel=0&autoplay=1&loop=0&wmode=opaque\" marginwidth=\"0\" marginheight=\"0\">\n</iframe>";
      return modal_dom = "<div class='youtube-modal-wrapper'> \n	<div class='youtube-modal-inner'>\n		" + iframe_dom + "\n	</div>\n</div>";
    };
    addModal = function(modal) {
      var cover;
      cover = "<div id='coverItUp'></div>";
      return $('body').append(cover + modal);
    };
    closeModal = function() {
      return log('close modal');
    };
    return $('body').on('click', options.youtubeModal, function() {
      return start(this);
    });
  };

}).call(this);
