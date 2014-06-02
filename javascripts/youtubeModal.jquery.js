(function() {
  var $, log;

  log = function(m) {
    return console.log(m);
  };

  $ = jQuery;

  $.fn.youtubeModal = function(options) {
    var addModal, closeModal, createModal, defaults, setPosition, start;
    defaults = {
      activate: '',
      youtubeModal: '.youtubeModal',
      youtubeModalWrapper: '.youtube-modal-wrapper',
      youtubeInner: '.youtube-modal-inner',
      cover: '#coverItUp',
      width: '80%'
    };
    options = $.extend(defaults, options);
    $('body').on('click', options.activate, function() {
      return start(this);
    });
    $('body').on('click', options.cover, function() {
      return closeModal();
    });
    $(window).resize(function() {
      return setPosition();
    });
    start = function(item) {
      var modal, vid;
      vid = $(item).data('id');
      modal = createModal(vid);
      addModal(modal);
      return setPosition();
    };
    setPosition = function() {
      var height, marginLeft, marginTop, threshold, vpHeight, vpWidth, width;
      threshold = 100;
      vpHeight = $(window).height();
      vpWidth = $(window).width();
      height = $(options.youtubeModalWrapper).outerHeight();
      width = $(options.youtubeModalWrapper).outerWidth();
      log(width);
      if ((height + threshold) > vpHeight) {
        log('oh shit we are too tall');
      }
      marginTop = '-' + height / 2 + 'px';
      marginLeft = '-' + width / 2 + 'px';
      return $(options.youtubeModalWrapper).css({
        'margin-top': marginTop,
        'margin-left': marginLeft
      });
    };
    createModal = function(vid) {
      var iframe_dom;
      iframe_dom = "<iframe frameborder='0' allowfullscreen='' src='http://www.youtube.com/embed/'" + vid + "?rel=0&autoplay=1&loop=0&wmode=opaque\" marginwidth=\"0\" marginheight=\"0\"></iframe>";
      return " <div class='youtube-modal-wrapper'> \n	<div class='youtube-modal-inner'>\n		" + iframe_dom + "\n	</div>\n</div>";
    };
    addModal = function(modal) {
      var cover;
      cover = "<div id='coverItUp'></div>";
      $('body').append(cover + modal);
      return $(options.youtubeModalWrapper).css('width', options.width);
    };
    return closeModal = function() {
      log('close modal');
      if ($(options.cover).length) {
        $(options.cover).remove();
      }
      return $(options.youtubeModalWrapper).remove();
    };
  };

}).call(this);
