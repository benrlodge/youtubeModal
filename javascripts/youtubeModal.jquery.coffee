log = (m) ->
	console.log m

$ = jQuery


$.fn.youtubeModal = (options) ->
	defaults = 
		youtubeModal: '.youtubeModal'
		modal: '.youtube-modal'

	options = $.extend(defaults, options)
	

	

	start = (item) ->
		vid = $(item).data('id')
		modal = createModal(vid)
		addModal(modal)
		

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



