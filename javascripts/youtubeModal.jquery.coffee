$ = jQuery

log = (m) -> console.log m

$.fn.youtubeModal = (options) ->
	defaults = 
		vid: ''
		youtubeModalWrapper: '.youtube-modal-wrapper'
		youtubeInner: '.youtube-modal-inner'
		cover: '#coverItUp'
		width: '80%'
		autoplay: true
		closeBtn: '.youtube-modal__close-btn'

	
	options = $.extend(defaults, options)
	
	createModal = () ->		
		if options.autoplay then autoplay = 1 else autoplay = 0

		iframe_dom = """<iframe frameborder='0' allowfullscreen='' src='http://www.youtube.com/embed/#{options.vid}?rel=0&autoplay=#{autoplay}&wmode=opaque' marginwidth='0' marginheight='0'></iframe>"""
		
		return """ <div class='youtube-modal-wrapper'> 
						<img class='youtube-modal__close-btn' src="img/close-icon.png">
						<div class='youtube-modal-inner'>
							#{iframe_dom}
						</div>
					</div>
				"""
		
	start = (item) ->
		modal = createModal()
		addModal(modal)
		setPosition()

	setPosition = () ->
		vpHeight = $(window).height()
		vpWidth =  $(window).width() 
		height = $(options.youtubeModalWrapper).outerHeight()
		width = $(options.youtubeModalWrapper).outerWidth()
		marginTop = '-'  + height/2 + 'px'
		marginLeft = '-' + width/2 + 'px'

		$(options.youtubeModalWrapper).css({
			'margin-top': marginTop
			'margin-left': marginLeft
		})

	addModal = (modal) ->
		cover = "<div id='coverItUp'></div>"
		$('body').append(cover+modal)
		$(options.youtubeModalWrapper).css('width',options.width)

	closeModal = ->
		$(options.cover).remove() if $(options.cover).length
		$(options.youtubeModalWrapper).remove() 

	@each ->
		thisVid = '#' + $(this).attr('id')
		options.vid = $(this).data('id')

		$('body').on 'click', thisVid, -> start(this)
		$('body').on 'click', options.cover, -> closeModal()
		$('body').on 'click', options.closeBtn, -> closeModal()
		$(window).resize -> setPosition()


