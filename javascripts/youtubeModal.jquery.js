(function() {
  var $, log;

  log = function(m) {
    return console.log(m);
  };

  $ = jQuery;

  $.fn.youtubeModal = function(options) {
    var addModal, aspectRatio, closeModal, createModal, defaults, start, topPosition;
    defaults = {
      youtubeModal: '.youtubeModal',
      youtubeModalWrapper: '.youtube-modal-wrapper',
      youtubeInner: '.youtube-modal-inner',
      cover: '#coverItUp'
    };
    options = $.extend(defaults, options);
    start = function(item) {
      var modal, vid;
      vid = $(item).data('id');
      modal = createModal(vid);
      addModal(modal);
      return topPosition();
    };
    topPosition = function() {
      var height, marginTop;
      if ($(options.youtubeModalWrapper).length) {
        height = $(options.youtubeModalWrapper).outerHeight();
        marginTop = '-' + height / 2 + 'px';
        log(marginTop);
        return $(options.youtubeModalWrapper).css('margin-top', marginTop);
      }
    };
    aspectRatio = function(ar) {};
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
    $('body').on('click', options.youtubeModal, function() {
      return start(this);
    });
    $('body').on('click', options.cover, function() {
      if ($(options.cover).length) {
        return $(options.cover).remove();
      }
    });
    $(window).resize(function() {
      return topPosition();
    });
    return $(options.youtubeModal).each(function() {
      var ar, ht, wt;
      ht = $(this).data('height');
      wt = $(this).data('width');
      ar = ht / wt;
      return $(this).attr('ar', ar);
    });
  };

}).call(this);
