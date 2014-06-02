log = (m) ->
	console.log m




$ = jQuery

$.fn.youtubeModal = (options) ->
	defaults = 
		activate: ''
		vid: ''
		youtubeModal: '.youtubeModal'
		youtubeModalWrapper: '.youtube-modal-wrapper'
		youtubeInner: '.youtube-modal-inner'
		cover: '#coverItUp'
		width: '80%'


	options = $.extend(defaults, options)
	

	$('body').on 'click', options.activate, -> start(this)
	$('body').on 'click', options.cover, -> closeModal()
	$(window).resize -> setPosition()


	start = (item) ->
		log 'AND THE ID IS'
		log options.id
		modal = createModal()
		addModal(modal)
		setPosition()




	setPosition = () ->
		
		threshold = 100

		vpHeight = $(window).height()
		vpWidth =  $(window).width() 

		height = $(options.youtubeModalWrapper).outerHeight()
		width = $(options.youtubeModalWrapper).outerWidth()


		log width
		

		#check if video going out of viewport
		if (height + threshold) > vpHeight
			log 'oh shit we are too tall'

		
		marginTop = '-'  + height/2 + 'px'
		marginLeft = '-' + width/2 + 'px'

		$(options.youtubeModalWrapper).css({
			'margin-top': marginTop
			'margin-left': marginLeft
			})




	createModal = () ->		
		iframe_dom = """<iframe frameborder='0' allowfullscreen='' src='http://www.youtube.com/embed/#{options.vid}?rel=0&autoplay=1&loop=0&wmode=opaque' marginwidth='0' marginheight='0'></iframe>"""
		
		return """ <div class='youtube-modal-wrapper'> 
						<div class='youtube-modal-inner'>
							#{iframe_dom}
						</div>
					</div>
				"""
	
		
	addModal = (modal) ->
		cover = "<div id='coverItUp'></div>"
		$('body').append(cover+modal)
		$(options.youtubeModalWrapper).css('width',options.width)


	closeModal = ->
		$(options.cover).remove() if $(options.cover).length
		$(options.youtubeModalWrapper).remove() 
		


	@each ->
		options.activate = $(this).attr('id')
		options.vid = $(this).data('id')
