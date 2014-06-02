log = (m) ->
	console.log m



(($) ->
	current = null
	
	$.modal = (el, options) ->
		log 'stuff'


	# Prototypes
	$.modal:: =
		
		constructor: $.modal
		
		open: ->


		close: ->


		block: ->


		unblock: ->


		show: ->


		hide: ->


		showSpinner: ->


		hideSpinner: ->


		center: ->





	$.fn.modal = (options) ->
		current = new $.modal(this, options)  if @length is 1
		return this

  
  
	# Automatically bind links with rel="modal:close" to, well, close the modal.
	$(document).on "click.modal", "a[rel='modal:close']", $.modal.close
	$(document).on "click.modal", "a[rel='modal:open']", (event) ->
		event.preventDefault()
		$(this).modal()


) jQuery