log = (m) ->
	console.log m

$ = jQuery


$.fn.youtubeModal = (options) ->
	defaults = 
		youtubeModal: '.youtubeModal'
		youtubeModalWrapper: '.youtube-modal-wrapper'
		youtubeInner: '.youtube-modal-inner'
		cover: '#coverItUp'


	options = $.extend(defaults, options)
	

	start = (item) ->
		vid = $(item).data('id')		
		modal = createModal(vid)
		addModal(modal)
		topPosition()

	topPosition = () ->
		## OVERIDE
		if $(options.youtubeModalWrapper).length
			height = $(options.youtubeModalWrapper).outerHeight()
			marginTop = '-' + height/2 + 'px'
			log marginTop

			$(options.youtubeModalWrapper).css('margin-top',marginTop)


	aspectRatio = (ar) ->

		# $(options.youtubeInner).css('padding-bottom', ar )


	createModal = (vid) ->		
		iframe_dom = """<iframe frameborder='0' allowfullscreen='' src='http://www.youtube.com/embed/'#{vid}?rel=0&autoplay=1&loop=0&wmode=opaque" marginwidth="0" marginheight="0">
					</iframe>"""
		
		return modal_dom = """
						<div class='youtube-modal-wrapper'> 
							<div class='youtube-modal-inner'>
								#{iframe_dom}
							</div>
						</div>
					"""
	
		
	addModal = (modal) ->
		## Add background cover
		cover = "<div id='coverItUp'></div>"
		$('body').append(cover+modal)



	closeModal = ->
		log 'close modal'


	$('body').on 'click', options.youtubeModal, -> start(this)
	$('body').on 'click', options.cover, -> $(options.cover).remove() if $(options.cover).length
	$(window).resize -> topPosition()
	

	$(options.youtubeModal).each ->
		ht = $(this).data('height')
		wt = $(this).data('width')
		
		ar = ht/wt
		
		$(this).attr('ar',ar)





